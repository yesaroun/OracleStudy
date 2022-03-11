

ACCEPT INPUT PROMPT '금액 입력';

DECLARE
	-- 주요 변수 선언
	MONEY  NUMBER := &INPUT;    -- 연산을 위해 입력값을 담아둘 변수
    MONEY2 NUMBER := &INPUT;    -- 결과 출력을 위해 입력값을 담아둘 변수
		
	M500   NUMBER;              -- 500원 짜리 갯수를 담아둘 변수
    M100   NUMBER;
    M50    NUMBER;
    M10    NUMBER;
BEGIN
    -- 연산 및 처리
    -- MONEY를 500으로 나눠서 몫을 취하고 나머지는 버린다. -- 500원의 갯수
    M500 := TRUNC(MONEY / 500);
    -- MONEY를 500으로 나눠서 몫은 버리고 나머지를 취한다. -- 500원의 갯수 확인하고 남은 금액         
    MONEY := MOD(MONEY, 500);
    
    M100 := TRUNC(MONEY / 100);
    MONEY := MOD(MONEY, 100);
    
    M50 := TRUNC(MONEY / 50);
    MONEY := MOD(MONEY, 50);
    
    M10 := TRUNC(MONEY / 10);
    MONEY := MOD(MONEY, 10);
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE('입력받은 금액의 총액 : ' || MONEY2);
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 500원 : ' || M500 || '개, 100원 : ' || M100 || '개, 50원 : ' || M50 || '개, 10원 : ' || M10 || '개');
END;

LOOP