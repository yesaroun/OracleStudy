SELECT USER
FROM DUAL;
--==>> SCOTT


SELECT DEPTNO, SAL
FROM EMP
ORDER BY 1;
--==>>
/*
10	2450��
10	5000��
10	1300��
20	2975��
20	3000��
20	1100��
20	800 ��
20	3000��
30	1250��
30	1500��
30	1600��
30	950 ��
30	2850��
30	1250��
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
--==>> 
/*
10	8750
20	10875
30	9400
*/

SELECT *
FROM EMP;

SELECT *
FROM TBL_EMP;


--�� ������ �����ص� TBL_EMP ���̺� ����
DROP TABLE TBL_EMP;
--==>>Table TBL_EMP��(��) �����Ǿ����ϴ�.


--�� �ٽ� EMP ���̺� �����Ͽ� TBL_EMP ���̺� ����
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;

--�� �ǽ� ������ �߰� �Է�(TBML_EMP)
INSERT INTO TBL_EMP VALUES
(8001, 'ȫ����', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8002, '����', 'CLERK', 7566, SYSDATE, 2000, 10, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8003, '��ȣ��', 'SALESMAN', 7698, SYSDATE, 1700, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8004, '�Ž���', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8005, '������', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	 800  (null)    20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	 300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	 500	30
7566	JONES	MANAGER	    7839	1981-04-02	2975  (null)   	20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850  (null)    30
7782	CLARK	MANAGER	    7839	1981-06-09	2450  (null)    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000  (null)    20
7839	KING	PRESIDENT		    1981-11-17	5000  (null)    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	   0	30
7876	ADAMS	CLERK	    7788	1987-07-13	1100  (null)    20
7900	JAMES	CLERK	    7698	1981-12-03	950		  30
7902	FORD	ANALYST 	7566	1981-12-03	3000	    	20
7934	MILLER	CLERK	    7782	1982-01-23	1300	    	10
8001	ȫ����	CLERK	    7566	2022-02-24	1500	  10	
8002	����	CLERK	    7566	2022-02-24	2000	  10	
8003	��ȣ��	SALESMAN	7698	2022-02-24	1700		
8004	�Ž���	SALESMAN	7698	2022-02-24	2500		
8005	������	SALESMAN	7698	2022-02-24	1000		
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;
--==>>
/*
20	 800	(null)
	1700	(null)
	1000	(null)
10	1300	(null)
20	2975	(null)
30	2850	(null)
10	2450	(null)
20	3000	(null)
10	5000	(null)
	2500	(null)
20	1100	(null)
30	 950	(null)
20	3000	(null)
30	1250	1400
30	1250	500
30	1600	300
	1500	10
	2000	10
30	1500	0
*/
--�� ����Ŭ������ null�� ���� ū ���� ���·� �����Ѵ�.
--   (ORACLE 9i ������ NULL�� ���� ���� ���� ���·� �����߾���.
--   MSSQL�� NULL�� ���� ���� ���� ���·� �����Ѵ�.


--�� TBL_EMP ���̺��� ������� �μ��� �޿��� ��ȸ
--   �μ���ȣ, �޿��� �׸� ��ȸ
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
    10	 8750
    20	10875
    30	 9400
(null)	 8700
*/


--�� ROLLUP ���       --(������)
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
    10	 8750
    20	10875
    30	 9400
(null)	 8700   -- �μ���ȣ�� ���� ���� �������� �޿���
(null)	37725   -- ���μ� �������� �޿���
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
    10	 8750
    20	10875
    30	 9400
(null)	29025
*/

SELECT NVL(TO_CHAR(DEPTNO), '���μ�') "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
/*
--------    ------
�μ���ȣ    �޿���
--------    -------
    10	    8750
    20	    10875
    30	    9400
���μ�    29025
*/


SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '���μ�') "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
���μ�	29025
*/

SELECT NVL(TO_CHAR(DEPTNO), '���μ�') "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
���μ�	8700
���μ�	37725
*/

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '���μ�') "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
���μ�	8700
���μ�	37725
*/
-- (�̷����ϸ� NULL�̶� ������ ��ƴ�)

SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
0	10	8750
0	20	10875
0	30	9400
1		29025
*/

SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>      (�巡�� �ϰ� f5 ������ ��ũ��Ʈ���� ��µȴ�.)
/*
  GROUPING   �μ���ȣ     �޿���
---------- ---------- ----------
         0         10       8750
         0         20      10875
         0         30       9400
         0     (null)       8700        -- ����
         1     (null)      37725        -- ��� �μ�.
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	8700
	37725
*/

--�� ������ ��ȸ�� �ش� ������
/*
      10	8750
      20	10875
      30	9400
    ����	8700
���μ�	37725
*/
--�̿� ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

--�� ����
SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "�μ���ȣ", SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

--�� ��Ʈ
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN '���Ϻμ�'
            ELSE '���μ�'
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
���Ϻμ�	8750
���Ϻμ�	10875
���Ϻμ�	9400
���Ϻμ�	8700
���μ�	37725
*/
-- �� Ǯ��
SELECT CASE GROUPING(DEPTNO) WHEN 1 THEN '���μ�'
            ELSE NVL2(DEPTNO, TO_CHAR(DEPTNO), '����')
            END "�μ���ȣ"
          , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

-- Ǯ��
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO
            ELSE -1
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO
            ELSE '���μ�'
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> ���� �߻�
--     ORA-00932: inconsistent datatypes: expected NUMBER got CHAR      -- (Ÿ���� �޶�)

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN TO_CHAR(DEPTNO)
            ELSE '���μ�'
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
(null)	    8700
���μ�	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '���μ�'
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
�μ���ȣ                                     �޿���
---------------------------------------- ----------
10                                             8750
20                                            10875
30                                             9400
����                                           8700
���μ�                                      37725
*/


--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
-----------------------------
    ����      �޿���
-----------------------------
      ��        XXX
      ��        XXX
�����       XXXX
-----------------------------
*/

-- �� Ǯ��
SELECT NVL(T.����, '�����') "����", SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
                ELSE 'Ȯ�κҰ�'
            END "����"
               , SAL "�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);
--==>>
/*
����           �޿���
----        ----------
��              21900
��              32100
�����        54000
*/

-- Ǯ��
SELECT T.���� "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
                ELSE '����Ȯ�κҰ�' 
            END "����"
          , SAL "�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	    21900
��	    32100
(null)	54000
*/
SELECT CASE GROUPING(T.����) WHEN 0 THEN T.���� 
                             ELSE '�����' 
       END "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
                ELSE '����Ȯ�κҰ�' 
            END "����"
          , SAL "�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);
--==>>
/*
      ��	21900
      ��	32100
�����	54000
*/

SELECT *
FROM VIEW_SAWON;

--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� ���ɴ뺰 �ο����� Ȯ���� �� �ִ�
--   �������� �����Ѵ�.
/*
-----------------------------
    ���ɴ�     �ο���
-----------------------------
    10              X
    20              X
    40              X
    50              X
    ��ü           XX
-----------------------------
*/
-- �� Ǯ�� �ٵ� ���� Ʋ��
SELECT CASE GROUPING(T2.���ɴ�) WHEN 0 THEN T2.���ɴ�
                               ELSE '��ü'
       END "���ɴ�"
     , SUM(T2.�ӽ�) "�ο���"
FROM
(
    SELECT CASE WHEN T1.����>=50 THEN '50'
                WHEN T1.����>=40 THEN '40'
                WHEN T1.����>=20 THEN '20'
                WHEN T1.����>=10 THEN '10'
            END "���ɴ�"
            , SUM(T1.�ӽ�) "�ӽ�"       
    FROM
    (
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (1899 + TO_NUMBER(SUBSTR(JUBUN, 1, 2)))
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (1999 + TO_NUMBER(SUBSTR(JUBUN, 1, 2)))
                    ELSE -1 
                END "����"
             , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN 1
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN 1
                    ELSE 0 
                END "�ӽ�"
        FROM TBL_SAWON
    ) T1
    GROUP BY ROLLUP(T1.����)
) T2
GROUP BY ROLLUP(T2.���ɴ�);


--Ǯ��
-- ��� 1. �� INLINE VIEW �� �� �� ��ø
SELECT NVL(TO_CHAR(T2.���ɴ�), '��ü') "���ɴ�"
     , COUNT(*) "�ο���"
FROM
(
    SELECT CASE WHEN T1.���� >= 50 THEN 50
                WHEN T1.���� >= 40 THEN 40
                WHEN T1.���� >= 30 THEN 30
                WHEN T1.���� >= 20 THEN 20
                WHEN T1.���� >= 10 THEN 10
                ELSE 0
            END "���ɴ�"
    FROM
    (
    -- ����
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE -1 
                END "����"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.���ɴ�);
--==>>
/*
    10	2
    20	12
    40	1
    50	3
  ��ü	18
*/

SELECT CASE GROUPING(T2.���ɴ�) WHEN 0 THEN TO_CHAR(T2.���ɴ�)
            ELSE '��ü' END "���ɴ�"
     , COUNT(*) "�ο���"
FROM
(
    SELECT CASE WHEN T1.���� >= 50 THEN 50
                WHEN T1.���� >= 40 THEN 40
                WHEN T1.���� >= 30 THEN 30
                WHEN T1.���� >= 20 THEN 20
                WHEN T1.���� >= 10 THEN 10
                ELSE 0
            END "���ɴ�"
    FROM
    (
    -- ����
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE -1 
                END "����"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.���ɴ�);
--==>>
/*
    10	2
    20	12
    40	1
    50	3
  ��ü	18
*/


-- ��� 2. �� INLINE VIEW �� �� ����

-- ���ɴ�
SELECT CASE GROUPING(T.���ɴ�) WHEN 0 THEN TO_CHAR(T.���ɴ�) 
                               ELSE '��ü' 
       END "���ɴ�"
     , COUNT(*) "�ο���"
FROM
(
    SELECT TRUNC(CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                      WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                      ELSE -1 
                 END, -1) "���ɴ�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.���ɴ�);


SELECT TRUNC(27, -1) "RESULT"
FROM DUAL;



SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1, 2;
--==>>
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300            -- 10�� �μ� CLERK ������ �޿���
10	    MANAGER	    2450            -- 10�� �μ� MANAGER ������ �޿���
10	    PRESIDENT	5000            -- 10�� �μ� PRESIDENT ������ �޿���
10	    (null)	    8750            -- 10�� �μ� ��� ������ �޿���        -- CHECK~!!!
20	    ANALYST	    6000            -- 20�� �μ� ANALYST ������ �޿���
20	    CLERK	    1900            -- 20�� �μ� CLERK ������ �޿���
20	    MANAGER	    2975                    :
20	    (null)	    10875           -- 20�� �μ� ��� ������ �޿���        -- CHECK!!
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400            -- 30�� �μ� ��� ������ �޿���        -- CHECK!!
(null)  (null)	    29025           -- ��� �μ� ��� ������ �޿���        -- CHECK!!
*/


--�� CUBE() �� ROLLUP() ���� �� �ڼ��� ����� ��ȯ�Ѵ�.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (null)	    8750
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (null)	    10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400
(null)	ANALYST	    6000        -- ��� �μ� ANALYST ������ �޿���
(null)	CLERK	    4150        -- ��� �μ� CLERK ������ �޿���
(null)	MANAGER	    8275        -- ��� �μ� MANAGER ������ �޿���
(null)	PRESIDENT	5000        -- ��� �μ� PRESIDENT ������ �޿���
(null)	SALESMAN	5600        -- ��� �μ� SALESMANE ������ �޿���
(null)	(null)	    29025
*/

--�� ROLLUP() �� CUBE() ��
--   �׷��� �����ִ� ����� �ٸ���(����)

--EX.
-- ROLLUP(A, B, C)
--  �� (A, B, C) / (A, B) / (A) / ()

-- CUBE(A, B, C)
-- �� (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()

--==>> ������ ����� ��(ROLLUP())�� ���� ����� �ټ� ���ڶ��
--     �Ʒ����� ����� ��(CUBE())�� ���� ����� �ټ� ����ġ�� ������
--     ������ ���� ����� ���� ���¸� �� ���� ����Ѵ�.
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS��FMF 
--     �̿��Ͽ� �����ִ� ����̴�.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
            ELSE '��ü�μ�'
        END "�μ���ȣ" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
        END "����"
     , SUM(SAL) "�޿���"  
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        ��ü����	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	    3500
����	    SALESMAN	5200
����	    ��ü����	8700
��ü�μ�	��ü����	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
            ELSE '��ü�μ�'
        END "�μ���ȣ" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
        END "����"
     , SUM(SAL) "�޿���"  
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
      10	CLERK	    1300
      10	MANAGER	    2450
      10	PRESIDENT	5000
      10	��ü����	8750
      20	ANALYST	    6000
      20	CLERK	    1900
      20	MANAGER	    2975
      20	��ü����	10875
      30	CLERK	    950
      30	MANAGER	    2850
      30	SALESMAN	5600
      30	��ü����	9400
    ����	CLERK	    3500
    ����	SALESMAN	5200
    ����	��ü����	8700
��ü�μ�	ANALYST	    6000
��ü�μ�	CLERK	    7650
��ü�μ�	MANAGER	    8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	10800
��ü�μ�	��ü����	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
            ELSE '��ü�μ�'
        END "�μ���ȣ" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
        END "����"
     , SUM(SAL) "�޿���"  
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())  
ORDER BY 1, 2;
--> CUBE()�� ����� ����� ���� ��ȸ ���

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') 
            ELSE '��ü�μ�'
        END "�μ���ȣ" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����'
        END "����"
     , SUM(SAL) "�޿���"  
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())  
ORDER BY 1, 2;
--> ROLLUP()�� ����� ����� ���� ��ȸ ���

SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;


--�� TBL_EMP ���̺��� �������
--   �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
-- �� Ǯ��
SELECT CASE GROUPING(T.�Ի�⵵) WHEN 0 THEN TO_CHAR(T.�Ի�⵵)
                                 ELSE '��ü'
       END "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM
(
    SELECT TO_NUMBER(SUBSTR(TO_CHAR(HIREDATE), 1, 4)) "�Ի�⵵"
    FROM TBL_EMP
) T
GROUP BY ROLLUP(T.�Ի�⵵);

-- Ǯ��
SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2022	5
(null)	19
*/

-- (�̷��� �Ҷ� ����������)
SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> ���� �߻�
--     ORA-00979: not a GROUP BY expression

SELECT TO_CHAR(HIREDATE, 'YYYY') "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2022	5
(NULL)	19
*/-- GROUP BY ���� �������� �̷��� �����ϱ� ������ ���� ǥ���ϴ°� �ٸ� Ÿ������ �Ϸ��� �ؼ� ���� ����°���

SELECT TO_CHAR(HIREDATE, 'YYYY') "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>> ���� �߻�
--     ORA-00979: not a GROUP BY expression
-- (�̰͵� �׷��� �����ΰ��� �׷��� �ٸ� ������ ������ �����ϸ� ������ ����°Ŵ�.)
--  (�̰� CUBE, �ᵵ �׷��� GROUP BY�� �ص� �׷��� �� �׷���)
-- (�׷��� GROUP BY�� �����Ҷ��� GROUP BY���� ������ ������ ������ �ؾ��Ѵ�)

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0 
            THEN EXTRACT(YEAR FROM HIREDATE) 
            ELSE "��ü"
        END "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
-- (GROUP BY�� EXTRACT�ϰ� ������ TOCHAR ����/ THEN���ϴ� ���� Ÿ���ϰ� ������ ���� Ÿ���ؼ� ������)
--==>> ���� �߻�
--     ORA-00904: "��ü": invalid identifier

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0 
            THEN TO_CHAR(HIREDATE, 'YYYY') 
            ELSE '��ü'
        END "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--(�̰� ���� ���� ���ư�/ �� ���� TOCHAR�� ó����)

SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 
            THEN EXTRACT(YEAR FROM HIREDATE) 
            ELSE -1
        END "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--(�̰͵� ���� ���� ���ư�/ �� ���� Ÿ����/ EXTRACT�� �����ϴ°� ����Ÿ���� ��¥Ÿ�� �ƴ�)


SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 
            THEN TO_CHAR(EXTRACT(YEAR FROM HIREDATE))       -- (�̷��� �ϸ� ���� �ȳ��� ��ü�� �ٲ� �� ����)
            ELSE '��ü'
        END "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
1980	1
1981	10
1982	1
1987	2
2022	5
��ü	19
*/


--------------------------------------------------------------------------------


--���� HAVING ����--

--�� EMP ���̺��� �μ���ȣ�� 20, 30 �� �μ��� �������
--   �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
  AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> ���� �߻�
--     ORA-00934: group function is not allowed here
-- (GROUP �Լ��� �Ϲ� WHERE���� �� �� ��� ����� ������)


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) < 100000
   AND DEPTNO IN (20, 30);
--==>> 30	9400
--(���� ����� ������������ FROM�� WHERE�� 1�������� �޸𸮷� �ø� �� �ø� ������ �߰������� ����ϴ°ǵ� �� ���� ���� ����Ŭ�� �����Ÿ� ���ݴ� �����ϰ� ó���Ѵ� )
--(�� ���� FROM WHERE GROUP BY ������ �˸� ���� �� ȿ�������� �� �� �ִ� �̷��� ���� ���̰� �����ս��� �̾�����/ �̷��� ���� ���̰� Ŭ���̾�Ʈ �������� ���� �� �ִ�)


--------------------------------------------------------------------------------

--���� ��ø �׷��Լ� / �м��Լ� ����--

-- �׷� �Լ��� 2LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- MSSQL�� �̸����� �Ұ����ϴ�.

SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875        (�̷� ���°� �׷� �Լ��� ��÷����)

SELECT MIN(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 8750


--�� RANK()
--   DENSE_RANK()
--> ORACLE 9i ���� ����... MSSQL 2005���� ����...

-- ���� ���������� RANK() �� DENSE_RANK()�� ����� �� ���� ������
-- ���� ���... �޿� ������ ���ϰ��� �Ѵٸ�...
-- �ش� ����� �޿����� �� ū ���� �� �������� Ȯ���� ��
-- Ȯ���� ���� +1�� �߰� ������ �ָ�...
-- �� ���� �� �ش� ����� �޿� ����� �ȴ�.
SELECT *
FROM EMP;

--�� SMITH�� �޿� ��� Ȯ��
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;     -- SMITH�� �޿�
--==>> 14            -- SMITH�� �޿� ���

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;   -- ALLEN�� �޿�
--==>> 7            -- ALLEN�� �޿� ���


--�� ���� ��� ����(��� ���� ����)
--   ���� ������ �ִµ� ���̺��� �÷���
--   ���� ������ ������(WHERE��, HAVING��) �� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ����(��� ���� ����)��� �θ���.

SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;
--==>>
/*
SMITH	 800	1
ALLEN	1600	1
WARD	1250	1
JONES	2975	1
MARTIN	1250	1
BLAKE	2850	1
CLARK	2450	1
SCOTT	3000	1
KING	5000	1
TURNER	1500	1
ADAMS	1100	1
JAMES	 950	1
FORD	3000	1
MILLER	1300	1
*/

SELECT ENAME "�����", SAL "�޿�", (SELECT COUNT(*) + 1 FROM EMP WHERE SAL > 800) "�޿����"
FROM EMP;
--==>>
/*
SMITH	 800	14
ALLEN	1600	14
WARD	1250	14
JONES	2975	14
MARTIN	1250	14
BLAKE	2850	14
CLARK	2450	14
SCOTT	3000	14
KING	5000	14
TURNER	1500	14
ADAMS	1100	14
JAMES	 950	14
FORD	3000	14
MILLER	1300	14
*/ -- (��� 14�� ����)

SELECT ENAME "�����", SAL "�޿�"
    , (SELECT COUNT(*) + 1 
       FROM EMP 
       WHERE SAL > E.SAL) "�޿����"
FROM EMP E;
--==>>
/*
SMITH	 800	14
ALLEN	1600	7
WARD	1250	10
JONES	2975	4
MARTIN	1250	10
BLAKE	2850	5
CLARK	2450	6
SCOTT	3000	2
KING	5000	1
TURNER	1500	8
ADAMS	1100	12
JAMES	 950	13
FORD	3000	2
MILLER	1300	9
*/


--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK()�Լ��� ������� �ʰ� ������������ Ȱ���� �� �ֵ��� �Ѵ�.
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;    --SMITH�� �޿�
--==>> 14           -- SMITH�� �޿� ���

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800     -- SMITH �� �޿�
  AND DEPTNO = 20;  -- SMITH�� �μ�
--==>> 5            -- SMITH�� �μ��� �޿����

SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "��ü�޿����"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL
        AND DEPTNO = E.DEPTNO) "�μ����޿����"
FROM EMP E;
--==>>
/*
SMITH	 800	20	14	5
ALLEN	1600	30	7	2
WARD	1250	30	10	4
JONES	2975	20	4	3
MARTIN	1250	30	10	4
BLAKE	2850	30	5	1
CLARK	2450	10	6	2
SCOTT	3000	20	2	1
KING	5000	10	1	1
TURNER	1500	30	8	3
ADAMS	1100	20	12	4
JAMES	 950	30	13	6
FORD	3000	20	2	1
MILLER	1300	10	9	3
*/

--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�
--------------------------------------------------------------------------------
-- ����� �μ���ȣ  �Ի���            �޿�  �μ����Ի纰�޿�����
--------------------------------------------------------------------------------
-- SMITH    20      1980-12-17        800                   800
-- JONES    20      1981-04-02       2975                  3775
-- FORD     20      1981-12-03       3000                  6775
-- 
--------------------------------------------------------------------------------

-- �� Ǯ��
SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , (SELECT SUM(SAL)
               FROM EMP
               WHERE DEPTNO = E.DEPTNO
               AND E.HIREDATE >= HIREDATE) "�μ����Ի纰�޿�����"
FROM EMP E
ORDER BY DEPTNO, HIREDATE;


-- Ǯ��
SELECT EMP.ENAME, DEPTNO, HIREDATE, SAL, (1) "�μ����Ի纰�޿�����"
FROM SCOTT.EMP
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
       , (1) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
       , (SELECT SUM(E2.SAL)
          FROM EMP E2) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
       , (SELECT SUM(E2.SAL)
          FROM EMP E2
          WHERE E2.DEPTNO = E1.DEPTNO
            AND E2.HIREDATE <= E1.HIREDATE ) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;
--==>>
/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	 800	800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	 950	9400
*/


--�� EMP ���̺��� �������
--   �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ֵ��� �������� �����Ѵ�
SELECT *
FROM EMP;

------------------------------------------------------------
--  �Ի���        �ο���
------------------------------------------------------------

-- �� Ǯ��
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , (SELECT COUNT(*)
       FROM EMP E2
       WHERE TO_CHAR(E2.HIREDATE, 'YYYY-MM') LIKE TO_CHAR(E1.HIREDATE, 'YYYY-MM')
       ) "�ο���"
FROM EMP E1
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;

-- Ǯ��
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>>
/*
1981-05	1
1981-12	2   ��
1982-01	1
1981-09	2   ��
1981-02	2   ��
1981-11	1
1980-12	1
1981-04	1
1987-07	2   ��
1981-06	1
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM EMP
WHERE COUNT(*) = 2
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> ���� �߻�
--     ORA-00934: group function is not allowed here

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 2     -- ����� ��� ���� ���� �ο� ���� �Ի� ī��Ʈ
ORDER BY 1;
--==>>
/*
1981-02	2
1981-09	2
1981-12	2
1987-07	2
*/

SELECT COUNT(*)
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> (�ο��� Ȯ����)

-- ����� ��� ���� ���� �ο� ���� �Ի� ī��Ʈ
SELECT MAX(COUNT(*))
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 2


SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (
                   SELECT MAX(COUNT(*))
                   FROM EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
                   )
ORDER BY 1;
--==>>
/*
1981-02	2
1981-09	2
1981-12	2
1987-07	2
*/





