CREATE VIEW 入库单(入库单编号,入库日期,经手人姓名,是否已入库,图书编号,书名,入库数量)
 AS
 SELECT 图书入库单.入库单编号,图书入库单.入库日期,管理员.管理员姓名,图书入库单.是否入库,图书入库单明细.图书编号,图书.书名,图书入库单明细.数量
 FROM 图书入库单,图书入库单明细,管理员,图书
 WHERE 图书入库单明细.入库单编号=图书入库单.入库单编号 AND 图书入库单明细.图书编号=图书.图书编号 AND 图书入库单.经手人编号=管理员.管理员编号 