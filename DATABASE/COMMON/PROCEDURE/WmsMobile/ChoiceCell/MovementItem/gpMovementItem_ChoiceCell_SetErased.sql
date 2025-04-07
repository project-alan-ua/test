-- Function: gpMovementItem_ChoiceCell_SetErased (Integer, Integer, TVarChar)

DROP FUNCTION IF EXISTS gpMovementItem_ChoiceCell_SetErased (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpMovementItem_ChoiceCell_SetErased(
    IN inMovementItemId      Integer              , -- ���� ������� <������� ���������>
   OUT outIsErased           Boolean              , -- ����� ��������
    IN inSession             TVarChar               -- ������� ������������
)
  RETURNS Boolean
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_SetErased_MI_ChoiceCell());
     vbUserId:= lpGetUserBySession (inSession);

     -- ������������� ����� ��������
     outIsErased:= lpSetErased_MovementItem (inMovementItemId:= inMovementItemId, inUserId:= vbUserId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�. 
 24.08.24         *
*/

-- ����
-- SELECT * FROM gpMovementItem_ChoiceCell_SetErased (inMovementItemId:= 55, inSession:= '2')
