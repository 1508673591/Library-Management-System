GO
CREATE TRIGGER trig_insert_fakuan
ON ����ѵ�
FOR INSERT AS
  DECLARE @У԰����� INT,@��� NUMERIC(8,2) 
  SET @У԰����� = (SELECT TOP 1 У԰���� FROM inserted) 
  SET @��� = (SELECT TOP 1 ��� FROM inserted)
  IF @��� IS NOT NULL
  BEGIN
    UPDATE ����
    SET δ��������=δ��������-@���
    WHERE У԰����= @У԰�����
  END
GO