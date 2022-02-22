SELECT USER
FROM DUAL;
--==>>SYS

SELECT '���ڿ�'
FROM DUAL;
--==>>���ڿ�

SELECT 550 + 230
FROM DUAL;
--==>>780

SELECT '������' + 'ȫ����'
FROM DUAL;
--==>> ���� �߻�
--     (ORA-01722: invalid number)


--�� ���� ����Ŭ ������ �����ϴ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
SYS	                OPEN
SYSTEM	            OPEN
ANONYMOUS	        OPEN
HR	                OPEN
APEX_PUBLIC_USER	LOCKED
FLOWS_FILES	        LOCKED
APEX_040000	        LOCKED
OUTLN	            EXPIRED & LOCKED
DIP	                EXPIRED & LOCKED
ORACLE_OCM	        EXPIRED & LOCKED
XS$NULL	            EXPIRED & LOCKED
MDSYS	            EXPIRED & LOCKED
CTXSYS	            EXPIRED & LOCKED
DBSNMP	            EXPIRED & LOCKED
XDB	                EXPIRED & LOCKED
APPQOSSYS	        EXPIRED & LOCKED
*/

SELECT *
FROM DBA_USERS;
--==>>
/*
SYS	0		OPEN		2022-08-14
SYSTEM	5		OPEN		2022-08-14
ANONYMOUS	35		OPEN		2014-11-25
HR	43		OPEN		2022-08-15
APEX_PUBLIC_USER	45		LOCKED	2014-05-29	2014-11-25
FLOWS_FILES	44		LOCKED	2014-05-29	2014-11-25
APEX_040000	47		LOCKED	2014-05-29	2014-11-25
OUTLN	9		EXPIRED & LOCKED	2022-02-15	2022-02-15
DIP	14		EXPIRED & LOCKED	2014-05-29	2014-05-29
ORACLE_OCM	21		EXPIRED & LOCKED	2014-05-29	2014-05-29
XS$NULL	2147483638		EXPIRED & LOCKED	2014-05-29	2014-05-29
MDSYS	42		EXPIRED & LOCKED	2014-05-29	2022-02-15
CTXSYS	32		EXPIRED & LOCKED	2022-02-15	2022-02-15
DBSNMP	29		EXPIRED & LOCKED	2014-05-29	2014-05-29
XDB	34		EXPIRED & LOCKED	2014-05-29	2014-05-29
APPQOSSYS	30		EXPIRED & LOCKED	2014-05-29	2014-05-29
*/

SELECT USERNAME, CREATED
FROM DBA_USERS;
--==>>
/*
SYS	                2014-05-29
SYSTEM	            2014-05-29
ANONYMOUS	        2014-05-29
HR	                2014-05-29
APEX_PUBLIC_USER	2014-05-29
FLOWS_FILES	        2014-05-29
APEX_040000	        2014-05-29
OUTLN	            2014-05-29
DIP	                2014-05-29
ORACLE_OCM	        2014-05-29
XS$NULL	            2014-05-29
MDSYS	            2014-05-29
CTXSYS	            2014-05-29
DBSNMP	            2014-05-29
XDB	                2014-05-29
APPQOSSYS	        2014-05-29
*/

--> ��DBA���� �����ϴ� Oracle Data dictionary View
--  ������ ������ �������� �������� ��쿡�� ��ȸ�� �����ϴ�.
--  ���� ������ ��ųʸ� ������ ���� ���ص� �������.


--�� ��HR������� ������ ��� ���·� ����
ALTER USER HR ACCOUNT LOCK;
--==>>User HR��(��) ����Ǿ����ϴ�.

--�� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
    :
HR	LOCKED
    :
*/


--�� ��HR�� ����� ������ ��� ���� ����
ALTER USER HR ACCOUNT UNLOCK;
--==>> User HR��(��) ����Ǿ����ϴ�.

--�� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
    :
HR	OPEN
    :
*/


-----------------------------------------------------------

--�� TABLESPACE ����

--�� TABLESPACE ��?
--> ���׸�Ʈ(���̺�, �ε���, ...)�� ��Ƶδ�(�����صδ�)
--  ����Ŭ�� ������ ���� ������ �ǹ��Ѵ�.
-- (���׸�Ʈ: ����Ŭ���� ��������� �ʿ�� �ϴ� ���� ���Ѵ�)

CREATE TABLESPACE TBS_EDUA                  -- �����ϰڴ�. ���̺����̽���... TBS_EDUA��� �̸�����
DATAFILE 'C:\TESTDATA\TBS_EDUA01.DBF'       -- ������ ������ ���� ��� �� �̸�
SIZE 4M                                     -- ������(�뷮)
EXTENT MANAGEMENT LOCAL                     -- ����Ŭ ������ ���׸�Ʈ�� �˾Ƽ� ����
SEGMENT SPACE MANAGEMENT AUTO;              -- ���׸�Ʈ ���� ������ ����Ŭ ������ �ڵ����� ����
--==>>TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.

--�� ���̺����̽� ���� ������ �����ϱ� ����
--  �ش� ����� �������� ���͸� ������ �ʿ��ϴ�.
--  (C:\TESTDATA)


--�� ������ ���̺����̽� ��ȸ
SELECT *
FROM DBA_TABLESPACES;           -- (DBA_~ : �̰� DBA��ųʸ���)
--==>>
/*
SYSTEM	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	MANUAL	DISABLED	NOT APPLY	NO	HOST	NO	
SYSAUX	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
UNDOTBS1	8192	65536		1	2147483645	2147483645		65536	ONLINE	UNDO	LOGGING	NO	LOCAL	SYSTEM	NO	MANUAL	DISABLED	NOGUARANTEE	NO	HOST	NO	
TEMP	8192	1048576	1048576	1		2147483645	0	1048576	ONLINE	TEMPORARY	NOLOGGING	NO	LOCAL	UNIFORM	NO	MANUAL	DISABLED	NOT APPLY	NO	HOST	NO	
USERS	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
*/


--�� ���� �뷮 ���� ��ȸ(�������� ���� �̸� ��ȸ)
SELECT *
FROM DBA_DATA_FILES;
--==>>
/*
    :
C:\TESTDATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
    :
*/


--�� ����Ŭ ����� ���� ����

CREATE USER lyt IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--==>> User LYT��(��) �����Ǿ����ϴ�.
--> lyt��� ����� ������ �����ϰڴ�.(����ڴ�.)
--  �� ����� ������ �н������ java006$�� �ϰڴ�.
--  �� ������ ���� �����ϴ� ����Ŭ ���׸�Ʈ��
--  �⺻������ TES_EDUA ��� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�.

--�� ������ ����Ŭ ����� ����(���� ���� �̸� �̴ϼ� ����)�� ���� ���� �õ�
--   �� ���� �Ұ�(����)
--   ��create session�� ������ ���� ������ ���� �Ұ�.

--�� ������ ����Ŭ ����� ����(���� ���� �̸� �̴ϼ� ����)��
--   ����Ŭ ���� ������ �����ϵ��� CTREATE SESSION ���� �ο�
GRANT CREATE SESSION TO LYT;
--==>> Grant��(��) �����߽��ϴ�.

SELECT *
FROM DBA_SYS_PRIVS;
--==>>
/*

LYT CREATE SESSION NO

*/

--�� ���� ������ ����Ŭ ����� ������
--   ���̺� ������ �����ϵ��� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO LYT;
--==>> Grant��(��) �����߽��ϴ�.


--�� ���� ������ ����Ŭ ����� ������
--   ���̺� �����̽�(TBS_EDUA) ���� ����� �� �ִ� ����(�Ҵ緮) ����.
ALTER USER LYT
QUOTA UNLIMITED ON TBS_EDUA;        --(QUOTA�� �Ҵ緮��, �̰� TBS_EDUA���� ���������� �Ҵ�)
--==>> User LYT��(��) ����Ǿ����ϴ�.



------------------------------------------------------------------------------------------


CREATE USER scott
IDENTIFIED BY tiger;
--==>>User SCOTT��(��) �����Ǿ����ϴ�.

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT;
--==>>Grant��(��) �����߽��ϴ�

ALTER USER SCOTT DEFAULT TABLESPACE USERS;
--==>> User SCOTT��(��) ����Ǿ����ϴ�.

ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
--==>>User SCOTT��(��) ����Ǿ����ϴ�.







