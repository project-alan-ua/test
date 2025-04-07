 alter TABLE movementitemprotocol set TABLESPACE bigdata;
 alter TABLE movementitemprotocol_arc set TABLESPACE bigdata;
 alter TABLE movementitemprotocol_arc_arc set TABLESPACE bigdata;

alter TABLE movementprotocol set TABLESPACE bigdata;
alter TABLE movementprotocol_arc set TABLESPACE bigdata;
alter TABLE movementprotocol_arc_arc set TABLESPACE bigdata;

alter TABLE Objectprotocol set TABLESPACE bigdata;

alter TABLE soldtable set TABLESPACE bigdata;

alter TABLE MovementBlob set TABLESPACE bigdata;

alter TABLE movementitemstring set TABLESPACE bigdata;
alter index idx_movementitemstring_descid_valuedata set TABLESPACE bigdata;
alter index idx_movementitemstring_movementitemid_descid set TABLESPACE bigdata;


alter TABLE container_data set TABLESPACE bigdata;
alter index idx_container_data_masterkeyvalue_childkeyvalue set TABLESPACE bigdata;
alter index idx_container_data_objectid_descid set TABLESPACE bigdata;
alter index idx_container_data_objectid_descid_all set TABLESPACE bigdata;
alter index idx_container_data_unique set TABLESPACE bigdata;
alter index idx_container_data_whereobjectid_amount set TABLESPACE bigdata;
alter index idx_container_data_whereobjectid_amount_all set TABLESPACE bigdata;

alter TABLE  historyCost set TABLESPACE bigdata;
alter index idx_historycost_containerid_startdate_enddate set TABLESPACE bigdata;

alter index idx_soldtable_areaid set TABLESPACE bigdata;
alter index idx_soldtable_branchid set TABLESPACE bigdata;
alter index idx_soldtable_branchid_personal set TABLESPACE bigdata;
alter index idx_soldtable_cityid set TABLESPACE bigdata;
alter index idx_soldtable_citykindid set TABLESPACE bigdata;
alter index idx_soldtable_contractid set TABLESPACE bigdata;
alter index idx_soldtable_contracttaggroupid set TABLESPACE bigdata;
alter index idx_soldtable_contracttagid set TABLESPACE bigdata;
alter index idx_soldtable_goodsgroupanalystid set TABLESPACE bigdata;
alter index idx_soldtable_goodsgroupid set TABLESPACE bigdata;
alter index idx_soldtable_goodsid set TABLESPACE bigdata;
alter index idx_soldtable_goodskindid set TABLESPACE bigdata;
alter index idx_soldtable_goodstagid set TABLESPACE bigdata;
alter index idx_soldtable_infomoneyid set TABLESPACE bigdata;
alter index idx_soldtable_juridicalid set TABLESPACE bigdata;
alter index idx_soldtable_measureid set TABLESPACE bigdata;
alter index idx_soldtable_operdate set TABLESPACE bigdata;
alter index idx_soldtable_paidkindid set TABLESPACE bigdata;
alter index idx_soldtable_partnerid set TABLESPACE bigdata;
alter index idx_soldtable_partnertagid set TABLESPACE bigdata;
alter index idx_soldtable_personalid set TABLESPACE bigdata;
alter index idx_soldtable_personaltradeid set TABLESPACE bigdata;
alter index idx_soldtable_provincecityid set TABLESPACE bigdata;
alter index idx_soldtable_provinceid set TABLESPACE bigdata;
alter index idx_soldtable_regionid set TABLESPACE bigdata;
alter index idx_soldtable_retailid set TABLESPACE bigdata;
alter index idx_soldtable_streetid set TABLESPACE bigdata;
alter index idx_soldtable_streetkindid set TABLESPACE bigdata;
alter index idx_soldtable_trademarkid set TABLESPACE bigdata;


alter index idx_movementitemprotocol_movementitemid set TABLESPACE bigdata;
alter index idx_movementitemprotocol_operdate set TABLESPACE bigdata;
alter index idx_movementitemprotocol_userid set TABLESPACE bigdata;

alter index idx_movementitemprotocol_arc_movementitemid set TABLESPACE bigdata;
alter index idx_movementitemprotocol_arc_operdate set TABLESPACE bigdata;
alter index idx_movementitemprotocol_arc_userid set TABLESPACE bigdata;

alter index idx_movementitemprotocol_arc_arc_movementitemid set TABLESPACE bigdata;
alter index idx_movementitemprotocol_arc_arc_operdate set TABLESPACE bigdata;
alter index idx_movementitemprotocol_arc_arc_userid set TABLESPACE bigdata;

alter index idx_movementprotocol_movementid set TABLESPACE bigdata;
alter index idx_movementprotocol_operdate set TABLESPACE bigdata;
alter index idx_movementprotocol_userid set TABLESPACE bigdata;

alter index idx_movementprotocol_arc_movementid set TABLESPACE bigdata;
alter index idx_movementprotocol_arc_operdate set TABLESPACE bigdata;
alter index idx_movementprotocol_arc_userid set TABLESPACE bigdata;

alter index idx_movementprotocol_arc_arc_movementid set TABLESPACE bigdata;
alter index idx_movementprotocol_arc_arc_operdate set TABLESPACE bigdata;
alter index idx_movementprotocol_arc_arc_userid set TABLESPACE bigdata;

alter index idx_objectprotocol_objectid set TABLESPACE bigdata;
alter index idx_objectprotocol_objectid_operdate set TABLESPACE bigdata;
alter index idx_objectprotocol_operdate set TABLESPACE bigdata;
alter index idx_objectprotocol_userid set TABLESPACE bigdata;
