GO
CREATE TRIGGER trig_update_jieyue
ON ����
FOR UPDATE AS
  DECLARE @ԭ�������� DATETIME,@�»������� DATETIME,@ԭ������ NUMERIC(8,2),@�·����� NUMERIC(8,2),@У԰����� INT,@�ѽ���� INT,@ͼ���� VARCHAR(20)
  SET @ԭ�������� = (SELECT TOP 1 �������� FROM deleted) 
  SET @�»������� = (SELECT TOP 1 �������� FROM inserted) 
  SET @ԭ������ = (SELECT TOP 1 ������ FROM deleted) 
  SET @�·����� = (SELECT TOP 1 ������ FROM inserted)
  SET @У԰����� = (SELECT TOP 1 У԰����� FROM deleted) 
  SET @ͼ���� = (SELECT TOP 1 ͼ���� FROM deleted)
  SET @�ѽ���� = (SELECT �ѽ���� FROM ���� WHERE У԰����=@У԰�����)
  IF @ԭ�������� IS NULL AND @�»������� IS NOT NULL--�������
  BEGIN
    UPDATE ����
    SET ͼ����Ĵ���=ͼ����Ĵ���-1
    WHERE У԰����= @У԰�����
    UPDATE ͼ��
    SET �ִ���=�ִ���+1
    WHERE ͼ����= @ͼ����
  END
  IF @ԭ������ IS NULL AND @�·����� IS NOT NULL--δ����������
  BEGIN
    UPDATE ����
    SET δ��������=@�·�����
    WHERE У԰����= @У԰�����
  END
  IF @ԭ������ IS NOT NULL AND @�·����� IS NOT NULL--δ�������޸�
  BEGIN
  UPDATE ����
    SET δ��������=δ��������+@�·�����
    WHERE У԰����= @У԰�����
  END
GO