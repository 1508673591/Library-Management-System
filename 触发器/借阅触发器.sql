USE [图书借阅管理系统]
GO
/****** Object:  Trigger [dbo].[trig_insert_jieyue]    Script Date: 2020/7/4 11:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trig_insert_jieyue]
ON [dbo].[借阅]
FOR INSERT AS
  DECLARE @校园卡编号 INT,@已借册数 INT,@可借册数 INT,@读者类型编号 CHAR(10),@未交罚款金额 NUMERIC(8,2),@图书编号 VARCHAR(20)
  SET @校园卡编号 = (SELECT TOP 1 校园卡编号 FROM inserted) 
  SET @图书编号 = (SELECT TOP 1 图书编号 FROM inserted)
  SET @已借册数 = (SELECT 已借册数 FROM 读者 WHERE 校园卡号=@校园卡编号)
  SET @读者类型编号 = (SELECT 读者类型编号 FROM 读者 WHERE 校园卡号=@校园卡编号)
  SET @未交罚款金额 = (SELECT 未交罚款金额 FROM 读者 WHERE 校园卡号=@校园卡编号)
  SET @可借册数 =(SELECT 可借阅册数 FROM 读者类型 WHERE 读者类型编号=@读者类型编号)
  IF @已借册数> @可借册数
  BEGIN
     RAISERROR('读者已借够可借册数!',16,1)
     ROLLBACK TRANSACTION
  END
  ELSE IF @未交罚款金额>100
  BEGIN
     RAISERROR('读者有未交罚款!',16,1)
     ROLLBACK TRANSACTION
  END
  ELSE
   BEGIN
    UPDATE 读者
    SET 图书借阅次数=图书借阅次数+1
    WHERE 校园卡号= @校园卡编号
    UPDATE 图书
    SET 借出次数=借出次数+1,现存量=现存量-1
    WHERE 图书编号= @图书编号
  END
GO