-- Function: gpSelect_Object_Goods()

DROP FUNCTION IF EXISTS test_Select_Object (TVarChar);

CREATE OR REPLACE FUNCTION test_Select_Object(
    IN inSession     TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer)
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId := PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Object_Goods());
     vbUserId := inSession;

     RETURN QUERY 
       SELECT Object.Id             
       FROM Object LIMIT 100;
  
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION test_Select_Object (TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 13.12.13                        * 
*/

-- ����
-- SELECT * FROM gpSelect_Object_Goods (inSession := zfCalc_UserAdmin())
-- SELECT * FROM gpSelect_Object_Goods (inSession := '9818')
