-- Function: gpReport_AccountExternal()

DROP FUNCTION IF EXISTS gpReport_AccountExternal2 (TDateTime, TDateTime, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_AccountExternal2 (
    IN inStartDate              TDateTime ,
    IN inEndDate                TDateTime ,
    IN inAccountId              Integer ,
    IN inSession                TVarChar    -- сессия пользователя
)
RETURNS TABLE (InvNumber BigInt, OperDate TDateTime
             , CLIENTCODE Integer, CLIENTINN TVarChar, CLIENTOKPO TVarChar, CLIENTNAME TVarChar
             , SUMA TFloat, PDV TFloat, SUMAPDV TFloat
             , OPERDATEC TDateTime, INVNUMBERC TVarChar, COMMENT TVarChar
              )
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- проверка прав пользователя на вызов процедуры
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Report_Account());
     vbUserId:= lpGetUserBySession (inSession);

    -- !!!Только просмотр Аудитор!!!
    PERFORM lpCheckPeriodClose_auditor (inStartDate, inEndDate, NULL, NULL, NULL, vbUserId);


    -- Результат
    RETURN QUERY
       WITH tmpContainer AS  (SELECT Container.Id AS ContainerId, Container.ObjectId AS AccountId, Container.Amount, ContainerLO_Juridical.ObjectId AS JuridicalId
                              FROM Container
                                   LEFT JOIN ContainerLinkObject AS ContainerLO_Juridical ON ContainerLO_Juridical.ContainerId = Container.Id
                                                                                         AND ContainerLO_Juridical.DescId      = zc_ContainerLinkObject_Unit()
                                   INNER JOIN ContainerLinkObject AS ContainerLO_PaidKind ON ContainerLO_PaidKind.ContainerId = Container.Id
                                                                                         AND ContainerLO_PaidKind.DescId      = zc_ContainerLinkObject_PaidKind()
                                                                                         AND ContainerLO_PaidKind.ObjectId    = zc_Enum_PaidKind_FirstForm()
                              WHERE Container.ObjectId = 9179 -- 70301 Кредиторы + Услуги по маркетингу
                                AND Container.DescId   = zc_Container_Summ()
                             )
       , tmpReport_all_all AS (SELECT tmpContainer.JuridicalId
                                    , MIContainer.MovementId
                                    , -1 * SUM (MIContainer.Amount) AS SummOut
                               FROM tmpContainer
                                    JOIN MovementItemContainer AS MIContainer ON MIContainer.Containerid = tmpContainer.ContainerId
                                                                              AND MIContainer.OperDate BETWEEN inStartDate AND inEndDate
                                                                              AND (MIContainer.Amount < 0 OR MIContainer.AccountId = zc_Enum_Account_100301())
                               GROUP BY tmpContainer.JuridicalId
                                      , MIContainer.MovementId
                               -- HAVING SUM (MIContainer.Amount) <> 0
                              )
       , tmpReport_all AS (SELECT tmpReport.MovementId, Movement.InvNumber, Movement.OperDate
                                , tmpReport.JuridicalId, Object_Juridical.ObjectCode AS JuridicalCode, Object_Juridical.ValueData AS JuridicalName
                                , ObjectHistory_JuridicalDetails_ViewByDate.INN, ObjectHistory_JuridicalDetails_ViewByDate.OKPO
                                , tmpReport.SummOut
                           FROM tmpReport_all_all AS tmpReport
                                LEFT JOIN Movement ON Movement.Id = tmpReport.MovementId
                                LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = tmpReport.JuridicalId
                                INNER JOIN ObjectHistory_JuridicalDetails_ViewByDate ON ObjectHistory_JuridicalDetails_ViewByDate.JuridicalId = tmpReport.JuridicalId
                                                                                    AND ObjectHistory_JuridicalDetails_ViewByDate.EndDate     = zc_DateEnd()
                          )

, tmpReport AS  (SELECT tmpReport_all.InvNumber, tmpReport_all.OperDate
                                , tmpReport_all.JuridicalCode AS ObjectCode_Direction
                                , tmpReport_all.INN
                                , tmpReport_all.OKPO
                                , tmpReport_all.JuridicalName AS ObjectName_Direction
                                , (tmpReport_all.SummOut/1.2)::TFloat AS SUMA, (tmpReport_all.SummOut - tmpReport_all.SummOut/1.2)::TFloat AS PDV, tmpReport_all.SummOut AS SUMAPDV

                                , MovementDate_OperDatePartner.ValueData             AS OperDatePartner
                                , MovementString_InvNumberPartner.ValueData          AS InvNumberPartner
                                , COALESCE (MIString_Comment.ValueData, '')          AS Comment
                                , tmpReport_all.MovementId

                           FROM tmpReport_all

                                   LEFT JOIN MovementItem ON MovementItem.MovementId = tmpReport_all.MovementId

                                   LEFT JOIN MovementItemString AS MIString_Comment
                                                                ON MIString_Comment.MovementItemId = MovementItem.Id
                                                               AND MIString_Comment.DescId = zc_MIString_Comment()

                                   LEFT JOIN MovementDate AS MovementDate_OperDatePartner
                                                          ON MovementDate_OperDatePartner.MovementId = tmpReport_all.MovementId
                                                         AND MovementDate_OperDatePartner.DescId = zc_MovementDate_OperDatePartner()

                                   LEFT JOIN MovementString AS MovementString_InvNumberPartner
                                                            ON MovementString_InvNumberPartner.MovementId =  tmpReport_all.MovementId
                                                           AND MovementString_InvNumberPartner.DescId = zc_MovementString_InvNumberPartner()

                           WHERE tmpReport_all.SummOut <> 0
                          )
             , tmpMS_InvNumberInvoice AS (SELECT * FROM MovementString AS MS WHERE MS.MovementId IN (SELECT DISTINCT tmpReport.MovementId FROM tmpReport)
                                                                               AND MS.DescId     = zc_MovementString_InvNumberInvoice()
                                         )
       --
       SELECT MAX (lpReport.InvNumber)  :: BigInt AS InvNumber, MAX (lpReport.OperDate) :: TDateTime AS OperDate
            , lpReport.ObjectCode_Direction, lpReport.INN
            , lpReport.OKPO, lpReport.ObjectName_Direction
            , SUM (lpReport.SUMA)::TFloat, SUM (lpReport.PDV)::TFloat, SUM (lpReport.SUMAPDV)::TFloat

            , MAX (lpReport.OperDatePartner) :: TDateTime AS OperDatePartner
            , MAX (lpReport.InvNumberPartner) :: TVarChar AS InvNumberPartner
            , (MAX (lpReport.Comment) || CASE WHEN COALESCE (tmpMS_InvNumberInvoice.ValueData, '') <> '' THEN ' ' || COALESCE (tmpMS_InvNumberInvoice.ValueData, '') ELSE '' END) :: TVarChar AS COMMENT

       FROM tmpReport AS lpReport
            LEFT JOIN tmpMS_InvNumberInvoice ON tmpMS_InvNumberInvoice.MovementId = lpReport.MovementId
       GROUP BY
                lpReport.ObjectCode_Direction, lpReport.INN
              , lpReport.OKPO, lpReport.ObjectName_Direction
              , COALESCE (tmpMS_InvNumberInvoice.ValueData, '')
              , CASE WHEN COALESCE (tmpMS_InvNumberInvoice.ValueData, '') <> '' THEN COALESCE (tmpMS_InvNumberInvoice.ValueData, '') ELSE lpReport.MovementId :: TVarChar END
               ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И.   Манько Д.
 15.09.14                          *
*/

-- тест
-- SELECT * FROM gpReport_AccountExternal (inStartDate:= '01.09.2025', inEndDate:= '30.09.2025', inAccountId:= 0, inSession:= zfCalc_UserAdmin());
-- SELECT * FROM gpReport_AccountExternal2 (inStartDate := ('01.09.2024')::TDateTime , inEndDate := ('30.09.2024')::TDateTime , inAccountId := 0 ,  inSession := zfCalc_UserAdmin());
