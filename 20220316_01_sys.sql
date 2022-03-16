SELECT USER
FROM DUAL;
--==>>SYS

--------------------------------------------------------------------------------
--�� C����̺꿡 ���丮 ���� 
--   ���丮 �� :TEAM4_ORACLE

--�� ���̺� �����̽� ����
CREATE TABLESPACE TBS_TEAM4
DATAFILE 'C:\TEAM4_ORACLE\TBS_TEAM4.DBF'
SIZE 4M  
EXTENT MANAGEMENT LOCAL             
SEGMENT SPACE MANAGEMENT AUTO;
--==>>TABLESPACE TBS_TEAM4��(��) �����Ǿ����ϴ�.


--�� ��������
CREATE USER team4 IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_TEAM4;
--==>>User TEAM4��(��) �����Ǿ����ϴ�.


--�� ���Ѻο�
GRANT CREATE SESSION TO team4;
--==>>Grant��(��) �����߽��ϴ�.
GRANT CREATE TABLE TO team4;
--==>>Grant��(��) �����߽��ϴ�.


--�� �Ҵ緮 �ο�(������)
ALTER USER team4
QUOTA UNLIMITED ON TBS_TEAM4;
--==>>User TEAM4��(��) ����Ǿ����ϴ�.


--�� ������ȸ
SELECT *
FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'TEAM4';
--==>>
/*
TEAM4	CREATE TABLE	NO
TEAM4	CREATE SESSION	NO
*/

--�� ���ʿ��� �ʷϡ�+�������� ���� �����

