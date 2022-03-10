SELECT USER
FROM DUAL;
--==>> SCOTT



--■■■ FUNCTION(함수) ■■■--

-- 1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로
--    코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.
--    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나
--    직접 스토어드 함수를 만들 수 있다.(→ 사용자 정의 함수)
--    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나
--    저장 프로시저처럼 EXECUTE 문을 통해 실행할 수 있다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] FUNCTION 함수명
[( 매개변수명1 자료형
 , 매개변수명2 자료형
)]
RETURN 데이터타입
IS
    -- 주요 변수 선언
BEGIN
    -- 실행문;
    ...
    RETURN (값);
    
    [EXCEPTION]
        -- 예외 처리 구문;
END;
*/

--※ 사용자 정의 함수(스토어드 함수)는
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,
--   FUNCTION 은 반드시 단일 값만 반환한다.

--○ TBL_INSA 테이블 전용 성별 확인 함수 정의(생성)
-- 함수명 : FN_GENDER()
--                   ↑SSN(주민등록번호) → '771212-1022432'→ 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2 ) -- 매개변수   : 자릿수(길이) 지정 안함
RETURN VARCHAR2                                       -- 반환자료형 : 자릿수(길이) 지정 안함
IS
    -- 선언부  → 주요 변수 선언
    V_RESULT    VARCHAR2(20);
BEGIN
    -- 실행부(정의부) → 연산 및 처리
    IF ( SUBSTR(V_SSN, 8 ,1) IN ('1', '3') )
        THEN V_RESULT := '남자';
    ELSIF ( SUBSTR(V_SSN, 8, 1) IN ('2', '4') )
        THEN V_RESULT := '여자';
    ELSE 
        V_RESULT := '성별확인불가';
    END IF;
    
    -- 결과값 반환 CHECK~!!!
    RETURN V_RESULT;
    
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.
--SCOTT4로 감


--○ 임의의 정수 두 개를 매개변수(입력 파라미터)로 넘겨 받아 → (A, B)
--   A의 B승 값을 반환하는 사용자 정의 함수를 작성한다.
--   단, 기존의 오라클 내장 함수를 이용하지 않고, 반복문을 활용하여 작성한다.
--   함수명 : FN_POW()
/*
사용 예)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000
*/

-- 내풀이
CREATE OR REPLACE FUNCTION FN_POW(NUM1 NUMBER, NUM2 NUMBER)
RETURN NUMBER
IS
    V_NUM NUMBER;
    V_RESULT NUMBER := 1;
BEGIN
    FOR V_NUM IN 1 .. NUM2 LOOP
        V_RESULT := V_RESULT * NUM1;
    END LOOP;
    
    RETURN V_RESULT;
END;

-- 풀이
/*
FN_POW(10, 3)               → 1000
      기준 1 * 10 * 10 * 10 → 1000
      기준 0 * 10 * 10 * 10 → 0
*/

CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;           -- 반환 결과값 변수 → CHECK~!!! 1로 초기화~!!!
    V_NUM       NUMBER;                -- 루프 변수
BEGIN
    -- 반복문 구성
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    -- 최종 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.


--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.
--   급여는 『(기본급*12)+수당』 기반으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급, 수당)

-- 풀이
CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY NUMBER, VSUDANG NUMBER)
RETURN NUMBER
IS
    -- 주요 변수 선언
    VRESULT NUMBER;
BEGIN
    -- 연산 및 처리
    VRESULT := (NVL(VBASICPAY, 0) * 12) + NVL(VSUDANG, 0);
    
    -- 최종 결과값 반환
    RETURN VRESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.
-- 결과는 02_scott 파일에서


--○ TBL_INSA 테이블에서 입사일을 기준으로 현재까지의
--   근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)
SELECT *
  FROM TBL_INSA;

-- 내 풀이
CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS
    VRESULT NUMBER;
    
BEGIN
    VRESULT := TRUNC(TO_NUMBER((SYSDATE - VIBSADATE) / 365), 1);
    
    RETURN VRESULT;
END;

-- 풀이
-- 1
SELECT MONTHS_BETWEEN(SYSDATE, '2002-02-11') / 12
FROM DUAL;
--==>> 20.0817762470131421744324970131421744325
-- (지금까지 몇년인지 구함)

-- 2
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '2002-02-11')/12) || '년' ||
       TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, '2002-02-11'), 12)) || '개월'
FROM DUAL;
--==>> 20년0개월

CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN VARCHAR2
IS
    VRESULT VARCHAR2(20);
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE)/12) || '년' ||
               TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '개월';
    
    RETURN VRESULT;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.

CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE)/12, 1); 
    
    RETURN VRESULT;
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.


--------------------------------------------------------------------------------


--※ 참고

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Maniplation Language)
-- COMMIT / ROLLBACK이 필요하다.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- 정적 pl/sql문 → DML문, TCL문만 사용 가능하다.
-- 동적 pl/sql문 → DML문, DDL문, DCL문, TCL문 사용 가능하다.

--------------------------------------------------------------------------------


--■■■ PROCEDURE(프로시저) ■■■--
-- 1. PL/SQL에서 가장 대표적인 구조인 스토어드 프로시저는
--    개발자가 자주 작성해야 하는 업무의 흐름을
--    미리 작성하여 데이터제이스 내에 저장해 두었다가
--    필요할 때마다 호출하여 실행할 수 있도록 처리해주는 구문이다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDURE 프로시저명
[( 매개변수 IN 데이터타입
 , 매개변수 OUT 데이터타입
 , 매개변수 INOUT 데이터타입
)]
IS
    [--주요 변수 선언]
BEGIN
    --실행 구문;
    
    [EXCEPTION
        -- 예외 처리 구문;]
END;
*/

--※ FUNCTION 과 비교했을 때 『RETURN 반환자료형』 부분이 존재하지 않으며
--  『RETURN』문 자체도 존재하지 않으며
--  프로시저 실행시 넘겨주게 되는 매개변수 종류는
--   IN(입력), OUT(출력), INOUT(입출력)으로 구분한다.

--3. 실행(호출)
/*
EXEC[UTE] 프로시저명[(인수1, 인수2, ...)];
*/


--※ 프로시저 실습을 위한 테이블 생성은
--   20220310_02_scott.sql 파일 참조~!!! (209줄)


--○ 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( 아이디
, 패스워드
, 이름
, 전화
, 주소
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW 테이블에 데이터 입력(INSERT)
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS 테이블에 데이터 입력(INSERT)
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.
--(02 : 259감)


--○ 데이터 입력 시 특정 항목의 데이터만 입력하면
                    ---------
--                  (학번, 이름, 국어점수, 영어점수, 수학점수)
--   내부적으로 다른 추가항목에 대한 처리가 함께 이루어질 수 있도록 하늗
--                   --------
--                  (총점, 평균, 등급)
--   프로시저를 작성한다.(생성한다.)
--   프로시저 명 : PRC_SUNGJUK_INSERT()

/*
실행 예)
EXEC PRC_SUNGJUK_INSERT(1, '최선하', 90, 80, 70);

프로시저 호출로 처리된 결과
학번  이름  국어점수    영어점수    수학점수    총점  평균  등급
  1  최선하    90          80          70       240    80    B
*/
-- 내 풀이
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN      IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME        IN TBL_SUNGJUK.NAME%TYPE
, V_KOR         IN TBL_SUNGJUK.KOR%TYPE
, V_ENG         IN TBL_SUNGJUK.ENG%TYPE
, V_MAT         IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT NUMBER := 0; 
    V_AVG NUMBER := 0;
    V_GRADE CHAR;
    
BEGIN
    V_TOT := V_KOR+V_ENG+V_MAT;
    
    V_AVG := V_TOT / 3;
    
    CASE TRUNC(V_AVG / 10)
        WHEN 10 THEN V_GRADE := 'A';
        WHEN  9 THEN V_GRADE := 'B';
        WHEN  8 THEN V_GRADE := 'C';
        WHEN  7 THEN V_GRADE := 'D';
        ELSE
            V_GRADE := 'F';
    END CASE;    
    
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT
         , V_TOT, V_AVG, V_GRADE);
         
    COMMIT;
END;

-- 풀이
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( 학번
, 성명
, 국어점수
, 영어점수
, 수학점수
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- 선언부
    -- INSERT 쿼리문 수행을 하기 위해 필요한 추가 변수 구성
    V_TOT       TBL_SUNGJUK.TOT%TYPE;
    V_AVG       TBL_SUNGJUK.AVG%TYPE;
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 실행부
    -- 추가로 선언한 주요 변수들에 값을 담아내야 한다.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT 쿼리문 수행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- 커밋
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.



--○ TBL_SUNGJUK 테이블에서 특정 학생의 점수
--   (학번, 국어점수, 영어점수, 수학점수) 데이터 수정 시
--   총점, 평균, 등급까지 함께 수정되는 프로시저를 생성한다.
--   프로시저 명 : PRC_SUNGJUK_UPDATE()

/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);

프로시저 호출로 처리된 결과
1	최선하	90	80	70	240	80	B
2	박현수	50	50	50	150	50	F
*/

-- 내 풀이
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
    
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF(V_AVG >= 90) THEN V_GRADE := 'A';
    ELSIF(V_AVG >= 80) THEN V_GRADE := 'B';
    ELSIF(V_AVG >= 70) THEN V_GRADE := 'C';
    ELSIF(V_AVG >= 60) THEN V_GRADE := 'D';
    ELSE V_GRADE := 'F';
    END IF;

    UPDATE TBL_SUNGJUK T 
        SET
            KOR = V_KOR
          , ENG = V_ENG
          , MAT = V_MAT
          , TOT = V_TOT
          , AVG = V_AVG
          , GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
END;


-- 풀이
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- 선언부
    -- UPDATE 쿼리문을 수행하기 위해 필요한 변수
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 실행부
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    -- UPDATE 쿼리문 수행
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT
      , TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.



--○ TBL_STUDENTS 테이블에서 전화번호와 주소 데이터를 수정하는(변경하는)
--   프로시저를 작성한다.
--   단, ID와 PW가 일치하는 경우에만 수정을 진행할 수 있도록 처리한다.
--   프로시저 명 : PRC_STUDENTS_UPDATE()

/*
실행 예)
EXEC PRC_STUDENTS_UPDATE('happy', 'java006', '010-9999-9999', '강원도 횡성')
--==>> 데이터 수정 X

EXEC PRC_STUDENTS_UPDATE('happy', 'java006$', '010-9999-9999', '강원도 횡성')
--==>> 데이터 수정 ○
*/

-- 내 풀이
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE EXISTS(SELECT 1
                   FROM TBL_IDPW
                  WHERE ID = V_ID AND PW = V_PW);
END;
    
-- 풀이1
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( 아이디
, 패스워드
, 전화번호
, 주소
)
IS
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.TEL%TYPE
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;
    V_FLAG  NUMBER := 0;
    
BEGIN
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = V_ID;
    
    IF (V_PW = V_PW2)
        THEN V_FLAG := 1;
    ELSE
        V_FLAG := 2;
    END IF;
    
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND V_FLAG = 1;
      
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.


-- 방법 2
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.TEL%TYPE
)
IS    
BEGIN
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2
            ON T1.ID = T2.ID) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
    
    COMMIT;
    
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.








