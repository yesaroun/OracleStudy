SELECT USER
FROM DUAL;
--==>> SCOTT

--�� BETWEEN �� AND �� �� ��¥��, ������, ������ ������ ��ο� ����ȴ�
--   ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������ (������ �迭)
--   �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����, BETWEEN �� AND �� �� �ش� ������ ����Ǵ� ��������
--   ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ����ó���ȴ�.


SELECT ASCII('A') "COL1", ASCII('B') "COL2", ASCII('a') "COL3", ASCII('b') "COL4"
FROM DUAL;
--==>>65	66	97	98

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
   OR JOB = 'CLERK';
--==>>
/*
SMITH	CLERK	     800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	     950
MILLER	CLERK	    1300
ȣ����	SALESMAN	(null)
������	SALESMAN	(null)
*/

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLERK');
--==>>
/*
SMITH	CLERK	     800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	     950
MILLER	CLERK	    1300
ȣ����	SALESMAN	(null)
������	SALESMAN	(null)
*/

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN', 'CLERK');  --(ANY�� ���߿� ��Ŷ� ��ġ�Ѱ� �ִٸ� �̶�� ����)
--==>>
/*
SMITH	CLERK	     800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	     950
MILLER	CLERK	    1300
ȣ����	SALESMAN	(null)
������	SALESMAN	(null)
*/

--(���� 3���� �� ������ �������� ������ ù��° ��� ���·� �ٲ� ó���ȴ�)
--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--   ������, �� ���� ������(OR)�� ���� ������ ó���ȴ�.
--   ���� �޸𸮿� ���� ������ �ƴ϶� CPUó���� ���� �����̹Ƿ�
--   �� �κб��� �����Ͽ� �������� �����ϰ� �Ǵ� ���� ���� �ʴ�.
--   �� ��IN���� ��=ANY���� ���� ������ ȿ���� ������.
--   �� �� ��δ� ���������� ��OR�������� ����Ǿ� ���� ó���ȴ�.


--------------------------------------------------------------------------------

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE        DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>>Table TBL_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;
--==>> ��ȸ ��� ����

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10) 
*/

--�� ������ ���̺� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '��μ�', '9707251234567', TO_DATE('2005-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '������', '9505152234567', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '������', '9905192234567', TO_DATE('2006-08-10', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '�̿���', '9508162234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '���̻�', '9805161234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '8005132234567', TO_DATE('1999-10-10', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0204053234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '6803171234567', TO_DATE('1998-10-10', 'YYYY-MM-DD'), 1500);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '6912232234567', TO_DATE('1998-10-10', 'YYYY-MM-DD'), 1300);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '���켱', '0303044234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 1600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '0506073234567', TO_DATE('2012-10-10', 'YYYY-MM-DD'), 2600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '���ù�', '0208073234567', TO_DATE('2012-10-10', 'YYYY-MM-DD'), 2600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '����', '6712121234567', TO_DATE('1998-10-10', 'YYYY-MM-DD'), 2200);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, 'ȫ����', '0005044234567', TO_DATE('2015-10-10', 'YYYY-MM-DD'), 5200);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '�Ӽҹ�', '9711232234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 5500);

--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 15

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	��μ�	    9707251234567	2005-01-03	3000
1002	������	    9505152234567	1999-11-23	4000
1003	������	    9905192234567	2006-08-10	3000
1004	�̿���	    9508162234567	2007-10-10	4000
1005	���̻�	    9805161234567	2007-10-10	4000
1006	������	    8005132234567	1999-10-10	1000
1007	������	    0204053234567	2010-10-10	1000
1008	������	    6803171234567	1998-10-10	1500
1009	������	6912232234567	1998-10-10	1300
1010	���켱	    0303044234567	2010-10-10	1600
1011	������	    0506073234567	2012-10-10	2600
1012	���ù�	    0208073234567	2012-10-10	2600
1013	����	    6712121234567	1998-10-10	2200
1014	ȫ����	    0005044234567	2015-10-10	5200
1015	�Ӽҹ�	    9711232234567	2007-10-10	5500
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_SAWON ���̺��� '������' ����� �����͸� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '������';
--==>> 1003	������	9905192234567	2006-08-10	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '������';            -- (�Ȱ���)
--==>> 1003	������	9905192234567	2006-08-10	3000

--�� LIKE : ���� �� �����ϴ�
--          �λ� �� ~�� ����, ~ó��     CHECK~!!!

--�� WHILD CARD(CHARACTER) �� ��%��
--   ��LIKE���� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE���� �Բ� ���Ǵ� ��_���� �ƹ� ���� �� ���� �ǹ��Ѵ�.

--�� TBL_SAWON ���̺��� ������ ���衻���� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '��';
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>1001	��μ�	9707251234567	2005-01-03	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>> 1001	��μ�	9707251234567	2005-01-03	3000

--�� TBL_SAWON ���̺��� ������ ���̡����� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT*
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
1003	������	9905192234567	2006-08-10	3000
1004	�̿���	9508162234567	2007-10-10	4000
1006	������	8005132234567	1999-10-10	1000
*/

--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ���Ρ��� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>>
/*
���ù�	0208073234567	2600
ȫ����	0005044234567	5200
�Ӽҹ�	9711232234567	5500
*/

--�� �߰� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1016, '���̰�', '0603194234567', TO_DATE('2015-01-20', 'YYYY-MM-DD'), 1500);

--�� Ŀ��
COMMIT;
==-->> Ŀ�� �Ϸ�

--�� TBL_SAWON ���̺��� ����� �̸��� ���̡���� ���ڰ�
--   �ϳ��� ���ԵǾ� �ִٸ� �� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT �����ȣ, �����, �޿�
FROM TBL_SAWON
WHERE ����� �̸��� ���̡���� ����;

SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
1003	������	3000
1004	�̿���	4000
1005	���̻�	4000
1006	������	1000
1007	������	1000
1016	���̰�	1500
*/


--�� TBL_SAWON ���̺��� ����� �̸��� ���̡���� ���ڰ�
--   �������� �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT �����ȣ, �����, �޿�
FROM TBL_SAWON
WHERE ����� �̸��� ���̡���� ���ڰ� �������� �� �� ;

SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';
--==>> 1016	���̰�	1500


--�� TBL_SAWON ���̺��� ����� �̸��� ���̡���� ���ڰ� �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
--==>>
/*
1006	������	1000
1016	���̰�	1500
*/

--�� TBL_SAWON ���̺��� ��� �̸��� �� ��° ���ڰ� ���̡��� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '_��%';
--==>>
/*
1005	���̻�	4000
1016	���̰�	1500
*/

--�� TBL_SAWON ���̺��� ����� ������ ���������� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>      (��� �Ұ����ϴ�)
/*
1008	������	1500
1009	������	1300
1010	���켱	1600
*/

--�� �����ͺ��̽� ���� ��������
--   ���� �̸��� �и��Ͽ� ó���ؾ��� ���� ��ȹ�� �ִٸ�
--   (���� ������ �ƴϴ���...)
--   ���̺��� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.


--�� TBL_SAWON ���̺��� ����������
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%';
--==>>
/*
1002	������	    4000
1003	������	    3000
1004	�̿���	    4000
1006	������	    1000
1009	������	1300
1010	���켱	    1600
1014	ȫ����	    5200
1015	�Ӽҹ�	    5500
1016	���̰�	    1500
*/

SELECT �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE ������ ����;

SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE �ֹι�ȣ �÷��� 7��° �ڸ� 1���� 2
      �ֹι�ȣ �÷��� 7��° �ڸ� 1���� 4;
      
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' 
   OR JUBUN LIKE '______4______';
--==>>
/*
1002	������	    4000
1003	������	    3000
1004	�̿���	    4000
1006	������	    1000
1009	������	1300
1010	���켱	    1600
1014	ȫ����	    5200
1015	�Ӽҹ�	    5500
1016	���̰�	    1500
*/


--�� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR2(20)
, BIGO          VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_WATCH)
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('���ð�', '�� ������ 99.99���� ȹ���� �����ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_WATCH;
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �����ð�
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_WATCH ���̺��� BIGO(���) �÷���
--   ��99.99%����� ���ڰ� ���Ե�(����ִ�) ��(���ڵ�)��
--   �����͸� ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO = '99.99%';      -- (�׳� �� ���� ����ִ� ���� ���� ã������)
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';   --(99.99�� �����ϴ� ���ڿ� ã�°���)
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%'; --(%�� �ϳ��� 2���� 3���� �ǹ̰� �޶����� ����)
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �����ð�
*/

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%%';
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �����ð�
*/


SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

--�� ESCAPE�� ���� ������ ���� �� ���ڸ� ���ϵ�ī�忡�� Ż����Ѷ�..
--   �Ϲ������� ���󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.


--------------------------------------------------------------------------------

--���� COMMIT / ROLLBACK ����--

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

-- 50�� ���ߺ� ����...
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ��ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
-- �޸�(RAM)�� �Էµ� ���̴�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50�� ���ߺ� ����... �� ���� �����Ͱ� �ҽǵǾ����� Ȯ��(�������� ����)


--�� �ٽ� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- 50�� ���ߺ� ����...
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ� �ϵ��ũ�� ����� ���� �ƴ϶�
-- �޸�(RAM) �� �Էµ� ���̴�.
-- �̸� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
-- COMMIT �� �����ؾ� �Ѵ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

-- Ŀ���� ������ ���� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
--  50�� ���ߺ� ����... �� �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT �� ������ ���ķ� DML ����(INSERT, UPDATE, DELETE)�� ����
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ������ ����� �� COMMIT �� �ϰ� ���� ROLLBACK�� �����غ���
--   �ƹ��� �ҿ��� ����.


--�� ������ ����(UPDATE �� TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME='������', LOC='���'
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ���
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�


--�� �ѹ� ���� �� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/


--�� ������ ����(DELETE �� TBL_DEPT)
DELETE TBL_DEPT
WHERE DEPTNO=50;    --(�̷��� �ص� ������ �츮�� �Ʒ�ó�� ����)

SELECT *
FROM TBL_DEPT
WHERE DEPTNO=50;        -- (�����Ұ� ���� Ȯ���ϱ�)

DELETE
FROM TBL_DEPT
WHERE DEPTNO=50; 
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ�Ϸ�

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/


---------------------------------------------------------------------

--���� ORDER BY �� ����--

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    ,  SAL*12+NVL(COMM, 0) "����"
FROM EMP;
--==>>
/*
SMITH	20	CLERK	     800	9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	     950	11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    ,  SAL*12+NVL(COMM, 0) "����"
FROM EMP
ORDER BY DEPTNO ASC;    -- DEPTNO �� ���� ���� : �μ� ��ȣ
                        -- ASC    �� ���� ���� : ��������
--==>>
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    ,  SAL*12+NVL(COMM, 0) "����"
FROM EMP
ORDER BY DEPTNO;        -- ASC    �� ���� ���� : �������� �� ���� ����~!!!


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    ,  SAL*12+NVL(COMM, 0) "����"
FROM EMP
ORDER BY DEPTNO DESC;        -- DESC    �� ���� ���� : �������� �� ���� �Ұ�~!!!
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	     950	11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	     800	9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    ,  SAL*12+NVL(COMM, 0) "����"
FROM EMP
ORDER BY ���� DESC;
==-->>
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	     950	11400
SMITH	20	CLERK	     800	9600
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "����", SAL "�޿�"
    ,  SAL*12+NVL(COMM, 0) "����"
FROM EMP
ORDER BY 2;     -- �μ���ȣ ��������
-- ORDER BY �μ���ȣ; (�̷��� ���ſ� �Ȱ���)
--> EMP ���̺��� ���� �ִ� ���̺��� ������ �÷� ����(2 �� ENAME)�� �ƴ϶�
--  SELECT ó���Ǵ� �� ��° �÷�(2 �� DEPTNO, �μ���ȣ)�� �������� ���ĵǴ� ���� Ȯ��
--  ASC ������ ���� �� �������� ���ĵǴ� ���� Ȯ��
--  ��, ��ORDER BY 2���� ��ORDER BY DEPTNO ASC��
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 4;  -- DEPTNO, SAL ���� ... ASC
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	     800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER	    2975
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
JAMES	30	CLERK	     950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	    2850
*/


SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 3, 4 DESC;          -- �� ���ڴ� ������ �÷��� ��ȣ�� �ǹ��ϴ°� �ƴ϶� ȣ���Ѱ��� ������
--> �� 2 �� DEPTNO(�μ���ȣ) ���� �������� ����
--  �� 3 �� JOB(������) ���� �������� ����
--  �� 4 DESC �� SAL(�޿�) ���� �������� ����
--     (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	     800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	     950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/


-----------------------------------------------------------------------


--�� CONCAT()
SELECT ENAME || JOB "COL1"
     , CONCAT(ENAME, JOB) "COL2"
FROM EMP;
--==>>
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST	    FORDANALYST
MILLERCLERK	    MILLERCLERK
*/

-- ���ڿ��� �����ϴ� ����� ���� �Լ� CONCAT()
-- ������ 2���� ���ڿ��� ���ս����� �� �ִ�.
SELECT ENAME || JOB || DEPTNO "COL1"
     , CONCAT(ENAME, JOB, DEPTNO) "COL2"
FROM EMP;
--==>> ���� �߻�
--      (ORA-00909: invalid number of arguments)

SELECT ENAME || JOB || DEPTNO "COL1"
     , CONCAT(CONCAT(ENAME, JOB), DEPTNO) "COL2"
FROM EMP;
--==>>
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30	    ALLENSALESMAN30
WARDSALESMAN30	    WARDSALESMAN30
JONESMANAGER20	    JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	    BLAKEMANAGER30
CLARKMANAGER10	    CLARKMANAGER10
SCOTTANALYST20	    SCOTTANALYST20
KINGPRESIDENT10	    KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	    FORDANALYST20
MILLERCLERK10	    MILLERCLERK10
*/


--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--  CONCAT() �� ���ڿ��� ���ڿ��� ���ս����ִ� �Լ�������
--  ���������� ���ڳ� ��¥�� ���ڷ� �ٲپ��ִ� ������ ���ԵǾ� �ִ�.


/*
obj.substring()
---
 |
���ڿ�.substring(n, m);
                 ------
                 n ���� m-1����... (�ε����� 0����)
*/

--�� SUBSTR() ���� ���� ��� / SUBSTRB() ���� ����Ʈ ���
SELECT ENAME "COL1"
     , SUBSTR(ENAME, 1, 2) "COL2"
FROM EMP;
--> ���ڿ��� �߷��ϴ� ����� ���� �Լ�
--  ù ��° �Ķ���� ���� ��� ���ڿ�(������ ���, TARGET)
--  �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(�ε����� 1���� ����)
--  �� ��° �Ķ���� ���� ������ ���ڿ��� ����(���� ��... ������)
--==>>
/*
SMITH	SM
ALLEN	AL
WARD	WA
JONES	JO
MARTIN	MA
BLAKE	BL
CLARK	CL
SCOTT	SC
KING	KI
TURNER	TU
ADAMS	AD
JAMES	JA
FORD	FO
MILLER	MI
*/


--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� Ȱ���� �� �ֵ��� �Ѵ�.
SELECT *
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1' 
   OR SUBSTR(JUBUN, 7, 1) = '3';
--==>>
/*
1001	��μ�	9707251234567	3000
1005	���̻�	9805161234567	4000
1007	������	0204053234567	1000
1008	������	6803171234567	1500
1011	������	0506073234567	2600
1012	���ù�	0208073234567	2600
1013	����	6712121234567	2200
*/

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3');
--==>>
/*
1001	��μ�	9707251234567	3000
1005	���̻�	9805161234567	4000
1007	������	0204053234567	1000
1008	������	6803171234567	1500
1011	������	0506073234567	2600
1012	���ù�	0208073234567	2600
1013	����	6712121234567	2200
*/


--�� LENGTH() ���� �� / LENGTHB() ����Ʈ ��
SELECT ENAME "COL1"
     , LENGTH(ENAME) "COL2"
     , LENGTHB(ENAME) "COL3"
FROM EMP;
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/

SELECT *
FROM NLS_DATABASE_PARAMETERS;       -- NLS�� ������ �������� �� �� �ִ�.
--==>>
/*
NLS_LANGUAGE	        AMERICAN
NLS_TERRITORY	        AMERICA
NLS_CURRENCY	        $
NLS_ISO_CURRENCY	    AMERICA
NLS_NUMERIC_CHARACTERS	.,
NLS_CHARACTERSET	    AL32UTF8
NLS_CALENDAR	        GREGORIAN
NLS_DATE_FORMAT	        DD-MON-RR
NLS_DATE_LANGUAGE	    AMERICAN
NLS_SORT	            BINARY
NLS_TIME_FORMAT	        HH.MI.SSXFF AM
NLS_TIMESTAMP_FORMAT	DD-MON-RR HH.MI.SSXFF AM
NLS_TIME_TZ_FORMAT	    HH.MI.SSXFF AM TZR
NLS_TIMESTAMP_TZ_FORMAT	DD-MON-RR HH.MI.SSXFF AM TZR
NLS_DUAL_CURRENCY	    $
NLS_COMP	            BINARY
NLS_LENGTH_SEMANTICS	BYTE
NLS_NCHAR_CONV_EXCP	    FALSE
NLS_NCHAR_CHARACTERSET	AL16UTF16
NLS_RDBMS_VERSION	    11.2.0.2.0
*/


--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "COL1"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"        --1
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"        --8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"        --8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "COL5"           --8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL6"        --0
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', -3) "COL7"          --18
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', -4) "COL8"          --8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', -4, 2) "COL9"       --1
FROM DUAL;
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����... (��� ���ڿ�, TARGET)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!!
--  �� ��° �Ķ���� ���� ã�� �����ϴ�(��ĵ�� �����ϴ�) ��ġ(�� ������ ��� �ڿ������� ��ĵ)
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(�� 1�� ���� ����)

SELECT '���ǿ���Ŭ �����ο��� �մϴ�.' "COL1"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�.', '����', 1) "COL2"        -- 3
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�.', '����', 2) "COL3"        -- 3
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�.', '����', 10) "COL4"       --10
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�.', '����', 11) "COL5"       -- 0
FROM DUAL;
--==>> ���ǿ���Ŭ �����ο��� �մϴ�.	3	3	10	0
--> ������ �Ķ���� ���� ������ ���·� ��� �� ������ �Ķ���� �� 1


--�� REVERSE()
SELECT 'ORACLE' "COL1"
     , REVERSE('ORACLE') "COL2"
     , REVERSE('����Ŭ') "COL3"
FROM DUAL;
--==>> ORACLE	ELCARO	???
--> ��� ���ڿ��� �Ųٷ� ��ȯ�Ѵ�. (��, �ѱ��� ����)


--�� �ǽ� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_FILES)
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'E:\STUDY\ORACLE.SQL');


--�� Ȯ��
SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	E:\STUDY\ORACLE.SQL
*/

--��Ŀ��
COMMIT;

SELECT FILENO "���Ϲ�ȣ"
    , FILENAME "���ϸ�"
FROM TBL_FILES;
--==>>
/*
----------- -------------------------
���� ��ȣ   ���ϸ�
----------- -------------------------
1	        C:\AAA\BBB\CCC\SALES.DOC
2	        C:\AAA\PANMAE.XXLS
3	        D:\RESEARCH.PPT
4	        C:\DOCUMENTS\STUDY.HWP
5	        C:\DOCUMENTS\TEMP\SQL.TXT
6	        D:\SHARE\F\TEST.PNG
7	        E:\STUDY\ORACLE.SQL
----------- -------------------------
*/

--�� TBL_FILES ���̺��� 
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
----------- -------------------------
���� ��ȣ   ���ϸ�
----------- -------------------------
1	        SALES.DOC
2	        PANMAE.XXLS
3	        RESEARCH.PPT
4	        STUDY.HWP
5	        SQL.TXT
6	        TEST.PNG
7	        ORACLE.SQL
----------- -------------------------
*/
SELECT FILENO "���� ��ȣ", FILENAME "���ϸ�"
FROM TBL_FILES
WHERE FILENO =1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC

SELECT FILENO "���� ��ȣ", FILENAME "����������ϸ�"
     , SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES
WHERE FILENO =1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO "���� ��ȣ", FILENAME "����������ϸ�"
     , SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC
2	C:\AAA\PANMAE.XXLS	        XLS
3	D:\RESEARCH.PPT	
4	C:\DOCUMENTS\STUDY.HWP	    UDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	MP\SQL.TX
6	D:\SHARE\F\TEST.PNG	        .PNG
7	E:\STUDY\ORACLE.SQL	        .SQL
*/

SELECT FILENO "���Ϲ�ȣ", REVERSE(FILENAME) "�ŲٷεȰ�ι����ϸ�"
FROM TBL_FILES;
--==>>
/*
1	COD.SELAS\CCC\BBB\AAA\:C        �� ���� ��\���� ���� ��ġ : 10 �� 1 ~ 9 ����
2	SLXX.EAMNAP\AAA\:C      
3	TPP.HCRAESER\:D
4	PWH.YDUTS\STNEMUCOD\:C
5	TXT.LQS\PMET\STNEMUCOD\:C
6	GNP.TSET\F\ERAHS\:D
7	LQS.ELCARO\YDUTS\:E
*/

SELECT  FILENO "���Ϲ�ȣ"
     , FILENAME "��ι����ϸ�"
     , REVERSE(FILENAME) "�ŲٷεȰ�ι����ϸ�"
     , SUBSTR(����ڿ�, ���������ġ, ���� ��\���� ������ġ - 1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

SELECT  FILENO "���Ϲ�ȣ"
     , FILENAME "��ι����ϸ�"
     , REVERSE(FILENAME) "�ŲٷεȰ�ι����ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, ���� ��\���� ������ġ - 1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

-- ���� ��\���� ������ġ
-- �� INSTR(REVERSE(FILENAME), '\', 1)       -- ������ �Ű����� 1 ����

SELECT  FILENO "���Ϲ�ȣ"
     , FILENAME "��ι����ϸ�"
     , REVERSE(FILENAME) "�ŲٷεȰ�ι����ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1) "�Ųٷε����ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	COD.SELAS\CCC\BBB\AAA\:C	COD.SELAS
2	C:\AAA\PANMAE.XXLS	        SLXX.EAMNAP\AAA\:C	        SLXX.EAMNAP
3	D:\RESEARCH.PPT	            TPP.HCRAESER\:D	            TPP.HCRAESER
4	C:\DOCUMENTS\STUDY.HWP	    PWH.YDUTS\STNEMUCOD\:C	    PWH.YDUTS
5	C:\DOCUMENTS\TEMP\SQL.TXT	TXT.LQS\PMET\STNEMUCOD\:C	TXT.LQS
6	D:\SHARE\F\TEST.PNG	        GNP.TSET\F\ERAHS\:D	        GNP.TSET
7	E:\STUDY\ORACLE.SQL	        LQS.ELCARO\YDUTS\:E	        LQS.ELCARO
*/

SELECT  FILENO "���Ϲ�ȣ"
     , FILENAME "��ι����ϸ�"
     , REVERSE(FILENAME) "�ŲٷεȰ�ι����ϸ�"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1))  "����ε����ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	COD.SELAS\CCC\BBB\AAA\:C	SALES.DOC
2	C:\AAA\PANMAE.XXLS	        SLXX.EAMNAP\AAA\:C	        PANMAE.XXLS
3	D:\RESEARCH.PPT	            TPP.HCRAESER\:D	            RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP	    PWH.YDUTS\STNEMUCOD\:C	    STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	TXT.LQS\PMET\STNEMUCOD\:C	SQL.TXT
6	D:\SHARE\F\TEST.PNG	        GNP.TSET\F\ERAHS\:D	        TEST.PNG
7	E:\STUDY\ORACLE.SQL	        LQS.ELCARO\YDUTS\:E	        ORACLE.SQL
*/

SELECT  FILENO "���Ϲ�ȣ"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) - 1))  "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	ORACLE.SQL
*/

--�� ��
SELECT FILENO "���� ��ȣ"
     , SUBSTR(FILENAME, INSTR(FILENAME, '\', -1)+1
     , INSTR(FILENAME, '.', -1)) 
     "���ϸ�"
FROM TBL_FILES;


--�� LPAD()
-->  Byte �� Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�     -- RPAD�� ���� �� �ι�° �Ķ���� ���� ����
SELECT 'ORACLE' "COL1"
     , LPAD('ORACLE', 10, '*') "COL2"
FROM DUAL;
--==>> ORACLE	****ORACLE
-->  �� 10Byte ������ Ȯ���Ѵ�.                 �� �� ��° �Ķ���� ���� ����...
--   �� Ȯ���� ������ 'ORACLE'���ڿ��� ��´�.  �� ù ��° �Ķ���� ���� ����...
--   �� �����ִ� Byte ������ �����ʡ����� �� ��° �Ķ���� ������ ä���.
--   �� �̷��� ������ ���� ����� ��ȯ�Ѵ�.

--�� RPAD()
-->  Byte�� Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
--==>> ORACLE	ORACLE****
-->  �� 10Byte ������ Ȯ���Ѵ�.                 �� �� ��° �Ķ���� ���� ����...
--   �� Ȯ���� ������ 'ORACLE'���ڿ��� ��´�.  �� ù ��° �Ķ���� ���� ����...
--   �� �����ִ� Byte ������ �������ʡ����� �� ��° �Ķ���� ������ ä���.
--   �� �̷��� ������ ���� ����� ��ȯ�Ѵ�.


--�� LTRIM()     --(�ڹٿ��� Ʈ�� �����ϱ� ������� �Ȱ��� �׷��� ��� ������ ������(��) ��ȯ)
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  ���ʺ��� ���������� �����ϴ� �� ��° �Ķ���� ������ ������ ���ڿ�
--  ���� ���ڰ� ������ ��� �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.
SELECT 'ORAORAORACLEORACLE' "COL1"
     , LTRIM('ORAORAORACLEORACLE', 'ORA') "COL2"
     , LTRIM('AAAAAAAAAAAAAAAAORAORAORACLEORACLE', 'ORA') "COL3" -- (�տ� A�� ���� ORA�� A�����ϱ�)
     , LTRIM('ORAoRAORACLEORACLE', 'ORA') "COL4"
     , LTRIM('ORAORA ORACLEORACLE', 'ORA') "COL5"
     , LTRIM('             ORACLE', ' ') "COL6"             -- (�̷��� ���� ���� �Լ��� ���� ����)
     , LTRIM('             ORACLE') "COL7"                  -- (������ ��� ���� ����)
FROM DUAL;
--==>> 
/*
ORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRAORACLEORACLE	
 ORACLEORACLE	
ORACLE	
ORACLE
*/


SELECT LTRIM('�̱���̱���̱��ŽŽ��̱����̽ű���̹��̱��', '�̱��') "RESULT"
FROM DUAL;
--==>> ���̱��


--�� RTRIM()
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  �����ʺ��� ���������� �����ϴ� �� ��° �Ķ���� ������ ������ ���ڿ�
--  ���� ���ڰ� ������ ��� �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.

--�� TRANSLATE()
-->  1:1�� �ٲ��ش�.
SELECT TRANSLATE('MY ORACLE SERVER'
               , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
               , 'Abcdefghijklmnopqrstuvwxyz') "RESULT"
FROM DUAL;
--==>> my orAcle server
-- (ù��° �Ķ���� ������ �빮�� M���� 1:1�� �����Ǵ� �׷��ϱ� 2��° �Ķ���Ϳ��� �����Ǵ� 3��° �Ķ���� ������ �ٲ�)

SELECT TRANSLATE('010-4139-4969'
               , '0123456789'
               , '�����̻�����ĥ�ȱ�') "RESULT"
FROM DUAL;
--==>> ���Ͽ�-���ϻﱸ-�籸����


--�� REPLACE()
SELECT REPLACE('MY ORACLE SERVER ORAHOME', 'ORA', '����') "RESULT"
FROM DUAL;
--==>> MY ����CLE SERVER ����HOME

-- ���ݱ��� ����ó�� ���� �Լ��̰�
-- ������ ���� ���� �Լ� ���ڴ�.