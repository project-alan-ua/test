﻿-- Function: gpGet_Object_StoredProcExternal()

DROP FUNCTION IF EXISTS gpGet_Object_StoredProcExternal (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Object_StoredProcExternal(
    IN inId          Integer,       
    IN inSession     TVarChar       -- сессия пользователя
)
RETURNS TABLE (Id       Integer
             , Code     Integer
             , Name     TVarChar
             , isErased Boolean
              ) 
AS
$BODY$
BEGIN

      -- проверка прав пользователя на вызов процедуры
      -- PERFORM lpCheckRight(inSession, zc_Enum_Process_StoredProcExternal());

      IF COALESCE (inId, 0) = 0
      THEN
           RETURN QUERY
             SELECT 0::Integer   AS Id
                  , (COALESCE(MAX (Object.ObjectCode), 0) + 1)::Integer AS Code
                  , ''::TVarChar AS Name
                  , false        AS isErased
             FROM Object
             WHERE Object.DescId = zc_Object_StoredProcExternal();
      ELSE
           RETURN QUERY
             SELECT Object.Id
                  , Object.ObjectCode AS Code
                  , Object.ValueData  AS Name
                  , Object.isErased
             FROM Object
             WHERE Object.Id = inId;
      END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------*/
/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И.   Шаблий О.В.
  18.08.23                                                      *
*/

-- тест
-- SELECT * FROM gpGet_Object_StoredProcExternal(inId:= 0, inSession:= zfCalc_UserAdmin())
-- SELECT * FROM gpGet_Object_StoredProcExternal(inId:= COALESCE ((SELECT Id FROM Object WHERE DescId = zc_Object_StoredProcExternal() LIMIT 1), 0), inSession:= zfCalc_UserAdmin())
