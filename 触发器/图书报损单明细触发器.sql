GO
CREATE TRIGGER trig_insert_baosun
ON ͼ�鱨����ϸ
FOR INSERT AS
  DECLARE @���� INT,@ͼ���� VARCHAR(20)
  SET @���� = (SELECT TOP 1 ���� FROM inserted) 
  SET @ͼ���� = (SELECT TOP 1 ͼ���� FROM inserted)
    UPDATE ͼ��
    SET �������=�������-@����,�ִ���=�ִ���-@����
    WHERE ͼ����= @ͼ���� 
GO
