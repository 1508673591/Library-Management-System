GO
CREATE TRIGGER trig_delete_tsrkdmx
ON ͼ����ⵥ��ϸ
FOR DELETE AS
  DECLARE @�Ƿ���� INT,@��ⵥ��� INT
  SET @��ⵥ��� = (SELECT TOP 1 ��ⵥ��� FROM deleted)
  SET @�Ƿ���� = (SELECT �Ƿ���� FROM ͼ����ⵥ WHERE ��ⵥ���=@��ⵥ���)
  IF @�Ƿ����=1
  BEGIN
     RAISERROR('����ⲻ��ɾ��!',16,1)
     ROLLBACK TRANSACTION
     END
GO