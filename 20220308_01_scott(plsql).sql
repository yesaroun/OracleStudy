SELECT USER
FROM DUAL;
--==>> SCOTT

--○ IF문(조건문)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.
--    일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--    TRUE이면 THEN과 ELSE 사이의 문장을 수행하고
--    FALSE 나 NULL 이면 ELSE 와 END IF; 사이의 문장을 수행하게 된다.

-- 2. 형식 및 구조
/*
IF 조건
    THEN 처리문;
END IF;
*/

/*
IF 조건
    THEN 처리문;
ELSE
    처리문;
END IF;
*/

/*
IF 조건
    THEN 처리문;
ELSIF 조건
    THEN 처리문;
ELSIF 조건
    THEN 처리문;
ELSE
    처리문;
END IF;
*/

-- (이거 해야 결과가 나옴)
SET SERVEROUTPUT ON;

--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'C'
        THEN DBMS_OUTPUT.PUT_LINE('COOL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;


--○ CASE 문(조건문)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. 형식 및 구조
/*
CASE 변수
    WHEN 값1 THEN 실행문;
    WHEN 값2 THEN 실행문;
    ELSE 실행문;
END CASE;
*/

ACCEPT NUM PROMPT '남자1 여자2 입력하세요';
--(여기서 NUM으로 지정한 값을 내부 PLSQL에 가져오는게 &NUM)

DECLARE
    -- 주요 변수 선언
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(10) := '남자';
BEGIN
    -- 테스트
    --DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    --DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
    
    -- 연산 및 처리
    /*
    CASE SEL
        WHEN 1
        THEN DBMS_OUTPUT.PUT_LINE('남자입니다.');
        WHEN 2
        THEN DBMS_OUTPUT.PUT_LINE('여자입니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('확인불가');
    END CASE;
    */
    
    CASE SEL
        WHEN 1
        THEN RESULT := '남자';
        WHEN 2
        THEN RESULT := '여자';
        ELSE
            RESULT := '확인불가';
    END CASE;
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE('처리 결과는 ' || RESULT || '입니다.');
    
END;

--※ 외부 입력 처리
-- ACCEPT 구문
-- ACCEPT 변수명 PROMPT '메세지';
--> 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때
--  『&외부변수명』 형태로 접근하게 된다.

--○ 정수 2개를 외부로부터(사용자로부터) 입력받아
--   이들의 덧셈 결과를 출력하는 PL/SQL 구문을 작성한다.

ACCEPT N1 PROMPT '첫 번째 정수를 입력하세요.';
ACCEPT N2 PROMPT '두 번째 정수를 입력하세요.';

DECLARE
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    
    TOTAL NUMBER := 0;
BEGIN
    -- 테스트
    --DBMS_OUTPUT.PUT_LINE('NUM1 : ' || NUM1);
    --DBMS_OUTPUT.PUT_LINE('NUM2 : ' || NUM2);
    
    -- 연산 및 처리
    TOTAL := NUM1 + NUM2;
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' ||TOTAL);
    
END;
--==>> 25 + 47 = 72


--○ 사용자로부터 입력받은 금액을 화폐단위로 구분하여 출력하는 프로그램을 작성한다.
-- 단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
/*
실행 예)
바인딩 변수 입력 대화창 → 금액 입력 : 990

입력받은 금액 총액 : 990원
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4
*/

-- 내 풀이
ACCEPT A PROMPT '금액 입력';

DECLARE
    MONEY NUMBER := &A;
    AN NUMBER := &A;
    
    C500 NUMBER := 0;
    C100 NUMBER := 0;
    C50 NUMBER := 0;
    C10 NUMBER := 0;
    
BEGIN
    IF TRUNC(AN/500) > 0
        THEN C500 := TRUNC(AN/500);
    END IF;
    
    IF TRUNC(AN/500) > 0
        THEN AN := AN - C500*500;
    END IF;
    
    IF TRUNC(AN/100) > 0
        THEN C100 := TRUNC(AN/100);
    END IF;
    
    IF TRUNC(AN/100) > 0
        THEN AN := AN - C100*100;
    END IF;
    
    IF TRUNC(AN/50) > 0
        THEN C50 := TRUNC(AN/50);
    END IF;
    
    IF TRUNC(AN/50) > 0
        THEN AN := AN - C50*50;
    END IF;
    
    IF TRUNC(AN/10) > 0
        THEN C10 := TRUNC(AN/10);
    END IF;
    
    IF TRUNC(AN/10) > 0
        THEN AN := AN - C10*10;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('입력받은 금액의 총액 : ' || MONEY);
    DBMS_OUTPUT.PUT_LINE('500원 : ' || C500 || ' 개, 100원 : ' || C100 || ' 개, 50원 : ' || C50 || ' 개, 10원 : ' || C10 || ' 개');
    
END;


-- 풀이

ACCEPT INPUT PROMPT '금액 입력';
DECLARE
    --○ 주요 변수 선언
    MONEY   NUMBER := &INPUT;       -- 연산을 위해 입력값을 담아둘 변수
    MONEY2  NUMBER := &INPUT;       -- 결과 출력을 위해 입력값을 담아둘 변수
                                    -- (MONEY 변수가 연산을 처리하는 과정에서 값이 변하기 때문에...)
        
    M500    NUMBER;                 -- 500원 짜리 갯수를 담아둘 변수         
    M100    NUMBER;                 -- 100원 짜리 갯수를 담아둘 변수  
    M50     NUMBER;                 --  50원 짜리 갯수를 담아둘 변수  
    M10     NUMBER;                 --  10원 짜리 갯수를 담아둘 변수  
BEGIN
    --○ 연산 및 처리
    -- MONEY를 500으로 나눠서 몫을 취하고 나머지는 버린다. -- 500원의 갯수
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY를 500으로 나눠서 몫은 버리고 나머지를 취한다. → 500원의 갯수 확인하고 남은 금액
    MONEY := MOD(MONEY, 500);
    
    -- MONEY를 100으로 나눠서 몫을 취하고 나머지는 버린다. → 100원의 갯수
    M100 := TRUNC(MONEY / 100);
    
    -- MONEY를 100으로 나눠서 몫은 버리고 나머지를 취한다. → 100원의 갯수 확인하고 남은 금액
    MONEY := MOD(MONEY, 100);
    
    -- MONEY를 50으로 나눠서 몫을 취하고 나머지는 버린다.  → 50원의 갯수
    M50 := TRUNC(MONEY / 50);
    
    MONEY := MOD(MONEY, 50);
    
    M10 := TRUNC(MONEY / 10);
    
    MONEY := MOD(MONEY, 10);
    
    --○ 결과 출력
    -- 취합된 결과(화폐단위별 갯수)를 형식에 맞게 최종 출력한다.
    DBMS_OUTPUT.PUT_LINE('입력받은 금액의 총액 : ' || MONEY2);
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 500원 : ' || M500 || ' 개, 100원 : ' || M100 || ' 개, 50원 : ' || M50 || ' 개, 10원 : ' || M10 || ' 개');
END;
--==>>
/*
입력받은 금액의 총액 : 790
화폐단위 : 500원 : 1 개, 100원 : 2 개, 50원 : 1 개, 10원 : 4 개
*/


--○ 기본 반복문
-- LOOP ~ END LOOP;

-- 1. 조건과 상관없이 무조건 반복하는 구문.

-- 2. 형식 및 구조
/*
LOOP
    -- 실행문
    
    EXIT WHEN 조건;       -- 조건이 참인 경우 반복문을 빠져나간다.
END LOOP;
*/

-- 1 부터 10까지의 수 출력(LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    N := 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N>=10;
        
        N := N + 1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/


--○ WHILE 반복문
-- WHILE LOOP ~ END LOOP;

-- 1. 제어 조건이 TRUE인 동안 일련의 문장을 반복하기 위해
--    WHILE LOOP 구문을 사용한다.
--    조건은 반복이 시작되는 시점에 체크하게 되어
--    LOOP 내의 문장이 한 번도 수행되지 않을 경우도 있다.
--    LOOP 를 시작할 때 조건이 FALSE 이면 반복 문장을 탈출하게 된다.

-- 2. 형식 및 구조
/*
WHILE 조건 LOOP       -- 조건이 참인 경우 반복 수행
    -- 실행문;
END LOOP;
*/

-- 1 부터 10까지의 수 출력(WHILE LOOP 문 활용)

DECLARE
    N NUMBER;
BEGIN
    N := 0;
    WHILE N<10 LOOP
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/


-- ○ FOR 반복문
-- FOR LOOP ~ END LOOP;

-- 1. 『시작수』에서 1씩 증가하며
--    『끝냄수』가 될 때 까지 반복 수행한다.

-- 2. 형식 및 구조
/*
FOR 카운터 IN [REVERSE] 시작수 .. 끝남수 LOOP
    -- 실행문;
END LOOP;
*/

-- 1 부터 10까지의 수 출력(FOR LOOP 문 활용)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);    
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/


--○ 사용자로부터 임의의 단(구구단)을 입력받아
--   해당 단수의 구구단을 출력하는 PL/SQL구문을 작성한다.
/*
실행 예)
바인딩 변수 입력 대화창 → 단을 입력하세요 : 2

2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18
*/

-- 1. LOOP 문의 경우

ACCEPT NUM PROMPT '단을 입력하세요'

DECLARE
    N   NUMBER := &NUM;
    CO   NUMBER := 1;
    RESULT  NUMBER := 0;

BEGIN
    LOOP
        RESULT := N * CO;
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || CO || ' = ' || RESULT);
        
        CO := CO + 1;
        EXIT WHEN CO >= 10;
    END LOOP;
END;

-- 풀이
ACCEPT NUM PROMPT '단을 입력하세요';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
        EXIT WHEN N >= 9;
        N := N + 1;
    END LOOP;
END;
--==>>
/*
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45
*/


-- 2. WHILE LOOP문의 경우
ACCEPT NUM PROMPT '단을 입력하세요'

DECLARE
    N   NUMBER := &NUM;
    CO  NUMBER := 1;
    RESULT  NUMBER := 0;
    
BEGIN
    WHILE CO < 10 LOOP
        RESULT := N * CO;
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || CO || ' = ' || RESULT);
        
        CO := CO + 1;
    END LOOP;
END;

-- 풀이 (오류 찾기)

ACCEPT NUM PROMPT '단을 입력하세요';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    N := 0;
    
    WHILE N<9 LOOP
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
    END LOOP;

-- 3. FOR LOOP문의 경우



ACCEPT NUM PROMPT '단을 입력하세요'

DECLARE
    N   NUMBER := &NUM;
    CO  NUMBER := 1;
    RESULT  NUMBER := 0;
    
BEGIN
    FOR CO IN 1 .. 9 LOOP
        RESULT := N * CO;
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || CO || ' = ' || RESULT);
        
    END LOOP;
END;

-- 풀이

ACCEPT NUM PROMPT '단을 입력하세요';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
   FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
    END LOOP;
END;
--==>>
/*
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
*/


--○ 구구단 전체(2단 ~ 9단)를 출력하는 PL/SQL 구문을 작성한다.
--   단, 이중 반복문(반복문의 중첩) 구문을 활용한다.
/*
실행 예)

==[ 2단 ]==
2 * 1 =  2
    :
==[ 9단 ]==
    :
9 * 9 = 81
*/

-- 내 풀이

DECLARE
    N1  NUMBER := 2;
    N2  NUMBER := 1;
BEGIN
    <<Outer_loop>>
    LOOP
        DBMS_OUTPUT.PUT_LINE('==[ ' || N1 || '단 ]==');
        
        <<Inner_loop>>
        LOOP
            DBMS_OUTPUT.PUT_LINE(N1 || ' * ' || N2 || ' = ' || N1*N2);
            N2 := N2 + 1;
            EXIT WHEN N2 > 9;
        END LOOP Inner_loop;
        
        N1 := N1 + 1;
        N2 := 1;
        EXIT WHEN N1 > 9;
    END LOOP Outer_loop;
END;

-- 풀이

DECLARE
    N   NUMBER;
    M   NUMBER;
BEGIN
    FOR N IN 2 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('==[ ' || N || '단 ]==');
        
        FOR M IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(N || ' * ' || M || ' = ' || (N*M));
        END LOOP;
    END LOOP;
END;
--==>>
/*
==[ 2단 ]==
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18

==[ 3단 ]==
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27

==[ 4단 ]==
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36

==[ 5단 ]==
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45

==[ 6단 ]==
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54

==[ 7단 ]==
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
7 * 5 = 35
7 * 6 = 42
7 * 7 = 49
7 * 8 = 56
7 * 9 = 63

==[ 8단 ]==
8 * 1 = 8
8 * 2 = 16
8 * 3 = 24
8 * 4 = 32
8 * 5 = 40
8 * 6 = 48
8 * 7 = 56
8 * 8 = 64
8 * 9 = 72

==[ 9단 ]==
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81
*/
