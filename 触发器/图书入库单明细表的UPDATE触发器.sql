GO
  CREATE  PROCEDURE  P1  
  @��ⵥ��   INT
AS
DECLARE @ͼ���� INT, @���� INT ,@�Ƿ������ INT ,@������� DATETIME
DECLARE C1 CURSOR FOR       
       SELECT ͼ����,���� FROM ͼ����ⵥ��ϸ WHERE ��ⵥ���=@��ⵥ��
SELECT @�Ƿ������=�Ƿ����, @�������=�������
FROM ͼ����ⵥ
WHERE ��ⵥ���=@��ⵥ��
IF @�Ƿ������=0
BEGIN

OPEN C1
BEGIN TRANSACTION  /* ����֮ǰ  ��ʼ����Ҫôȫ����Ҫôȫ������ */
/* ���� */
WHILE 1=1
BEGIN
  FETCH NEXT FROM C1 INTO  @ͼ����, @����
  IF @@fetch_status<>0  
         BREAK 
  UPDATE ͼ��/*�޸�ͼ���*/
  SET �������=�������+@����,�ִ���=�ִ���+@����,���ʱ��=@�������
  WHERE ͼ����=@ͼ����
END   
CLOSE C1
DEALLOCATE C1
UPDATE ͼ����ⵥ/*�޸�ͼ����ⵥ��*/
SET �Ƿ����=1
WHERE ��ⵥ���=@��ⵥ��
COMMIT    /* һ�������Ķ�����ϸȫ���������  */
END
GO