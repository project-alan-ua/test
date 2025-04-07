-- Function: gpMovementItem_ChoiceCell_SetErased (Integer, Integer, TVarChar)

DROP FUNCTION IF EXISTS gpMovementItem_ChoiceCell_SetErased (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpMovementItem_ChoiceCell_SetErased(
    IN inMovementItemId      Integer              , -- ключ объекта <Элемент документа>
   OUT outIsErased           Boolean              , -- новое значение
    IN inSession             TVarChar               -- текущий пользователь
)
  RETURNS Boolean
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- проверка прав пользователя на вызов процедуры
     -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_SetErased_MI_ChoiceCell());
     vbUserId:= lpGetUserBySession (inSession);

     -- устанавливаем новое значение
     outIsErased:= lpSetErased_MovementItem (inMovementItemId:= inMovementItemId, inUserId:= vbUserId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И. 
 24.08.24         *
*/

-- тест
-- SELECT * FROM gpMovementItem_ChoiceCell_SetErased (inMovementItemId:= 55, inSession:= '2')
