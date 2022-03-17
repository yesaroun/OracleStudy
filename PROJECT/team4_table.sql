--------------------------------------------------------------------------------
--○ 관리자등록 테이블 생성
CREATE TABLE MANAGER_REGISTER
(MANAGER_CODE   VARCHAR2(10)           -- (관리자코드)
,ID             VARCHAR2(10)           -- (ID)
,PASSWORD       VARCHAR2(30)           -- (비밀번호)
,REGISTER_DATE  DATE DEFAULT SYSDATE   -- (관리자 등록일자)
,CONSTRAINT MA_CODE_PK PRIMARY KEY(MANAGER_CODE)
,CONSTRAINT MA_ID_NN CHECK(ID IS NOT NULL)
,CONSTRAINT MA_PASSWORD_NN CHECK(PASSWORD IS NOT NULL)
);
--==>>Table MANAGER_REGISTER이(가) 생성되었습니다.
--------------------------------------------------------------------------------

--○ 교수등록 테이블 생성
CREATE TABLE TEACHER_REGISTER
(TEACHER_CODE    VARCHAR2(10)          --(교수코드)
,ID              VARCHAR2(20)          --(ID) 
,PASSWORD        VARCHAR2(30)          --(비밀번호)
,NAME            VARCHAR2(20)          --(교수명)
,SSN             VARCHAR2(13)          --(주민번호)
,REGISTER_DATE   DATE DEFAULT SYSDATE  --(가입일자)
,CONSTRAINT TC_CODE_PK PRIMARY KEY(TEACHER_CODE)
,CONSTRAINT TC_ID_NN CHECK(ID IS NOT NULL)
,CONSTRAINT TC_PASSWORD_NN CHECK(PASSWORD IS NOT NULL)
,CONSTRAINT TC_NAME_NN CHECK(NAME IS NOT NULL)
,CONSTRAINT TC_SSN_NN CHECK(SSN IS NOT NULL)
);
--==>>Table TEACHER_REGISTER이(가) 생성되었습니다.
--------------------------------------------------------------------------------

--○ 학생 등록(STD) 테이블 생성
CREATE TABLE STUDENT_REGISTER
( STUDENT_CODE      VARCHAR2(10)         -- (학생코드)
, ID                VARCHAR2(20)         -- (학생ID)
, PASSWORD          VARCHAR2(30)         -- (비밀번호)
, NAME              VARCHAR2(20)         -- (학생명)
, SSN               VARCHAR2(13)         -- (주민번호)
, REGISTER_DATE     DATE DEFAULT SYSDATE -- (가입일자)
, CONSTRAINT STD_STD_CODE_PK PRIMARY KEY(STUDENT_CODE)
, CONSTRAINT STD_ID_NN CHECK(ID IS NOT NULL)
, CONSTRAINT STD_PASSWORD_NN CHECK(PASSWORD IS NOT NULL)
, CONSTRAINT STD_NAME_NN CHECK(NAME IS NOT NULL)
, CONSTRAINT STD_SSN_NN CHECK(SSN IS NOT NULL)
, CONSTRAINT STD_REG_DATE_NN CHECK(REGISTER_DATE IS NOT NULL)
);
--==>>Table STUDENT_REGISTER이(가) 생성되었습니다.
-- 학생 등록 테이블 제약조건 추가(UK)
-- (주민등록번호라 UNIQUE 제약조건 추가함)
ALTER TABLE STUDENT_REGISTER
ADD CONSTRAINT STD_SSN_UK UNIQUE(SSN);
--==>>Table STUDENT_REGISTER이(가) 변경되었습니다.
--------------------------------------------------------------------------------

--○ 과정 개설(OP_COU) 테이블 생성
CREATE TABLE COURSE_OPEN
( OP_COURSE_CODE    VARCHAR2(10)         -- (과정개설코드)
, COURSE_CODE       NUMBER               -- (과정코드)
, TEACHER_CODE      VARCHAR2(10)         -- (교수코드)
, CLASSROOM_CODE    NUMBER               -- (강의실코드)
, START_DATE        DATE                 -- (시작일자)
, END_DATE          DATE                 -- (종료일자)
, OPEN_DATE         DATE DEFAULT SYSDATE -- (개설일자)
, CONSTRAINT OP_COU_OP_COU_CODE_PK PRIMARY KEY(OP_COURSE_CODE)
, CONSTRAINT OP_COU_COU_CODE_NN CHECK(COURSE_CODE IS NOT NULL)
, CONSTRAINT OP_COU_TEA_CODE_NN CHECK(TEACHER_CODE IS NOT NULL)
, CONSTRAINT OP_COU_CLA_CODE_NN CHECK(CLASSROOM_CODE IS NOT NULL)
, CONSTRAINT OP_COU_STA_DATE_NN CHECK(START_DATE IS NOT NULL)
, CONSTRAINT OP_COU_END_DATE_NN CHECK(END_DATE IS NOT NULL)
);
--==>>Table COURSE_OPEN이(가) 생성되었습니다.


--FK 1번
-- 과정 개설 테이블 제약조건 추가(FK)
ALTER TABLE COURSE_OPEN
ADD CONSTRAINT OP_COU_COU_CODE_FK FOREIGN KEY(COURSE_CODE)
                                  REFERENCES COURSE(COURSE_CODE);
--==>>Table COURSE_OPEN이(가) 변경되었습니다.

ALTER TABLE COURSE_OPEN
ADD CONSTRAINT OP_COU_TEA_CODE_FK FOREIGN KEY(TEACHER_CODE)
                                  REFERENCES TEACHER_REGISTER(TEACHER_CODE);
--==>>Table COURSE_OPEN이(가) 변경되었습니다.

ALTER TABLE COURSE_OPEN
ADD CONSTRAINT OP_COU_CLA_CODE_FK FOREIGN KEY(CLASSROOM_CODE)
                                  REFERENCES CLASSROOM_REGISTER(CLASSROOM_CODE);
--==>>Table COURSE_OPEN이(가) 변경되었습니다.
                                  
--------------------------------------------------------------------------------

--○ 수강신청 테이블 생성(REG_COU)
CREATE TABLE COURSE_REGISTER
( REG_COURSE_CODE   VARCHAR2(10)   CONSTRAINT REG_COU_CODE_PK       PRIMARY KEY 
, OP_COURSE_CODE    VARCHAR2(10)   CONSTRAINT REG_COU_COU_CODE_NN   NOT NULL
, STUDENT_CODE      VARCHAR2(10)   CONSTRAINT REG_COU_STD_CODE_NN   NOT NULL
, REG_COURSE_DATE   DATE           DEFAULT SYSDATE
);


--==>>Table COURSE_REGISTER이(가) 생성되었습니다.

--FK 2번
-- 수강신청 테이블 FK 추가
ALTER TABLE COURSE_REGISTER
ADD ( CONSTRAINT REG_COU_COU_CODE_FK FOREIGN KEY(OP_COURSE_CODE)
                 REFERENCES COURSE_OPEN(OP_COURSE_CODE)
    , CONSTRAINT TEG_COU_STD_CODE_FK FOREIGN KEY(STUDENT_CODE)
                 REFERENCES STUDENT_REGISTER(STUDENT_CODE) );
--==>>Table COURSE_REGISTER이(가) 변경되었습니다.                 
--------------------------------------------------------------------------------

--○ 중도탈락 테이블 생성(DR_STD)
CREATE TABLE STUDENT_DROP
( DROP_CODE         VARCHAR2(10)    CONSTRAINT DR_STD_CODE_PK   PRIMARY KEY
, REG_COURSE_CODE   VARCHAR2(10)    CONSTRAINT DR_STD_COU_CODE  NOT NULL
, DR_REASON_CODE    NUMBER
, DROP_DATE         DATE            DEFAULT SYSDATE
);
--==>>Table STUDENT_DROP이(가) 생성되었습니다.

--FK 3번
-- 중도탈락 테이블 FK 추가
ALTER TABLE STUDENT_DROP
ADD ( CONSTRAINT DR_STD_COU_CODE_FK FOREIGN KEY(REG_COURSE_CODE)
                 REFERENCES COURSE_REGISTER(REG_COURSE_CODE)
    , CONSTRAINT DR_STD_RE_CODE_FK FOREIGN KEY(DR_REASON_CODE)
                 REFERENCES DROP_REASON(DR_REASON_CODE));
--==>>Table STUDENT_DROP이(가) 변경되었습니다.                                                 
--------------------------------------------------------------------------------

-- 중도탈락사유코드 DR_RE 
CREATE TABLE DROP_REASON
( DR_REASON_CODE   NUMBER                                   -- 중도탈락사유코드
, DETAIL           VARCHAR2(30)                             -- 중도탈락상세사유
, CONSTRAINT DR_RE_CODE_PK PRIMARY KEY(DR_REASON_CODE)
, CONSTRAINT DR_RE_DET_NN CHECK(DETAIL IS NOT NULL)
);
--==>>Table DROP_REASON이(가) 생성되었습니다.
--------------------------------------------------------------------------------

-- 강의실등록 REG_CLASS
CREATE TABLE CLASSROOM_REGISTER
( CLASSROOM_CODE      NUMBER                                    -- 강의실코드
, CLASSROOM_NAME      VARCHAR2(20)                              -- 강의실명
, CLASSROOM_CAPACITY  NUMBER                                    -- 수용인원
, CONSTRAINT REG_CLASS_CODE_PK PRIMARY KEY (CLASSROOM_CODE)
, CONSTRAINT REG_CLASS_NAME_NN CHECK(CLASSROOM_NAME IS NOT NULL)
, CONSTRAINT REG_CLASS_CAPA_NN CHECK(CLASSROOM_CAPACITY IS NOT NULL)
);         
--==>>Table CLASSROOM_REGISTER이(가) 생성되었습니다.
--------------------------------------------------------------------------------
--○ 과정(COU) 테이블 생성
CREATE TABLE COURSE
( COURSE_CODE    NUMBER           -- (과정코드)
, COURSE_NAME    VARCHAR2(20)     -- (과정명)
, CONSTRAINT COU_CODE_PK PRIMARY KEY(COURSE_CODE)
, CONSTRAINT COU_NAME_NN CHECK(COURSE_NAME IS NOT NULL)
);
--==>>Table COURSE이(가) 생성되었습니다.
--------------------------------------------------------------------------------

--○ 과목개설(OP_SUB) 테이블 생성
CREATE TABLE SUBJECT_OPEN
( OP_SUBJECT_CODE   VARCHAR2(10)            -- (과목개설코드)
, SUBJECT_CODE      NUMBER                  -- (과목코드)
, TEXTBOOK_CODE     NUMBER                  -- (교재코드) 
, OP_COURSE_CODE    VARCHAR2(10)            -- (과정개설코드)
, START_DATE        DATE                    -- (시작일자)
, END_DATE          DATE                    -- (종료일자)     
, ATTENDANCE_RATE   NUMBER                  -- (출결배점)
, WRITING_RATE      NUMBER                  -- (필기배점)   
, PERFORMANCE_RATE  NUMBER                  -- (실기배점) 
, OPEN_DATE         DATE DEFAULT SYSDATE    -- (개설일자) 
, CONSTRAINT OP_SUB_CODE_PK PRIMARY KEY(OP_SUBJECT_CODE)
, CONSTRAINT OP_SUB_SUB_CODE_NN CHECK(SUBJECT_CODE IS NOT NULL)
, CONSTRAINT OP_SUB_OP_COU_CODE_NN CHECK(OP_COURSE_CODE IS NOT NULL)
, CONSTRAINT OP_SUB_STR_DATE_NN CHECK(START_DATE IS NOT NULL)
, CONSTRAINT OP_SUB_END_DATE_NN CHECK(END_DATE IS NOT NULL)
);
--==>>Table SUBJECT_OPEN이(가) 생성되었습니다.

--FK 4번
-- FK 추가 쿼리(과목개설(OP_SUB) 테이블)
ALTER TABLE SUBJECT_OPEN
ADD ( CONSTRAINT OP_SUB_SUB_CODE_FK FOREIGN KEY(SUBJECT_CODE)
                 REFERENCES SUBJECT(SUBJECT_CODE)
    , CONSTRAINT OP_SUB_TXT_CODE_FK FOREIGN KEY(TEXTBOOK_CODE)
                 REFERENCES TEXTBOOK(TEXTBOOK_CODE)
    , CONSTRAINT OP_SUB_OP_COU_CODE_FK FOREIGN KEY(OP_COURSE_CODE)
                 REFERENCES COURSE_OPEN(OP_COURSE_CODE) );
--==>>Table SUBJECT_OPEN이(가) 변경되었습니다.
--------------------------------------------------------------------------------
--○ 교재 테이블 생성
CREATE TABLE TEXTBOOK
( TEXTBOOK_CODE NUMBER
, TEXTBOOK_NAME VARCHAR2(20)
, PUBLISHER     VARCHAR2(30)
, CONSTRAINT TXT_CODE_PK PRIMARY KEY (TEXTBOOK_CODE)
);
--==>>Table TEXTBOOK이(가) 생성되었습니다.
ALTER TABLE TEXTBOOK
ADD CONSTRAINT TXT_NAME_NN CHECK("TEXTBOOK_NAME" IS NOT NULL);
--==>>Table TEXTBOOK이(가) 변경되었습니다.
--------------------------------------------------------------------------------
--○과목 테이블
CREATE TABLE SUBJECT
( SUBJECT_CODE NUMBER
, SUBJECT_NAME VARCHAR2(20)
, CONSTRAINT SUB_CODE_PK PRIMARY KEY (SUBJECT_CODE)
);
--==>>Table SUBJECT이(가) 생성되었습니다.
ALTER TABLE SUBJECT
ADD CONSTRAINT SUB_NAME_NN CHECK("SUBJECT_NAME" IS NOT NULL);
--==>>Table SUBJECT이(가) 변경되었습니다.
--------------------------------------------------------------------------------
--○ 성적 입력 테이블
CREATE TABLE SCORE_INPUT
( SCORE_CODE        VARCHAR2(10)
, OP_SUBJECT_CODE   VARCHAR2(10)
, REG_COURSE_CODE   VARCHAR2(10)
, ATTENDANCE_CODE   NUMBER DEFAULT 0
, WRITING_SCORE     NUMBER DEFAULT 0
, PERFORMANCE_SCORE NUMBER DEFAULT 0
, SCORE_DATE        DATE DEFAULT SYSDATE
, CONSTRAINT IN_SCR_CODE_PK PRIMARY KEY (SCORE_CODE)
);
--==>>Table SCORE_INPUT이(가) 생성되었습니다.

ALTER TABLE SCORE_INPUT
ADD ( CONSTRAINT IN_SCR_OP_SUB_CODE_NN CHECK("OP_SUBJECT_CODE" IS NOT NULL)
    , CONSTRAINT IN_SCR_REG_COU_CODE_NN CHECK("REG_COURSE_CODE" IS NOT NULL) );
--==>>Table SCORE_INPUT이(가) 변경되었습니다.

--FK 5번
-- FK 제약
ALTER TABLE SCORE_INPUT
ADD ( CONSTRAINT IN_SCR_OP_SUB_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE)         
                 REFERENCES SUBJECT_OPEN(OP_SUBJECT_CODE)
    , CONSTRAINT IN_SCR_REG_COU_CODE_FK FOREIGN KEY(REG_COURSE_CODE)    
                 REFERENCES COURSE_REGISTER(REG_COURSE_CODE) );
--==>>Table SCORE_INPUT이(가) 변경되었습니다.
--------------------------------------------------------------------------------
-- GRANT CREATE VIEW TO TEAM4; (SYS계정)
-- 제약조건 VIEW 생성
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
     , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
     , UC.TABLE_NAME "TABLE_NAME"
     , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
     , UCC.COLUMN_NAME "COLUMN_NAME"
     , UC.SEARCH_CONDITION "SEARCH_CONDITION"
     , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;


--○ TEACHER_REGISTER 테이블에서 ID 컬럼 삭제
--   이유 : TEACHER_CODE와 같은 기능 담당. 
ALTER TABLE TEACHER_REGISTER DROP COLUMN ID;
--==>>Table TEACHER_REGISTER이(가) 변경되었습니다.
ALTER TABLE MANAGER_REGISTER DROP COLUMN ID;
--==>>Table MANAGER_REGISTER이(가) 변경되었습니다.
ALTER TABLE STUDENT_REGISTER DROP COLUMN ID;
--==>>Table STUDENT_REGISTER이(가) 변경되었습니다.
