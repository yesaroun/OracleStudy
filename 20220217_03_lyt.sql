SELECT USER
FROM DUAL;
--==>> KHJ

--�� ���̺� ����(TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO     NUMBER(10)
, NAME   VARCHAR2(30)
);
--==>> ���� �߻�
--> ���� ������ �̸� ������ CREATE SESSION ���Ѹ� ���� ������
--  ���̺� ���� ������ ���� ���� ���� �����̴�.
--  �׷��Ƿ� �����ڷκ��� ���̺��� ������ �� �ִ� ������ �ο��޾ƾ� �Ѵ�.


--�� SYS�� ���� ���̺� ��������(CREATE TABLE)�� �ο� ���� ��
--   �ٽ� ���̺� ����(TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO     NUMBER(10)
, NAME   VARCHAR2(30)
);
--==>> ���� �߻�
--     (ORA-01950: no privileges on tablespace 'TBS_EDUA')
--> ���̺� ���� ���ѱ��� �ο����� ��Ȳ������
--  ������ �̸� ������ �⺻ ���̺� �����̽�(DEFAULT TABLESPACE)��
--  TBS_EDUA �̸�, �� ������ ���� �Ҵ緮�� �ο����� ���� �����̴�.
--  �׷��Ƿ� �� ���̺����̽��� ����� ������ ���ٴ� �����޼�����
--  ����Ŭ�� ������ְ� �ִ� ��Ȳ


--�� SYS�� ���� ���̺����̽�(TBS_EDUA)�� ���� �Ҵ緮�� �ο� ���� ��
--   �ٽ� ���̺� ����(TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO     NUMBER(10)
, NAME   VARCHAR2(30)
);
--==>> Table TBL_ORAUSERTEST��(��) �����Ǿ����ϴ�.


SELECT *
FROM TBL_ORAUSERTEST;
--> ���̺��� ������ Ȯ���� �� �ִ� ����
--  ��, ��ȸ ����� ����


--�� �ڽſ��� �ο��� �Ҵ緮 ��ȸ
SELECT *
FROM USER_TS_QUOTAS;
--==>> TBS_EDUA 65536   -1	8	-1	NO
-- �� ��-1���� �������� �ǹ�


--�� ������ ���̺�(TBL_ORAUSERTEST)��
--   � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>> TBL_ORAUSERTEST  TBS_EDUA








