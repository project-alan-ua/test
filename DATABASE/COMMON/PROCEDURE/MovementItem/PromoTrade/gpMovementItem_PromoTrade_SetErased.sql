-- Function: gpMovementItem_PromoTrade_SetErased (Integer, Integer, TVarChar)

DROP FUNCTION IF EXISTS gpMovementItem_PromoTrade_SetErased (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpMovementItem_PromoTrade_SetErased(
    IN inMovementItemId      Integer              , -- ���� ������� <������� ���������>
   OUT outIsErased           Boolean              , -- ����� ��������
    IN inSession             TVarChar               -- ������� ������������
)
RETURNS Boolean
AS
$BODY$
   DECLARE vbUserId          Integer;
   DECLARE vbMovementId      Integer;
   DECLARE vbStatusId  Integer;
BEGIN
  vbUserId:= lpCheckRight (inSession, zc_Enum_Process_SetErased_MI_PromoTrade());

  -- ������������� ����� ��������
  outIsErased := TRUE;

  -- ����������� ������ 
  UPDATE MovementItem SET isErased = TRUE WHERE Id = inMovementItemId
         RETURNING MovementId INTO vbMovementId;

  -- ���������� <������>
  vbStatusId := (SELECT StatusId FROM Movement WHERE Id = vbMovementId);
  -- �������� - �����������/��������� ��������� �������� ������
  IF vbStatusId <> zc_Enum_Status_UnComplete()
  THEN
      RAISE EXCEPTION '������.��������� ��������� � ������� <%> �� ��������.', lfGet_Object_ValueData (vbStatusId);
  END IF;

  -- ����������� �������� ����� �� ���������
  PERFORM lpInsertUpdate_MovementFloat_TotalSumm (vbMovementId);

  -- !!! �� ������� - ������ ���� ���������� ��������!!!
  -- outIsErased := FALSE;


END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 08.09.24         *
*/
