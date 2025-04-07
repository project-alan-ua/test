-- Function: gpSelect_Object_Goods()

DROP FUNCTION IF EXISTS test_Execute_Sleep (TVarChar);

CREATE OR REPLACE FUNCTION test_Execute_Sleep(
    IN inId          Integer ,      -- ������ ID
    IN inSession     TVarChar       -- ������ ������������
)
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId := PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Object_Goods());
     vbUserId := inSession;
   
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION test_Execute_Sleep (TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 13.12.13                        * 
*/

-- ����
-- SELECT * FROM gpSelect_Object_Goods (inSession := zfCalc_UserAdmin())
-- SELECT * FROM gpSelect_Object_Goods (inSession := '9818')
