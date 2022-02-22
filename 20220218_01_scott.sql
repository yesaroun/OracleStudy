
--�� ���̺��� ��ȸ�ϴ� ��������
--   �� �÷��� �̸����� ��Ī(ALIAS)�� �ο��� �� �ִ�.
--   �⺻ ������ ��AS "��Ī �̸�"���� ���·� �ۼ��Ǹ�
--   �̶� ��AS���� ������ �����ϴ�.
--   ���� ��""���� ���� �����ϴ�.
--   ������ ��""���� ������ ��� ��Ī�� ������ ����� �� ���� �ȴ�.
--   ������ �ش� �÷��� ������ �ǹ��ϹǷ�
--   ��ì(ALIAS)�� �̸� ���ο� ������ ����ؾ� �� ���
--   ��""���� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� �Ѵ�.


--�� EMP ���̺��� �μ���ȣ�� 20���� 30�� �������� �����͵� ��
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--   ��, ��Ī(ALIAS)�� ����Ѵ�.
/*
EMP ���̺���                           -> FROM EMP
�μ���ȣ�� 20���� 30��                   -> ����
�����ȣ, �����, ������, �޿�, �μ���ȣ -> SELECT �÷���
*/

SELECT *
FROM EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO=20 OR DEPTNO=30;
--==>> 
/*
7369	SMITH	CLERK	800	20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	2850	30
7788	SCOTT	ANALYST	3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	1100	20
7900	JAMES	CLERK	950	30
7902	FORD	ANALYST	3000	20
*/

--�� ���� ������ IN �����ڸ� Ȱ���Ͽ�
--   ������ ���� ó���� �� ������
--   �� ������ ó�� ����� ���� ����� ��ȯ�Ѵ�.
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO IN (20, 30);
--==>>
/*
7369	SMITH	CLERK	     800	20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	     950	30
7902	FORD	ANALYST	    3000	20
*/

--�� EMP ���̺��� ������ CLERK�� ������� �����͸� ��� ��ȸ�Ѵ�.
SELECT *
FROM EMP
WHERE ������ CLERK;

SELECT *
FROM EMP
WHERE JOB�� CLERK;

SELECT *
FROM EMP
WHERE JOB="CLERK";
--==>> ���� �߻�
--     (ORA-00904: "CLERK": invalid identifier)

SELECT *
FROM EMP
WHERE JOB='CLERK';

SELECT *
FROM EMP
WHERE JOB IN ('CLERK');
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17	800		20
7876	ADAMS	CLERK	7788	1987-07-13	1100		20
7900	JAMES	CLERK	7698	1981-12-03	950		30
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/

select *
from emp
where job = 'clerk';
--==>> ��ȸ ��� ����

select *
from emp
where job = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17	 800		20
7876	ADAMS	CLERK	7788	1987-07-13	1100		20
7900	JAMES	CLERK	7698	1981-12-03	 950		30
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/

--�� ����Ŭ����... �Էµ� �������� �� ��ŭ��...
--   ��.��.��. ��ҹ��� ������ �Ѵ�.


--�� EMP ���̺��� ������ CLERK�� ����� ��
--   20�� �μ����� �ٹ��ϴ� �������
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT *
FROM EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL"�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO=20 AND JOB='CLERK';
--==>>
/*
7369	SMITH	CLERK	 800	20
7876	ADAMS	CLERK	1100	20
*/


--�� EMP ���̺��� ������ �����͸� Ȯ���Ͽ�
--   �̿� �Ȱ��� �����Ͱ� ����ִ� ���̺��� ������ �����Ѵ�.(TBL_EMP)

DESCRIBE EMP;
DESC EMP;       -- ���� ����
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2) 
*/

/*
CREATE TABLE TBL_EMP
( EMPNO     NUMBER(4)
, ENAME     VARCHAR2(10)
, JOB       VARCHAR2(9)
, MGR       NUMBER(4)
, HEREDATE  DATE
, SAL       NUMBER(7, 2)
, COMM      NUMBER(7, 2)
, DEPTNO    NUMBER(2)
);

SELECT *
FROM EMP

INSERT INTO ... * 14        -- �̷��� �ϳ��� 14�� �־���� �ٵ� �̷��� ���ϰ� �ٸ� ��� �ִ�
*/

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;       -- (�Ȱ��� ����)


--�� ���̺� ����(DEPT �� TBL_DEPT)
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_DEPT;

DESC TBL_DEPT;


--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	
TBL_DEPT	    TABLE	
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '��� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� �� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
TBL_DEPT	    TABLE	
TBL_EMP	        TABLE	��� ����
*/

--�� TBL_DEPT ���̺��� ������� ���̺� ������ Ŀ��Ʈ ������ �Է�
--   �� �μ� ����
COMMENT ON TABLE TBL_DEPT IS '�μ� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ������ �Է� �� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
TBL_DEPT	    TABLE	�μ� ����
TBL_EMP     	TABLE	��� ����
*/


--�� �÷� ������ Ŀ��Ʈ ������ Ȯ��
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
TBL_DEPT	LOC	
TBL_EMP	EMPNO	
EMP	JOB	
TBL_EXAMPLE2	NAME	
TBL_EMP	SAL	
DEPT	LOC	
BONUS	COMM	
BONUS	SAL	
EMP	SAL	
SALGRADE	LOSAL	
TBL_EMP	ENAME	
TBL_EMP	MGR	
TBL_EMP	COMM	
EMP	DEPTNO	
SALGRADE	HISAL	
EMP	EMPNO	
TBL_EXAMPLE1	NAME	
DEPT	DEPTNO	
DEPT	DNAME	
EMP	            COMM	
TBL_EMP	        JOB	
SALGRADE	    GRADE	
TBL_EXAMPLE1	ADDR	
TBL_DEPT	    DNAME	
TBL_EXAMPLE2	ADDR	
EMP	HIREDATE	
TBL_EMP	DEPTNO	
TBL_EXAMPLE2	NO	
BONUS	JOB	
TBL_EXAMPLE1	NO	
TBL_DEPT	DEPTNO	
EMP	ENAME	
TBL_EMP	HIREDATE	
EMP	MGR	
BONUS	ENAME	
*/

--�� �÷� ������ Ŀ��Ʈ ������ Ȯ��(TBL_DEPT ���̺� �Ҽ��� �÷��鸸 Ȯ��)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';        -- �����߰�
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/


--�� ���̺� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ������ ����
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ� ��ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�.

COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ���';
--==>> Comment��(��) �����Ǿ����ϴ�.

COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ� ��ġ';
--==>> Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ �����Ͱ� �Էµ� ���̺��� �÷� ���� Ŀ��Ʈ ������ Ȯ��
--   (TBL_DEPT ���̺� �Ҽ��� �÷��鸸 ��ȸ)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	�μ� ��ȣ
TBL_DEPT	DNAME	�μ���
TBL_DEPT	LOC	    �μ� ��ġ
*/

--�� TBL_EMP ���̺��� �������
--   ���̺� �Ҽӵ�(���Ե�)�÷��� ���� Ŀ��Ʈ ������ ����
DESC TBL_EMP;

COMMENT ON COLUMN TBL_EMP.EMPNO IS '��� ��ȣ';

COMMENT ON COLUMN TBL_EMP.ENAME IS '�����';

COMMENT ON COLUMN TBL_EMP.JOB IS '������';

COMMENT ON COLUMN TBL_EMP.MGR IS '������ �����ȣ';

COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';

COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';

COMMENT ON COLUMN TBL_EMP.COMM IS '����';

COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ���ȣ';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	��� ��ȣ
TBL_EMP	ENAME	�����
TBL_EMP	JOB	������
TBL_EMP	MGR	������ �����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	�޿�
TBL_EMP	COMM	����
TBL_EMP	DEPTNO	�μ���ȣ
*/


--���� �÷� ������ �߰� �� ���� ����--

SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		20
7839	KING	PRESIDENT		    1981-11-17	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		20
7900	JAMES	CLERK	    7698	1981-12-03	950		30
7902	FORD	ANALYST	    7566	1981-12-03	3000		20
7934	MILLER	CLERK	    7782	1982-01-23	1300		10
*/

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ �����͸� ���� �� �ִ� �÷� �߰�
--(�Ǿտ� 0�� ���� ���ڷ� ó���ϸ�ȵȴ�, �ֹι�ȣ�� ������ �� 13�ڸ��� ���������ϱ� ������ ���°� ����)
--   �� SSN  CHAR(13)
--(������ ������ ����̿��� ALTER��)
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

SELECT 01012341234
FROM DUAL;
--==>> 1012341234

SELECT '01012341234'
FROM DUAL;
--==>> 01012341234


--�� Ȯ��
SELECT *
FROM TBL_EMP;

SELECT EMPNO, SSN
FROM TBL_EMP;

DESC TBL_EMP;

SELECT EMPNO, ENAME, SSN, JOB           -- (�÷��� ������ �߿����� �ʴ� �ֹι�ȣ�� �̸� ���� �ΰ� ������ �̷��� ��ȸ�ϸ� �ȴ�)
FROM TBL_EMP;

--> SSN(�ֹε�Ϲ�ȣ)�÷��� ���������� ����(�߰�)�� ������ Ȯ��

--�� ���̺� ������ �÷��� ������ ���������� �ǹ� ����.


--�� TBL_EMP ���̺� �߰��� SSN(�ֹε�Ϲ�ȣ) �÷� ���������� ����
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� �����Ǿ����� Ȯ��.


DELETE TBL_EMP;
--==>> 14�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--> ���� �߻� ����
--  ������ ����.
--  ���̺��� ����(����, Ʋ)�� �״�� �����ִ� ���¿���
--  �����͸� ��� �ҽ�(����)�� ��Ȳ���� Ȯ��.

DESC TBL_EMP;


DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>> ���� �߻�
--     00942. 00000 -  "table or view does not exist"

DESC TBL_EMP;
--==>> ���� �߻�
--     ORA-04043: TBL_EMP ��ü�� �������� �ʽ��ϴ�.


-- �� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.


--�� NULL �� ó��

SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	8	20	5

SELECT NULL, NULL+2, 10-NULL, NULL*2, 2/NULL
FROM DUAL;
--==>> (null)   (null)  (null)  (null)  (null)

--�� ������ ���
--   NULL �� ������ ���� �ǹ��ϸ�, �������δ� ���� �������� �ʴ� ���̱� ������
--   �� NULL�� ���꿡 ���Ե� ���..
--   �� ����� ������ NULL �̴�.


--�� TBL_EMP ���̺��� Ŀ�̼�(COMM, ����)�� NULL �� ������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT �����, ������, �޿�, Ŀ�̼�
FROM TBL_EMP
WHERE Ŀ�̼��� NULL;

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM�� NULL;

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> ���� �߻����� ����
--     ��ȸ ��� ����

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> �����߻�
--     ORA-01722: invalid number    (COMM�� ���ڸ� �ִµ� �� ���ڰ� ���Դ����� ���� ����)

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (NULL);
--==>> ���� �߻����� ����
--     ��ȸ ��� ����

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
--==>> (�̰� ��������� =�� �ƴ϶� �������� �ؾ��ؼ� IS)
/*
SMITH	CLERK	    800	    (null)
JONES	MANAGER	    2975	(null)
BLAKE	MANAGER	    2850	(null)
CLARK	MANAGER	    2450	(null)
SCOTT	ANALYST	    3000	(null)
KING	PRESIDENT	5000	(null)
ADAMS	CLERK	    1100	(null)
JAMES	CLERK	    950	    (null)
FORD	ANALYST	    3000	(null)
MILLER	CLERK	    1300	(null)
*/

--�� NULL�� ���� �����ϴ� ���� �ƴϱ� ������
--   �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--   NULL�� ������� ����� �� ���� �����ڵ�...
--   >=, <=, >, <, != , ^= (�̰͵� �����ʴ���), <>(�̰͵� �����ʴ���)


--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� ��������
--   �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO!=20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO^=20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO<>20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/


--�� TBL_EMP ���̺��� Ŀ�̼��� NULL�� �ƴ� �������� 
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NOT NULL;     -- NOT
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM"Ŀ�̼�"
FROM TBL_EMP
WHERE NOT COMM IS NULL;     -- NOT      (�̰� �Ѵ� �˾Ƶα�)
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

--�� TBL_EMP ���̺��� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�.
--   ����, ����(COMM)�� �� 1ȸ �����ϸ�(�ų� ����), ���� ������ �����Ѵ�.
SELECT �����ȣ, �����, �޿�, Ŀ�̼�, ����
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
       , SAL * 12 "����"
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
       , SAL * 12 + COMM "����"
FROM TBL_EMP;


--�� NVL()   --SYSDATE ��ȣ ��� �Լ���
SELECT NULL "COL1", NVL(NULL, 10) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>>(null) 	10	5
-- ù��° �Ķ���� ���� NULL�̸�, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.
-- ù ��° �Ķ���� ���� NULL�� �ƴϸ�, �� ���� �״�� ��ȯ�Ѵ�.

SELECT ENAME "�����", NVL(COMM, 1234) "����"
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
       , SAL * 12 + NVL(COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	 800	 	     9600
7499	ALLEN	1600	 300	19500
7521	WARD	1250	 500	15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
7900	JAMES	 950		    11400
7902	FORD	3000		    36000
7934	MILLER	1300		    15600
*/


--�� NVL2()
--> ù��° �Ķ���� ���� NULL�� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�,
--  ù ��° �Ķ���� ���� NULL �� ���, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.

SELECT ENAME "�����", NVL2(COMM, 'û��÷�', '���÷�') "����Ȯ��"
FROM TBL_EMP;
--==>>
/*
SMITH	���÷�
ALLEN	û��÷�
WARD	û��÷�
JONES	���÷�
MARTIN	û��÷�
BLAKE	���÷�
CLARK	���÷�
SCOTT	���÷�
KING	���÷�
TURNER	û��÷�
ADAMS	���÷�
JAMES	���÷�
FORD	���÷�
MILLER	���÷�
*/

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
       , SAL * 12 + NVL2(COMM, COMM, 0) "����"
FROM TBL_EMP;


SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
       , NVL2(COMM, SAL*12+COMM, SAL+12) "����"
FROM TBL_EMP;


--�� COLAESCE()
-->  �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�.
--   �� �տ� �ִ� �Ű��������� ���ʷ� NULL���� �ƴ��� Ȯ���Ͽ�
--   NULL �� �ƴ� ��� ��ȯ�ϰ�,
--   NULL �� ��쿡�� �� ���� �Ű������� ���� ��ȯ�Ѵ�.
--   NVL()�̳� NVL2()�� ���Ͽ�
--   ��~~~~~�� ����� ���� ����� �� �ִٴ� Ư¡�� ���´�.

SELECT NULL "COL1"
    , COALESCE(NULL, NULL, NULL, 30) "COL2"
    , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "COL3"
    , COALESCE(10, NULL, NULL, NULL, NULL, NULL) "COL4"
    , COALESCE(NULL, NULL, 50, NULL, NULL, NULL, NULL, 100) "COL5"
FROM DUAL;
--==>> 	30	100	10	50


--�� �ǽ��� ���� ������ �߰� �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, 'ȣ����', 'SALESMAN', 7369, SYSDATE, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '������', 'SALESMAN', 7369, SYSDATE, 10,10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �����Ͱ� �߰��� ���� ������ TBL_EMP ���̺��� ��� �����
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--   ���� ���� ������ ���� ����.
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
    , NVL2(SAL, NVL2(COMM, SAL*12+COMM, SAL*12), NVL2(COMM, COMM, 0)) "����"
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
    , COALESCE(SAL * 12 + COMM, SAL*12, COMM, 0) "����"
FROM TBL_EMP;


--�� �÷��� �÷��� ����(����)
SELECT 1, 2
FROM DUAL;
--==>> 1	2

SELECT 1+2
FROM DUAL;
--==>> 3

SELECT '����', '������'
FROM DUAL;
--==>> ����	������

SELECT '����' + '������'
FROM DUAL;
--==>> ���� �߻�
--     ORA-01722: invalid number

--��||��
SELECT '����' || '������'
FROM DUAL;

SELECT ENAME, JOB
FROM TBL_EMP;

SELECT ENAME || JOB
FROM TBL_EMP;
--==>> 
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
ȣ����SALESMAN
������SALESMAN
*/

SELECT '�����̴�', SYSDATE, '�� ���� ', 500, '���� ���Ѵ�.'
FROM DUAL;
--==>> �����̴�	2022-02-18	�� ���� 	500	���� ���Ѵ�.
--     -------- ----------  -------     --- ------------
--     ����Ÿ��  ��¥Ÿ��   ����Ÿ�� ����Ÿ�� ����Ÿ��

SELECT '�����̴�' || SYSDATE || '�� ���� ' || 500 || '���� ���Ѵ�.'
FROM DUAL;
--==>> �����̴�2022-02-18�� ���� 500���� ���Ѵ�.

--�� ����Ŭ������ ���� Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ��||���� �������ָ� ������ �÷��� �÷�(���� �ٸ� ������ ������)��
--   �����ϴ� ���� �����ϴ�.
--   cf) MSSQL ������ ��� �����͸� ���ڿ��� CONVERT �ؾ��Ѵ�.

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.
--   ��SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
--     ALLEN�� ���� ������ 19500�ε� ��� ������ 39000�̴�.
--                      :
--     �������� ���� ������ 10�ε� ��� ������ 20�̴�.��
--   ��, ���ڵ帶�� ���� ������ �� �÷��� ��� ��ȸ�� �� �ֵ��� ó���Ѵ�.
SELECT ENAME || '�� ���� ������ ' || (COALESCE(SAL * 12 + COMM, SAL*12, COMM, 0)) 
    || '�ε� ��� ������ ' || (COALESCE(SAL*12+COMM, SAL*12, COMM, 0))*2 || '�̴�.'
FROM TBL_EMP;
--==>> 
/*
SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
ALLEN�� ���� ������ 19500�ε� ��� ������ 39000�̴�.
WARD�� ���� ������ 15500�ε� ��� ������ 31000�̴�.
JONES�� ���� ������ 35700�ε� ��� ������ 71400�̴�.
MARTIN�� ���� ������ 16400�ε� ��� ������ 32800�̴�.
BLAKE�� ���� ������ 34200�ε� ��� ������ 68400�̴�.
CLARK�� ���� ������ 29400�ε� ��� ������ 58800�̴�.
SCOTT�� ���� ������ 36000�ε� ��� ������ 72000�̴�.
KING�� ���� ������ 60000�ε� ��� ������ 120000�̴�.
TURNER�� ���� ������ 18000�ε� ��� ������ 36000�̴�.
ADAMS�� ���� ������ 13200�ε� ��� ������ 26400�̴�.
JAMES�� ���� ������ 11400�ε� ��� ������ 22800�̴�.
FORD�� ���� ������ 36000�ε� ��� ������ 72000�̴�.
MILLER�� ���� ������ 15600�ε� ��� ������ 31200�̴�.
ȣ������ ���� ������ 0�ε� ��� ������ 0�̴�.
�������� ���� ������ 10�ε� ��� ������ 20�̴�.
*/


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY--MM--DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2022--02--18 15:36:09

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2022--02--18

--�� TBL_EMP ���̺��� �����͸� Ȱ���Ͽ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.
--   ��SMITH's �Ի����� 1980-12-17 �̴�. �׸��� �޿��� 800�̴�.
--     ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
--                      :
--     ����'s �Ի����� 2022-02-18�̴�. �׸��� �޿��� 0�̴�.��
--   ��, ���ڵ帶�� ���� ������ �� �÷��� ��� ��ȸ�� �� �ֵ��� ó���Ѵ�.
SELECT ENAME || '''s �Ի����� ' || HIREDATE || '�̴�. �׸��� �޿��� ' || NVL(SAL, 0) || '�̴�.'
FROM TBL_EMP;

--�� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--   Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�.
--   Ȭ����ǥ ��'���ϳ��� ���ڿ��� ������ ���۵ȴٴ� ���� ��Ÿ����
--   �� ���ڿ� ���� �ȿ��� Ȭ����ǥ ��''�� �� ���� ���۽�Ʈ���Ǹ� ��Ÿ����
--   �ٽ� �����ϴ� Ȭ����ǥ ��'�� �ϳ���
--   ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.

SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';


--�� UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "COL1"
    , UPPER('oraCLe') "COL2"
    , LOWER('oraCLe') "COL3"
    , INITCAP('oraCLe') "COL4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
--> UPPER()�� ��� �빮�ڷ� ��ȯ
--  LOWER()�� ��� �ҹ��ڷ� ��ȯ
--  INITCAP() �� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ

--�� TBL_EMP ���̺��� ������� �˻����� 'sALeSmAN'�� ��������
--   �ش� ���� ����� �����ȣ, �����, �������� ��ȸ�Ѵ�.
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������"
FROM TBL_EMP
WHERE JOB=UPPER('sALeSmAN');
--==>> 
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	ȣ����	SALESMAN
8001	������	SALESMAN
*/

--�� �ǽ��� ���� �߰� ������ �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '������', 'salesman', 7369, SYSDATE, 20, 100);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� TBL_EMP ���̺��� ������ �������(�������)�� �������
--   �����ȣ, �����, �������� ��ȸ�Ѵ�.
SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������"
FROM TBL_EMP
WHERE JOB=UPPER('SALESMAN') OR JOB=LOWER('SALESMAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE INITCAP(JOB) = INITCAP('sALeSmAN');


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� �Ի��� ������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';          -- ����Ŭ�� �ڵ�����ȯ�� �ٵ� ������ �ȵ�
--==>> MARTIN	SALESMAN	1981-09-28  -- HIREDATE�� ��¥ Ÿ���̰� '1981-09-28'�� ����Ÿ����

DESC TBL_EMP;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE                --CHECK~!!  
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2) 
*/

-- �׷��� ��¥ ��ȯ �Լ� �����
--�� TO_DATE()
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>> MARTIN	SALESMAN	1981-09-28


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� ����(�ش��� ����)
--   �Ի��� �������� �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
ȣ����	SALESMAN	2022-02-18
������	SALESMAN	2022-02-18
������	salesman	2022-02-18
*/

--�� ����Ŭ������ ��¥ �����Ϳ� ���� ũ�� �񱳰� �����ϴ�.
--   ����Ŭ������ ��¥ �����Ϳ� ���� ũ�� �� ��
--   ���ź��� �̷��� �� ū ������ �����Ѵ�.

--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�Ϻ���
--   1981�� 9�� 28�� ���̿� �Ի��� ��������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)
SELECT �����, ������, �Ի���
FROM TBL_EMP
WHERE �Ի����� 1981�� 4�� 2�� ���� 1981�� 9�� 28�� ����;

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE �Ի����� 1981�� 4�� 2�� ���� 1981�� 9�� 28�� ����; 

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE 1981�� 4�� 2�� <= �Ի��� <= 1981�� 9�� 28��;       --(��)
    
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE �Ի��� >= 1981�� 4�� 2��
      �Ի��� <= 1981�� 9�� 28��;
      
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD')       -- ����(�̻�) �� �ش��� ����  cf) �ʰ�
      HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');      -- ����(����) �� �ش��� ����  cf) �̸�

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') 
      AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--�� BETWEEN �� AND ��
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE �� 1981�� 4�� 2�ϰ� 1981�� 9�� 28�� ����;

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD')
                   AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--�� TBL_EMP ���̺��� �޿�(SAL)�� 2450���� 3000 ������ �������� ��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';            -- ������
--==>>
/*
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7900	JAMES	CLERK	    7698	1981-12-03	 950		    30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's'; -- (�̷��� W�� ���� �׷��ϱ� �빮�� �� ����? ã�ƺ���)

--�� BETWEEN �� AND �� �� ��¥��, ������, ������ ������ ��ο� ����ȴ�
--   ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������ (������ �迭)
--   �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����, BETWEEN �� AND �� �� �ش� ������ ����Ǵ� ��������
--   ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ����ó���ȴ�.


SELECT ASCII('A') "COL1", ASCII('B') "COL2", ASCII('a') "COL3", ASCII('b') "COL4"
FROM DUAL;
--==>>65	66	97	98
