 CREATE TABLE ͼ��
 (
 ͼ���� VARCHAR(20) PRIMARY KEY,
 У�� VARCHAR(3) ,
 ���� VARCHAR(50) NOT NULL,
 ���� VARCHAR(20) NOT NULL,
 �۸� NUMERIC(8,2) NOT NULL,
 ҳ�� INT NOT NULL,
 ������� INT NOT NULL,
 �ִ��� INT NOT NULL,
 ���ʱ�� DATETIME ,
 ������� INT NOT NULL,
 
 );
  CREATE TABLE ͼ������
 (
 ͼ�����ͱ�� CHAR(1) PRIMARY KEY,
 ͼ�������� VARCHAR(50) NOT NULL
 );
 CREATE TABLE ������
(
���� VARCHAR(50) NOT NULL,
 ���� VARCHAR(20) NOT NULL,
)
 CREATE TABLE ��������
 (
 �������ͱ�� CHAR(10) PRIMARY KEY,
 ���������� VARCHAR(20) NOT NULL,
 �ɽ��Ĳ��� INT CHECK(�ɽ��Ĳ���>=20 AND �ɽ��Ĳ���<=60),
 �������� INT  CHECK(��������>=90 AND ��������<=120),
 ���������� INT  CHECK(����������>=10 AND ����������<=60)
 )

 CREATE TABLE ����
 (
 У԰���� INT PRIMARY KEY ,
 У�� VARCHAR(3) ,
 �������ͱ�� CHAR(10),
 ���� VARCHAR(50) NOT NULL,
 �Ա� CHAR(10) CHECK (�Ա� IN ('��','Ů')),
 ͼ����Ĵ��� INT,
 �Ƿ��ʧ INT,
 �ѽ���� INT,
 δ�������� NUMERIC(8,2),
 FOREIGN KEY(�������ͱ��) REFERENCES �������� (�������ͱ��)
 )

 CREATE TABLE ����Ա
 (
 ����Ա��� INT  PRIMARY KEY,
 ����Ա���� VARCHAR(50) NOT NULL,
 �Ա� CHAR(10) CHECK (�Ա�  IN ('��','Ů')),
 )

 CREATE TABLE ����ѵ�
 (
 ���ѵ��� INT PRIMARY KEY,
 У԰����� INT ,
 ���� DATETIME NOT NULL,
 ��� NUMERIC(8,2) NOT NULL,
 FOREIGN KEY(У԰�����) REFERENCES ����(У԰����)
  )

  CREATE TABLE ͼ����ⵥ
  (
  ��ⵥ��� INT PRIMARY KEY,
  ������� DATETIME NOT NULL,
  �����˱�� INT,
  �Ƿ���� INT,
  FOREIGN KEY(�����˱��) REFERENCES ����Ա(����Ա���)
  )

  CREATE TABLE ͼ����ⵥ��ϸ
  (
  ��ⵥ��� INT,
  ͼ���� VARCHAR(20),
  ���� INT NOT NULL,
  PRIMARY KEY(��ⵥ���,ͼ����),
  FOREIGN KEY(��ⵥ���) REFERENCES ͼ����ⵥ(��ⵥ���),
  FOREIGN KEY(ͼ����) REFERENCES ͼ��(ͼ����)
  )

  CREATE TABLE ͼ�鱨��
  (
  ���𵥱�� INT PRIMARY KEY,
  �������� DATETIME NOT NULL,
  �����˱�� INT,
  FOREIGN KEY(�����˱��) REFERENCES ����Ա(����Ա���)
  )

  CREATE TABLE ͼ�鱨����ϸ
  (
  ���𵥱�� INT,
  ͼ���� VARCHAR(20),
  ���� INT NOT NULL,
  ����ԭ�� VARCHAR(100) NOT NULL,
  PRIMARY KEY(���𵥱��,ͼ����),
  FOREIGN KEY(���𵥱��) REFERENCES ͼ�鱨��(���𵥱��),
  FOREIGN KEY(ͼ����) REFERENCES ͼ��(ͼ����)
  )

  CREATE TABLE ����
  (
  У԰����� INT ,
  У�� VARCHAR(3),
  ͼ���� VARCHAR(20),
  �������� DATETIME NOT NULL,
  �������� DATETIME,
  ������ NUMERIC(8,2),
  �Ƿ����� INT,
  CHECK (��������>=��������),
  PRIMARY KEY(У԰�����,ͼ����),
  FOREIGN KEY(У԰�����) REFERENCES ����(У԰����),
  FOREIGN KEY(ͼ����) REFERENCES ͼ��(ͼ����)
  )
 CREATE TABLE ��ݱ�
(
  ������ INT,
  ͼ���� VARCHAR(20),
  У԰���� INT,
  У�� VARCHAR(3)
 )