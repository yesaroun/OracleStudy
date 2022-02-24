SELECT USER
FROM DUAL;
--==>> SCOTT


SELECT DEPTNO, SAL
FROM EMP
ORDER BY 1;
--==>>
/*
10	2450┐
10	5000│
10	1300┘
20	2975┐
20	3000│
20	1100│
20	800 │
20	3000┘
30	1250┐
30	1500│
30	1600│
30	950 │
30	2850│
30	1250┘
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


--○ 기존에 복사해둔 TBL_EMP 테이블 제거
DROP TABLE TBL_EMP;
--==>>Table TBL_EMP이(가) 삭제되었습니다.


--○ 다시 EMP 테이블 복사하여 TBL_EMP 테이블 생성
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.

SELECT *
FROM TBL_EMP;

--○ 실습 데이터 추가 입력(TBML_EMP)
INSERT INTO TBL_EMP VALUES
(8001, '홍은혜', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8002, '김상기', 'CLERK', 7566, SYSDATE, 2000, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8003, '이호석', 'SALESMAN', 7698, SYSDATE, 1700, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8004, '신시은', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8005, '김태형', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
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
8001	홍은혜	CLERK	    7566	2022-02-24	1500	  10	
8002	김상기	CLERK	    7566	2022-02-24	2000	  10	
8003	이호석	SALESMAN	7698	2022-02-24	1700		
8004	신시은	SALESMAN	7698	2022-02-24	2500		
8005	김태형	SALESMAN	7698	2022-02-24	1000		
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

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
--※ 오라클에서는 null을 가장 큰 값의 형태로 간주한다.
--   (ORACLE 9i 까지는 NULL을 가장 작은 값의 형태로 간주했었다.
--   MSSQL은 NULL을 가장 작은 값의 형태로 간주한다.


--○ TBL_EMP 테이블을 대상으로 부서별 급여합 조회
--   부서번호, 급여합 항목 조회
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
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


--○ ROLLUP 사용       --(총합임)
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
    10	 8750
    20	10875
    30	 9400
(null)	 8700   -- 부서번호를 갖지 못한 직원들의 급여합
(null)	37725   -- 모든부서 직원들의 급여합
*/

SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
    10	 8750
    20	10875
    30	 9400
(null)	29025
*/

SELECT NVL(TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
/*
--------    ------
부서번호    급여합
--------    -------
    10	    8750
    20	    10875
    30	    9400
모든부서    29025
*/


SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
모든부서	29025
*/

SELECT NVL(TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
모든부서	8700
모든부서	37725
*/

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '모든부서') "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
모든부서	8700
모든부서	37725
*/
-- (이렇게하면 NULL이랑 구분이 어렵다)

SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
0	10	8750
0	20	10875
0	30	9400
1		29025
*/

SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "부서번호", SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>      (드래그 하고 f5 누르면 스크립트에서 출력된다.)
/*
  GROUPING   부서번호     급여합
---------- ---------- ----------
         0         10       8750
         0         20      10875
         0         30       9400
         0     (null)       8700        -- 인턴
         1     (null)      37725        -- 모든 부서.
*/

SELECT DEPTNO "부서번호", SUM(SAL)"급여합"
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

--○ 위에서 조회한 해당 내용을
/*
      10	8750
      20	10875
      30	9400
    인턴	8700
모든부서	37725
*/
--이와 같이 조회될 수 있도록 쿼리문을 구성한다.

--※ 참고
SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

--※ 힌트
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN '단일부서'
            ELSE '모든부서'
        END "부서번호"
      , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
단일부서	8750
단일부서	10875
단일부서	9400
단일부서	8700
모든부서	37725
*/
-- 내 풀이
SELECT CASE GROUPING(DEPTNO) WHEN 1 THEN '모든부서'
            ELSE NVL2(DEPTNO, TO_CHAR(DEPTNO), '인턴')
            END "부서번호"
          , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

-- 풀이
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO
            ELSE -1
        END "부서번호"
      , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN DEPTNO
            ELSE '모든부서'
        END "부서번호"
      , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> 에러 발생
--     ORA-00932: inconsistent datatypes: expected NUMBER got CHAR      -- (타입이 달라서)

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN TO_CHAR(DEPTNO)
            ELSE '모든부서'
        END "부서번호"
      , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
(null)	    8700
모든부서	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '모든부서'
        END "부서번호"
      , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
부서번호                                     급여합
---------------------------------------- ----------
10                                             8750
20                                            10875
30                                             9400
인턴                                           8700
모든부서                                      37725
*/


--○ TBL_SAWON 테이블을 대상으로
--   다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
-----------------------------
    성별      급여합
-----------------------------
      남        XXX
      여        XXX
모든사원       XXXX
-----------------------------
*/

-- 내 풀이
SELECT NVL(T.성별, '모든사원') "성별", SUM(T.급여) "급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여'
                ELSE '확인불가'
            END "성별"
               , SAL "급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);
--==>>
/*
성별           급여합
----        ----------
남              21900
여              32100
모든사원        54000
*/

-- 풀이
SELECT T.성별 "성별"
     , SUM(T.급여) "급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여'
                ELSE '성별확인불가' 
            END "성별"
          , SAL "급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);
--==>>
/*
남	    21900
여	    32100
(null)	54000
*/
SELECT CASE GROUPING(T.성별) WHEN 0 THEN T.성별 
                             ELSE '모든사원' 
       END "성별"
     , SUM(T.급여) "급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여'
                ELSE '성별확인불가' 
            END "성별"
          , SAL "급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);
--==>>
/*
      남	21900
      여	32100
모든사원	54000
*/

SELECT *
FROM VIEW_SAWON;

--○ TBL_SAWON 테이블을 대상으로
--   다음과 같이 조회할 수 있도록 연령대별 인원수를 확인할 수 있는
--   쿼리문을 구성한다.
/*
-----------------------------
    연령대     인원수
-----------------------------
    10              X
    20              X
    40              X
    50              X
    전체           XX
-----------------------------
*/
-- 내 풀이 근데 뭔가 틀림
SELECT CASE GROUPING(T2.연령대) WHEN 0 THEN T2.연령대
                               ELSE '전체'
       END "연령대"
     , SUM(T2.임시) "인원수"
FROM
(
    SELECT CASE WHEN T1.나이>=50 THEN '50'
                WHEN T1.나이>=40 THEN '40'
                WHEN T1.나이>=20 THEN '20'
                WHEN T1.나이>=10 THEN '10'
            END "연령대"
            , SUM(T1.임시) "임시"       
    FROM
    (
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (1899 + TO_NUMBER(SUBSTR(JUBUN, 1, 2)))
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (1999 + TO_NUMBER(SUBSTR(JUBUN, 1, 2)))
                    ELSE -1 
                END "나이"
             , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN 1
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN 1
                    ELSE 0 
                END "임시"
        FROM TBL_SAWON
    ) T1
    GROUP BY ROLLUP(T1.나이)
) T2
GROUP BY ROLLUP(T2.연령대);


--풀이
-- 방법 1. → INLINE VIEW 를 두 번 중첩
SELECT NVL(TO_CHAR(T2.연령대), '전체') "연령대"
     , COUNT(*) "인원수"
FROM
(
    SELECT CASE WHEN T1.나이 >= 50 THEN 50
                WHEN T1.나이 >= 40 THEN 40
                WHEN T1.나이 >= 30 THEN 30
                WHEN T1.나이 >= 20 THEN 20
                WHEN T1.나이 >= 10 THEN 10
                ELSE 0
            END "연령대"
    FROM
    (
    -- 나이
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE -1 
                END "나이"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.연령대);
--==>>
/*
    10	2
    20	12
    40	1
    50	3
  전체	18
*/

SELECT CASE GROUPING(T2.연령대) WHEN 0 THEN TO_CHAR(T2.연령대)
            ELSE '전체' END "연령대"
     , COUNT(*) "인원수"
FROM
(
    SELECT CASE WHEN T1.나이 >= 50 THEN 50
                WHEN T1.나이 >= 40 THEN 40
                WHEN T1.나이 >= 30 THEN 30
                WHEN T1.나이 >= 20 THEN 20
                WHEN T1.나이 >= 10 THEN 10
                ELSE 0
            END "연령대"
    FROM
    (
    -- 나이
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE -1 
                END "나이"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.연령대);
--==>>
/*
    10	2
    20	12
    40	1
    50	3
  전체	18
*/


-- 방법 2. → INLINE VIEW 를 한 번만

-- 연령대
SELECT CASE GROUPING(T.연령대) WHEN 0 THEN TO_CHAR(T.연령대) 
                               ELSE '전체' 
       END "연령대"
     , COUNT(*) "인원수"
FROM
(
    SELECT TRUNC(CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                      WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                      ELSE -1 
                 END, -1) "연령대"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.연령대);


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
10	    CLERK	    1300            -- 10번 부서 CLERK 직종의 급여합
10	    MANAGER	    2450            -- 10번 부서 MANAGER 직종의 급여합
10	    PRESIDENT	5000            -- 10번 부서 PRESIDENT 직종의 급여합
10	    (null)	    8750            -- 10번 부서 모든 직종의 급여합        -- CHECK~!!!
20	    ANALYST	    6000            -- 20번 부서 ANALYST 직종의 급여합
20	    CLERK	    1900            -- 20번 부서 CLERK 직종의 급여합
20	    MANAGER	    2975                    :
20	    (null)	    10875           -- 20번 부서 모든 직종의 급여합        -- CHECK!!
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (null)	    9400            -- 30번 부서 모든 직종의 급여합        -- CHECK!!
(null)  (null)	    29025           -- 모든 부서 모든 직종의 급여합        -- CHECK!!
*/


--○ CUBE() → ROLLUP() 보다 더 자세한 결과를 반환한다.
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
(null)	ANALYST	    6000        -- 모든 부서 ANALYST 직종의 급여합
(null)	CLERK	    4150        -- 모든 부서 CLERK 직종의 급여합
(null)	MANAGER	    8275        -- 모든 부서 MANAGER 직종의 급여합
(null)	PRESIDENT	5000        -- 모든 부서 PRESIDENT 직종의 급여합
(null)	SALESMAN	5600        -- 모든 부서 SALESMANE 직종의 급여합
(null)	(null)	    29025
*/

--※ ROLLUP() 과 CUBE() 는
--   그룹을 묶어주는 방식이 다르다(차이)

--EX.
-- ROLLUP(A, B, C)
--  → (A, B, C) / (A, B) / (A) / ()

-- CUBE(A, B, C)
-- → (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()

--==>> 위에서 사용한 것(ROLLUP())은 묶음 방식이 다소 모자라고
--     아래에서 사용한 것(CUBE())은 묶음 방식이 다소 지나치기 때문에
--     다음과 같은 방식의 쿼리 형태를 더 많이 사용한다.
--     다음 작성하는 쿼리는 조회하고자 하는 그룹만 『GROUPING SETS』FMF 
--     이용하여 묶어주는 방식이다.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') 
            ELSE '전체부서'
        END "부서번호" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '전체직종'
        END "직종"
     , SUM(SAL) "급여합"  
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
10	        CLERK	    1300
10	        MANAGER	    2450
10	        PRESIDENT	5000
10	        전체직종	8750
20	        ANALYST	    6000
20	        CLERK	    1900
20	        MANAGER	    2975
20	        전체직종	10875
30	        CLERK	    950
30	        MANAGER	    2850
30	        SALESMAN	5600
30	        전체직종	9400
인턴	    CLERK	    3500
인턴	    SALESMAN	5200
인턴	    전체직종	8700
전체부서	전체직종	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') 
            ELSE '전체부서'
        END "부서번호" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '전체직종'
        END "직종"
     , SUM(SAL) "급여합"  
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>>
/*
      10	CLERK	    1300
      10	MANAGER	    2450
      10	PRESIDENT	5000
      10	전체직종	8750
      20	ANALYST	    6000
      20	CLERK	    1900
      20	MANAGER	    2975
      20	전체직종	10875
      30	CLERK	    950
      30	MANAGER	    2850
      30	SALESMAN	5600
      30	전체직종	9400
    인턴	CLERK	    3500
    인턴	SALESMAN	5200
    인턴	전체직종	8700
전체부서	ANALYST	    6000
전체부서	CLERK	    7650
전체부서	MANAGER	    8275
전체부서	PRESIDENT	5000
전체부서	SALESMAN	10800
전체부서	전체직종	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') 
            ELSE '전체부서'
        END "부서번호" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '전체직종'
        END "직종"
     , SUM(SAL) "급여합"  
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())  
ORDER BY 1, 2;
--> CUBE()를 사용한 결과와 같은 조회 결과

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') 
            ELSE '전체부서'
        END "부서번호" 
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '전체직종'
        END "직종"
     , SUM(SAL) "급여합"  
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())  
ORDER BY 1, 2;
--> ROLLUP()을 사용한 결과와 같은 조회 결과

SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;


--○ TBL_EMP 테이블을 대상으로
--   입사년도별 인원수를 조회한다.
-- 내 풀이
SELECT CASE GROUPING(T.입사년도) WHEN 0 THEN TO_CHAR(T.입사년도)
                                 ELSE '전체'
       END "입사년도"
     , COUNT(*) "인원수"
FROM
(
    SELECT TO_NUMBER(SUBSTR(TO_CHAR(HIREDATE), 1, 4)) "입사년도"
    FROM TBL_EMP
) T
GROUP BY ROLLUP(T.입사년도);

-- 풀이
SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
     , COUNT(*) "인원수"
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

-- (이렇게 할때 주의할점은)
SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--==>> 에러 발생
--     ORA-00979: not a GROUP BY expression

SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도"
     , COUNT(*) "인원수"
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
*/-- GROUP BY 절이 먼저여서 이렇게 가능하구 위에는 내가 표현하는걸 다른 타입으로 하려고 해서 문제 생기는거임

SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>> 에러 발생
--     ORA-00979: not a GROUP BY expression
-- (이것도 그래서 오류인거임 그래서 다른 묶음의 기준을 제시하면 문제가 생기는거다.)
--  (이건 CUBE, 써도 그렇고 GROUP BY만 해도 그렇고 다 그렇다)
-- (그래서 GROUP BY를 수행할때는 GROUP BY에서 수행한 내용을 가지고 해야한다)

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0 
            THEN EXTRACT(YEAR FROM HIREDATE) 
            ELSE "전체"
        END "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
-- (GROUP BY는 EXTRACT하고 위에는 TOCHAR 햇음/ THEN이하는 숫자 타입하고 위에는 문자 타입해서 문제임)
--==>> 에러 발생
--     ORA-00904: "전체": invalid identifier

SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY')) WHEN 0 
            THEN TO_CHAR(HIREDATE, 'YYYY') 
            ELSE '전체'
        END "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
--(이건 에러 없이 돌아감/ 다 같은 TOCHAR로 처리함)

SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 
            THEN EXTRACT(YEAR FROM HIREDATE) 
            ELSE -1
        END "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--(이것도 에러 없이 돌아감/ 다 숫자 타입임/ EXTRACT로 추출하는건 숫자타입임 날짜타입 아님)


SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 
            THEN TO_CHAR(EXTRACT(YEAR FROM HIREDATE))       -- (이렇게 하면 오류 안나고 전체로 바꿀 수 있음)
            ELSE '전체'
        END "입사년도"
     , COUNT(*) "인원수"
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
전체	19
*/


--------------------------------------------------------------------------------


--■■■ HAVING ■■■--

--○ EMP 테이블에서 부서번호가 20, 30 인 부서를 대상으로
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.
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
--==>> 에러 발생
--     ORA-00934: group function is not allowed here
-- (GROUP 함수를 일반 WHERE에서 쓸 수 없어서 생긴느 오류임)


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
--(같은 결과가 나오긴하지만 FROM과 WHERE로 1차적으로 메모리로 올림 그 올린 다음에 추가적으로 계산하는건데 이 논리로 보면 오라클이 위에거를 조금더 원할하게 처리한다 )
--(그 순서 FROM WHERE GROUP BY 순서를 알면 뭐가 더 효율적인지 알 수 있다 이러한 작은 차이가 퍼포먼스로 이어진다/ 이러한 작은 차이가 클라이언트 웨이팅을 줄일 수 있다)


--------------------------------------------------------------------------------

--■■■ 중첩 그룹함수 / 분석함수 ■■■--

-- 그룹 함수는 2LEVEL 까지 중첩해서 사용할 수 있다.
-- MSSQL은 이마저도 불가능하다.

SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875        (이런 형태가 그룹 함수를 중첨했음)

SELECT MIN(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 8750


--○ RANK()
--   DENSE_RANK()
--> ORACLE 9i 부터 적용... MSSQL 2005부터 적용...

-- 하위 버전에서는 RANK() 나 DENSE_RANK()를 사용할 수 없기 때문ㅇ
-- 예를 들어... 급여 순위를 구하고자 한다면...
-- 해당 사원의 급여보다 더 큰 값이 몇 개인지를 확인한 후
-- 확인한 값에 +1을 추가 연산해 주면...
-- 그 값이 곧 해당 사원의 급여 등수가 된다.
SELECT *
FROM EMP;

--○ SMITH의 급여 등수 확인
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;     -- SMITH의 급여
--==>> 14            -- SMITH의 급여 등수

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;   -- ALLEN의 급여
--==>> 7            -- ALLEN의 급여 등수


--※ 서브 상관 쿼리(상관 서브 쿼리)
--   메인 쿼리가 있는데 테이블의 컬럼이
--   서브 쿼리의 조건절(WHERE절, HAVING절) 에 사용되는 경우
--   우리는 이 쿼리문을 서브 상관 쿼리(상관 서브 쿼리)라고 부른다.

SELECT ENAME "사원명", SAL "급여", 1 "급여등수"
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

SELECT ENAME "사원명", SAL "급여", (SELECT COUNT(*) + 1 FROM EMP WHERE SAL > 800) "급여등수"
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
*/ -- (모두 14로 나옴)

SELECT ENAME "사원명", SAL "급여"
    , (SELECT COUNT(*) + 1 
       FROM EMP 
       WHERE SAL > E.SAL) "급여등수"
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


--○ EMP 테이블을 대상으로
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
--   단, RANK()함수를 사용하지 않고 서브상관쿼리를 활용할 수 있도록 한다.
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;    --SMITH의 급여
--==>> 14           -- SMITH의 급여 등수

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800     -- SMITH 의 급여
  AND DEPTNO = 20;  -- SMITH의 부서
--==>> 5            -- SMITH의 부서내 급여등수

SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL) "전체급여등수"
     , (SELECT COUNT(*) + 1
        FROM EMP
        WHERE SAL > E.SAL
        AND DEPTNO = E.DEPTNO) "부서내급여등수"
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

--○ EMP 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다
--------------------------------------------------------------------------------
-- 사원명 부서번호  입사일            급여  부서내입사별급여누적
--------------------------------------------------------------------------------
-- SMITH    20      1980-12-17        800                   800
-- JONES    20      1981-04-02       2975                  3775
-- FORD     20      1981-12-03       3000                  6775
-- 
--------------------------------------------------------------------------------

-- 내 풀이
SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여"
     , (SELECT SUM(SAL)
               FROM EMP
               WHERE DEPTNO = E.DEPTNO
               AND E.HIREDATE >= HIREDATE) "부서내입사별급여누적"
FROM EMP E
ORDER BY DEPTNO, HIREDATE;


-- 풀이
SELECT EMP.ENAME, DEPTNO, HIREDATE, SAL, (1) "부서내입사별급여누적"
FROM SCOTT.EMP
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
       , (1) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
       , (SELECT SUM(E2.SAL)
          FROM EMP E2) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;

SELECT E1.ENAME "사원명", E1.DEPTNO "부서번호", E1.HIREDATE "입사일", E1.SAL "급여"
       , (SELECT SUM(E2.SAL)
          FROM EMP E2
          WHERE E2.DEPTNO = E1.DEPTNO
            AND E2.HIREDATE <= E1.HIREDATE ) "부서내입사별급여누적"
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


--○ EMP 테이블을 대상으로
--   입사한 사원의 수가 가장 많았을 때의
--   입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다
SELECT *
FROM EMP;

------------------------------------------------------------
--  입사년월        인원수
------------------------------------------------------------

-- 내 풀이
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , (SELECT COUNT(*)
       FROM EMP E2
       WHERE TO_CHAR(E2.HIREDATE, 'YYYY-MM') LIKE TO_CHAR(E1.HIREDATE, 'YYYY-MM')
       ) "인원수"
FROM EMP E1
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;

-- 풀이
SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>>
/*
1981-05	1
1981-12	2   ←
1982-01	1
1981-09	2   ←
1981-02	2   ←
1981-11	1
1980-12	1
1981-04	1
1987-07	2   ←
1981-06	1
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM EMP
WHERE COUNT(*) = 2
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 에러 발생
--     ORA-00934: group function is not allowed here

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 2     -- 년월로 묶어서 가장 많은 인원 수의 입사 카운트
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
--==>> (인원수 확인함)

-- 년월로 묶어서 가장 많은 인원 수의 입사 카운트
SELECT MAX(COUNT(*))
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 2


SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
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





