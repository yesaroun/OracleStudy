SELECT USER
FROM DUAL;
--==>> SCOTT

--※ 20220311_01_scott(plsql).sql 파일에서
--   PRC_INSA_INSERT() 프로시저 생성 후 테스트
EXEC PRC_INSA_INSERT('양윤정', '970131-2234567', SYSDATE, '서울', '010-8624-4533', '개발부', '대리', 2000000, 2000000);;
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 프로시저 호출(실행) 후 확인
SELECT *
  FROM TBL_INSA;
/*
            :
1061	양윤정	970131-2234567	2022-03-11	서울	010-8624-4533	개발부	대리	2000000	2000000
*/


--○ 실습 테이블 생성(TBL_상품)
CREATE TABLE TBL_상품
( 상품코드      VARCHAR2(20)
, 상품명        VARCHAR2(100)
, 소비자가격    NUMBER
, 재고수량      NUMBER  DEFAULT 0
, CONSTRAINT 상품_상품코드_PK PRIMARY KEY(상품코드)
);
--==>> Table TBL_상품이(가) 생성되었습니다.
-- TBL_상품 테이블의 상품코드를 기본키(PK) 제약조건 설정

--○ 실습 테이블 생성(TBL_입고)
CREATE TABLE TBL_입고
( 입고번호  NUMBER
, 상품코드  VARCHAR2(100)
, 입고일자  DATE DEFAULT SYSDATE
, 입고수량  NUMBER
, 입고단가  NUMBER
, CONSTRAINT 입고_입고번호_PK PRIMARY KEY(입고번호)
, CONSTRAINT 입고_상품코드_FK FOREIGN KEY(상품코드) 
             REFERENCES TBL_상품(상품코드)
);
--==>> Table TBL_입고이(가) 생성되었습니다.
-- TBL_입고 테이블의 입고번호를 기본키(PK) 제약조건 설정
-- TBL_입고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
-- 참조할 수 있도록 외래키(FK) 제약조건 설정

--○ TBL_상품 테이블에 상품정보 입력
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H001', '바밤바', 600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H002', '죠스바', 500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H003', '메로나', 500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H004', '보석바', 600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H005', '쌍쌍바', 600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H006', '수박바', 500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H007', '빠삐코', 500);
--==>> 1 행 이(가) 삽입되었습니다. * 7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C001', '월드콘', 1600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C002', '빵빠레', 1700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C003', '구구콘', 1800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C004', '메타콘', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C005', '부라보', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C006', '슈퍼콘', 1500);
--==>> 1 행 이(가) 삽입되었습니다. * 6

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E001', '빵또아', 1100);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E002', '셀렉션', 1700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E003', '투게더', 2500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E004', '거북알', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E005', '팥빙수', 1500);
--==>> 1 행 이(가) 삽입되었습니다. * 5

--○ 확인
SELECT *
  FROM TBL_상품;
--==>>
/*
H001	바밤바	 600	0
H002	죠스바	 500	0
H003	메로나	 500	0
H004	보석바	 600	0
H005	쌍쌍바	 600	0
H006	수박바	 500	0
H007	빠삐코	 500	0
C001	월드콘	1600	0
C002	빵빠레	1700	0
C003	구구콘	1800	0
C004	메타콘	1500	0
C005	부라보	1500	0
C006	슈퍼콘	1500	0
E001	빵또아	1100	0
E002	셀렉션	1700	0
E003	투게더	2500	0
E004	거북알	1500	0
E005	팥빙수	1500	0
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--※ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--※ TBL_입고 테이블에 『입고』 이벤트 발생 시...
--   관련 테이블에 수행되어야 하는 내용

-- ① INSERT → TBL_입고
--    INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--    VALUES(1, 'H001', SYSDATE, 30, 400);

-- ② UPDATE → TBL_상품
--    UPDATE TBL_상품
--    SET 재고 수량 = 재고수량 + 입고수량
--    WHERE 상품코드 = 'H001';
--(01 50) 이동


--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 → 프로시저 호출
EXEC PRC_입고_INSERT(상품코드, 입고수량, 입고단가)

SELECT *
FROM TBL_상품;

SELECT *
FROM TBL_입고;

EXEC PRC_입고_INSERT('H001', 30, 400);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	30
*/

SELECT *
FROM TBL_입고;
--==>> 1	H001	2022-03-11	30	400

EXEC PRC_입고_INSERT('H001', 20, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	50
*/

SELECT *
FROM TBL_입고;
--==>> 
/*
1	H001	2022-03-11	30	400
2	H001	2022-03-11	20	500
*/


EXEC PRC_입고_INSERT('H002', 25, 450);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('H003', 35, 450);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('H004', 75, 520);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


EXEC PRC_입고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('C002', 10, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C002', 10, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	 600	50
H002	죠스바   500	25
H003	메로나	 500	35
H004	보석바	 600	75
H005	쌍쌍바	 600	0
H006	수박바	 500	0
H007	빠삐코	 500	0
C001	월드콘	1600	60
C002	빵빠레	1700	20
C003	구구콘	1800	0
C004	메타콘	1500	0
C005	부라보	1500	0
C006	슈퍼콘	1500	0
E001	빵또아	1100	0
E002	셀렉션	1700	0
E003	투게더	2500	0
E004	거북알	1500	0
E005	팥빙수	1500	0
*/

SELECT *
FROM TBL_입고;
--==>>
/*
1	H001	2022-03-11	30	 400
2	H001	2022-03-11	20	 500
3	H002	2022-03-11	25	 450
4	H003	2022-03-11	35	 450
5	H004	2022-03-11	75	 520
6	C001	2022-03-11	20	1500
7	C001	2022-03-11	20	1500
8	C001	2022-03-11	20	1500
9	C002	2022-03-11	10	1500
10	C002	2022-03-11	10	1500
*/



--------------------------------------------------------------------------------

--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ 실습 테이블 생성(TBL_MEMEBER)
-- 테이블을 잘못 만들었네~~~
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
, CONSTRAINT MEMEBER_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_MEMEBER이(가) 생성되었습니다.


--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인
EXEC PRC_MEMBER_INSERT('임소민', '010-1111-1111', '서울');
-- 데이터 입력○
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_MEMBER;
--==>> 1	임소민	010-1111-1111	서울

EXEC PRC_MEMBER_INSERT('이연주', '010-2222-2222', '부산');
-- 데이터 입력X
--==>> 에러 발생
--     (ORA-20001: 서울, 경기, 대전만 입력이 가능합니다.)



--○ 실습 테이블 생성(TBL_출고)
CREATE TABLE TBL_출고
( 출고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 출고일자  DATE DEFAULT SYSDATE
, 출고수량  NUMBER
, 출고단가  NUMBER
);
--==>> Table TBL_출고이(가) 생성되었습니다.

-- 출고번호 PK 지정
ALTER TABLE TBL_출고
    ADD PRIMARY KEY (출고번호);
--==>> Table TBL_출고이(가) 변경되었습니다.

-- 상품코드 FK 지정
ALTER TABLE TBL_출고
    ADD CONSTRAINT 출고_상품코드_FK FOREIGN KEY (상품코드)
    REFERENCES TBL_상품(상품코드);
--==>> Table TBL_출고이(가) 변경되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	50
        :
*/

SELECT *
FROM TBL_출고;
--==>> 데이터 없음

--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인
--   현재 상품 테이블의 바밤바 재고수량은 50개
--   프로시저의 호출 의미는 바밤바 60개 출고
EXEC PRC_출고_INSERT('H001', 60, 600);
--==>> 에러 발생
--      (ORA-20002: 재고수량이 부족합니다.)

EXEC PRC_출고_INSERT('H001', 20, 600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	30
        :
*/

SELECT *
FROM TBL_출고;
--==>> 1	H001	2022-03-11	20	600

EXEC PRC_출고_INSERT('H002', 5, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H003', 5, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H004', 5, 600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 10, 1600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C002', 10, 1600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 확인
SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	 600	30
H002	죠스바	 500	20
H003	메로나	 500	30
H004	보석바	 600	70
H005	쌍쌍바	 600	0
H006	수박바	 500	0
H007	빠삐코	 500	0
C001	월드콘	1600	50
C002	빵빠레	1700	10
C003	구구콘	1800	0
C004	메타콘	1500	0
C005	부라보	1500	0
C006	슈퍼콘	1500	0
E001	빵또아	1100	0
E002	셀렉션	1700	0
E003	투게더	2500	0
E004	거북알	1500	0
E005	팥빙수	1500	0
*/



--(01 241)




