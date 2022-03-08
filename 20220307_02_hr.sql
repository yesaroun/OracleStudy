SELECT USER
  FROM DUAL;
--==>> HR


--�� EMPLOYEES ���̺��� ������ SALARY�� 10% �λ��Ѵ�.
--   ��, �μ����� 'IT'�� �����鸸 �����Ѵ�. -- �̰� �ٽ�
--   (����, ���濡 ���� ��� Ȯ�� �� ROLLBACK ��������~!!!)


-- �� Ǯ��
UPDATE EMPLOYEES E
   SET E.SALARY = E.SALARY * 1.1
 WHERE EXISTS (
        SELECT 0
          FROM DEPARTMENTS D
         WHERE D.DEPARTMENT_NAME = 'IT'
       );
ROLLBACK;

-- Ǯ��
-- IT �μ� �������� FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID ��ȸ
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
  FROM
 WHERE �μ��� = 'IT';
 
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
  FROM
 WHERE �μ���ȣ = �μ����� 'IT'�� �μ��� �μ���ȣ;
       
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
  FROM
 WHERE �μ���ȣ = 60;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
  FROM
 WHERE DEPARTMENT_ID = (�μ����� 'IT'�� �μ��� �μ���ȣ);
 
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
Alexander	Hunold	9000	60
Bruce	Ernst	6000	60
David	Austin	4800	60
Valli	Pataballa	4800	60
Diana	Lorentz	4200	60
*/

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID 
     , SALARY*1.1 "10%�λ�ȱ޿�"
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
Alexander	Hunold	9000	60	9900
Bruce	    Ernst	6000	60	6600
David	    Austin	4800	60	5280
Valli	    Pataballa	4800	60	5280
Diana	    Lorentz	4200	60	4620
*/

UPDATE EMPLOYEES
   SET SALARY = SALARY*1.1
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60;
--==>>
/*
103	Alexander	Hunold	AHUNOLD	590.423.4567	2006-01-03	IT_PROG	9900		102	60
104	Bruce	Ernst	BERNST	590.423.4568	2007-05-21	IT_PROG	6600		103	60
105	David	Austin	DAUSTIN	590.423.4569	2005-06-25	IT_PROG	5280		103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	5280		103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4620		103	60
*/

--�ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� EMPLOYEES ���̺��� JOB_TITLE �� ��Sales Manager���� �������
--   SALARY�� �ش� ����(����)�� �ְ�޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ���� (�ش� �⵵ ����) �Ի��ڿ� ���� ������ �� �ֵ��� ó���Ѵ�.
--   (����, ���濡 ���� ��� Ȯ�� �� ROLLBACKUP �����Ѵ�.)
SELECT *
  FROM EMPLOYEES;

SELECT *
  FROM JOBS;
--==>> SA_MAN	Sales Manager	10000	20080

UPDATE EMPLOYEES
   SET SALARY = ('Sales Manager'�� MAX_SALARY)
 WHERE JOB_TITLE = 'Sales Manager'
   AND �Ի����� 2006�� ����;

UPDATE EMPLOYEES
   SET SALARY = ('Sales Manager'�� MAX_SALARY)
 WHERE JOB_ID = ('Sales Manager'�� JOB_ID)
   AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;

-- Sales Manager�� MAX_SALARY
SELECT MAX_SALARY
  FROM JOBS
 WHERE JOB_TITLE = 'Sales Manager';
--==>> 20080

UPDATE EMPLOYEES
   SET SALARY = (SELECT MAX_SALARY
                   FROM JOBS
                  WHERE JOB_TITLE = 'Sales Manager')
 WHERE JOB_ID = ('Sales Manager'�� JOB_ID)
   AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;

-- Sales Manager�� JOB_ID
SELECT JOB_ID
  FROM JOBS
 WHERE JOB_TITLE = 'Sales Manager';
--==>> SA_MAN

UPDATE EMPLOYEES
   SET SALARY = (SELECT MAX_SALARY
                   FROM JOBS
                  WHERE JOB_TITLE = 'Sales Manager')
 WHERE JOB_ID = (SELECT JOB_ID
                   FROM JOBS
                  WHERE JOB_TITLE = 'Sales Manager')
   AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID
                   FROM JOBS
                  WHERE JOB_TITLE = 'Sales Manager')
   AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>>
/*
145	John	Russell	JRUSSEL	011.44.1344.429268	2004-10-01	SA_MAN	20080	0.4	100	80
146	Karen	Partners	KPARTNER	011.44.1344.467268	2005-01-05	SA_MAN	20080	0.3	100	80
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	2005-03-10	SA_MAN	20080	0.3	100	80
*/

SELECT *
  FROM EMPLOYEES;
SELECT *
  FROM DEPARTMENTS;
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� EMPLOYEES ���̺��� SALARY��
--   �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance �� 10%�λ�
--   Executive �� 15%�λ�
--   Accounting �� 20% �λ�
--   (���濡 ���� ��� Ȯ�� �� ROLLBACK~!!!)

UPDATE EMPLOYEES
   SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                   FROM DEPARTMENTS
                                  WHERE DEPARTMENT_NAME = 'Finance')
                           THEN SALARY * 1.1
                           WHEN (SELECT DEPARTMENT_ID
                                   FROM DEPARTMENTS
                                  WHERE DEPARTMENT_NAME = 'Executive')
                           THEN SALARY * 1.5
                           WHEN (SELECT DEPARTMENT_ID
                                   FROM DEPARTMENTS
                                  WHERE DEPARTMENT_NAME = 'Accounting')
                           THEN SALARY * 1.5
                           ELSE SALARY
                    END;
ROLLBACK;

-- Ǯ��
SELECT *
  FROM DEPARTEMENTS;
SELECT *
  FROM EMPLOYEES;

UPDATE EMPLOYEES;
   
-- WHERE �μ����� ('Finace', 'Executive', 'Accounting')
--                  ��
--WHERE �μ����� ('Finace', 'Executive', 'Accounting')�� �μ� ���̵�
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finace', 'Executive', 'Accounting');


UPDATE EMPLOYEES
   SET SALARY = CASE DEPARTMENT_ID WHEN ('Finace'�� �μ����̵�) 
                                   THEN SALARY * 1.1 
                                   WHEN ('Executive'�� �μ����̵�)
                                   THEN SALARY * 1.15
                                   WHEN ('Accounting'�� �μ����̵�)
                                   THEN SALARY * 1.2
                                   ELSE SALARY
                 END
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME IN ('Finace', 'Executive', 'Accounting'));

-- ('Finace'�� �μ����̵�)
SELECT DEPARTMENT_ID
  FROM DEPARTMETS
 WHERE DEPARTMENT_NAME = 'Finace';

SELECT DEPARTMENT_ID
  FROM DEPARTMETS
 WHERE DEPARTMENT_NAME = 'Executive';
 
SELECT DEPARTMENT_ID
  FROM DEPARTMETS
 WHERE DEPARTMENT_NAME = 'Accounting';
 
UPDATE EMPLOYEES
   SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                           FROM DEPARTMENTS
                                          WHERE DEPARTMENT_NAME = 'Finance')
                                   THEN SALARY * 1.1
                                   WHEN (SELECT DEPARTMENT_ID
                                           FROM DEPARTMENTS
                                          WHERE DEPARTMENT_NAME = 'Executive')
                                   THEN SALARY * 1.5
                                   WHEN (SELECT DEPARTMENT_ID
                                           FROM DEPARTMENTS
                                          WHERE DEPARTMENT_NAME = 'Accounting')
                                  THEN SALARY * 1.5
                                  ELSE SALARY
                    END
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                           FROM DEPARTMENTS
                          WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
-- �̷��� where�� �־�� �޸𸮸� �� �� ���̴� �׷��� ó���ϴ� ���� ���� ����

ROLLBACK;


--------------------------------------------------------------------------------

--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴµ� ����ϴ� ����

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];

-- ���̺� ����(������ ����)
CREATE TABLE TBL_EMPLOYEES
AS 
SELECT *
  FROM EMPLOYEES;
--==>> Table TBL_EMPLOYEES��(��) �����Ǿ����ϴ�.

SELECT *
  FROM TBL_EMPLOYEES
 WHERE EMPLOYEE_ID = 198;
-- ��ȸ�ϰ� �����
DELETE 
  FROM TBL_EMPLOYEES
 WHERE EMPLOYEE_ID = 198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� EMPLOYEES ���̺��� �������� �����͸� �����Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ��� ������)
--   �ٸ� ���ڵ忡 ���� �������ϰ� �ִ� ���
--   �������� ���� �� �ִٴ� ����� �����ؾ� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.

DELETE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'IT');

-- Ǯ��
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = ('IT' �μ��� �μ����̵�);
 
 -- ('IT' �μ��� �μ����̵�)
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME = 'IT';
--==>> 60

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
103	Alexander	Hunold	AHUNOLD	590.423.4567	2006-01-03	IT_PROG	9000		102	60
104	Bruce	Ernst	BERNST	590.423.4568	2007-05-21	IT_PROG	6000		103	60
105	David	Austin	DAUSTIN	590.423.4569	2005-06-25	IT_PROG	4800		103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	2006-02-05	IT_PROG	4800		103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	2007-02-07	IT_PROG	4200		103	60
*/

DELETE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'IT');
--==>> ���� �߻�
-- (ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found)
-- (�����ϴ� �����Ͱ� �ֱ� ����)

--------------------------------------------------------------------------------

--���� ��(VIEW) ����--

-- 1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
--    �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͵鸸��
--    ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ���ϴ� �÷��鸸�� ��Ƽ�
--    ����� ���� ������ ���̺�� ���Ǽ��� �� ���ȿ� ������ �ִ�.

--    ������ ���̺��̶�... �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--    �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̶�� �ǹ��̸�
--    �� ������ �����س��� SQL �����̶�� �� �� �ִ�.

-- 2. ���� �� ����
-- CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- ��������(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY]


--�� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME
     , D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;
  
--�� ��(VIEW) ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;

--�� ��(VIEW)�� ���� ��ȸ
DESC VIEW_EMPLOYEES;
--==>>

--�� ��(VIEW) �ҽ� Ȯ��       CHECK~!!!
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';
--==>>
/*
VIEW_EMPLOYEES	"SELECT E.FIRST_NAME, E.LAST_NAME
     , D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID"
*/