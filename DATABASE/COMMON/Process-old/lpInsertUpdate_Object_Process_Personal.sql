-- ��������� �������
CREATE OR REPLACE FUNCTION zc_Enum_Process_Select_Object_Personal() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT ObjectId AS Id FROM ObjectString WHERE ValueData = 'zc_Enum_Process_Select_Object_Personal' AND DescId = zc_ObjectString_Enum()); END; $BODY$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION zc_Enum_Process_Get_Object_Personal() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT ObjectId AS Id FROM ObjectString WHERE ValueData = 'zc_Enum_Process_Get_Object_Personal' AND DescId = zc_ObjectString_Enum()); END; $BODY$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION zc_Enum_Process_InsertUpdate_Object_Personal() RETURNS Integer AS $BODY$BEGIN RETURN (SELECT ObjectId AS Id FROM ObjectString WHERE ValueData = 'zc_Enum_Process_InsertUpdate_Object_Personal' AND DescId = zc_ObjectString_Enum()); END; $BODY$ LANGUAGE plpgsql;

-- ����������� �������� ����������� (zc_Object_Process)
DO $$
BEGIN
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Process_Select_Object_Personal(), inDescId:= zc_Object_Process(), inCode:= lfGet_ObjectCode_byEnum ('zc_Enum_Process_Select_Object_Personal'), inName:= '�������� ��������� ������', inEnumName:= 'zc_Enum_Process_Select_Object_Personal');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Process_Get_Object_Personal(), inDescId:= zc_Object_Process(), inCode:= lfGet_ObjectCode_byEnum ('zc_Enum_Process_Get_Object_Personal'), inName:= '�������� ������� ������', inEnumName:= 'zc_Enum_Process_Get_Object_Personal');
     PERFORM lpInsertUpdate_Object_Enum (inId:= zc_Enum_Process_InsertUpdate_Object_Personal(), inDescId:= zc_Object_Process(), inCode:= lfGet_ObjectCode_byEnum ('zc_Enum_Process_InsertUpdate_Object_Personal'), inName:= '�������� ���������� ������', inEnumName:= 'zc_Enum_Process_InsertUpdate_Object_Personal');
END $$;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 01.07.13          *                             

*/