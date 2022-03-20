--------------------------------------------------------------------------------
--�� �����ڵ�� ���̺� ����
CREATE TABLE MANAGER_REGISTER
(MANAGER_CODE   VARCHAR2(10)           -- (�������ڵ�)
,ID             VARCHAR2(10)           -- (ID)
,PASSWORD       VARCHAR2(30)           -- (��й�ȣ)
,REGISTER_DATE  DATE DEFAULT SYSDATE   -- (������ �������)
,CONSTRAINT MA_CODE_PK PRIMARY KEY(MANAGER_CODE)
,CONSTRAINT MA_ID_NN CHECK(ID IS NOT NULL)
,CONSTRAINT MA_PASSWORD_NN CHECK(PASSWORD IS NOT NULL)
);
--==>>Table MANAGER_REGISTER��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------

--�� ������� ���̺� ����
CREATE TABLE TEACHER_REGISTER
(TEACHER_CODE    VARCHAR2(10)          --(�����ڵ�)
,ID              VARCHAR2(20)          --(ID) 
,PASSWORD        VARCHAR2(30)          --(��й�ȣ)
,NAME            VARCHAR2(20)          --(������)
,SSN             VARCHAR2(13)          --(�ֹι�ȣ)
,REGISTER_DATE   DATE DEFAULT SYSDATE  --(��������)
,CONSTRAINT TC_CODE_PK PRIMARY KEY(TEACHER_CODE)
,CONSTRAINT TC_ID_NN CHECK(ID IS NOT NULL)
,CONSTRAINT TC_PASSWORD_NN CHECK(PASSWORD IS NOT NULL)
,CONSTRAINT TC_NAME_NN CHECK(NAME IS NOT NULL)
,CONSTRAINT TC_SSN_NN CHECK(SSN IS NOT NULL)
);
--==>>Table TEACHER_REGISTER��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------

--�� �л� ���(STD) ���̺� ����
CREATE TABLE STUDENT_REGISTER
( STUDENT_CODE      VARCHAR2(10)         -- (�л��ڵ�)
, ID                VARCHAR2(20)         -- (�л�ID)
, PASSWORD          VARCHAR2(30)         -- (��й�ȣ)
, NAME              VARCHAR2(20)         -- (�л���)
, SSN               VARCHAR2(13)         -- (�ֹι�ȣ)
, REGISTER_DATE     DATE DEFAULT SYSDATE -- (��������)
, CONSTRAINT STD_STD_CODE_PK PRIMARY KEY(STUDENT_CODE)
, CONSTRAINT STD_ID_NN CHECK(ID IS NOT NULL)
, CONSTRAINT STD_PASSWORD_NN CHECK(PASSWORD IS NOT NULL)
, CONSTRAINT STD_NAME_NN CHECK(NAME IS NOT NULL)
, CONSTRAINT STD_SSN_NN CHECK(SSN IS NOT NULL)
, CONSTRAINT STD_REG_DATE_NN CHECK(REGISTER_DATE IS NOT NULL)
);
--==>>Table STUDENT_REGISTER��(��) �����Ǿ����ϴ�.
-- �л� ��� ���̺� �������� �߰�(UK)
-- (�ֹε�Ϲ�ȣ�� UNIQUE �������� �߰���)
ALTER TABLE STUDENT_REGISTER
ADD CONSTRAINT STD_SSN_UK UNIQUE(SSN);
--==>>Table STUDENT_REGISTER��(��) ����Ǿ����ϴ�.
--------------------------------------------------------------------------------

--�� ���� ����(OP_COU) ���̺� ����
CREATE TABLE COURSE_OPEN
( OP_COURSE_CODE    VARCHAR2(10)         -- (���������ڵ�)
, COURSE_CODE       NUMBER               -- (�����ڵ�)
, TEACHER_CODE      VARCHAR2(10)         -- (�����ڵ�)
, CLASSROOM_CODE    NUMBER               -- (���ǽ��ڵ�)
, START_DATE        DATE                 -- (��������)
, END_DATE          DATE                 -- (��������)
, OPEN_DATE         DATE DEFAULT SYSDATE -- (��������)
, CONSTRAINT OP_COU_OP_COU_CODE_PK PRIMARY KEY(OP_COURSE_CODE)
, CONSTRAINT OP_COU_COU_CODE_NN CHECK(COURSE_CODE IS NOT NULL)
, CONSTRAINT OP_COU_TEA_CODE_NN CHECK(TEACHER_CODE IS NOT NULL)
, CONSTRAINT OP_COU_CLA_CODE_NN CHECK(CLASSROOM_CODE IS NOT NULL)
, CONSTRAINT OP_COU_STA_DATE_NN CHECK(START_DATE IS NOT NULL)
, CONSTRAINT OP_COU_END_DATE_NN CHECK(END_DATE IS NOT NULL)
);
--==>>Table COURSE_OPEN��(��) �����Ǿ����ϴ�.


--FK 1��
-- ���� ���� ���̺� �������� �߰�(FK)
ALTER TABLE COURSE_OPEN
ADD CONSTRAINT OP_COU_COU_CODE_FK FOREIGN KEY(COURSE_CODE)
                                  REFERENCES COURSE(COURSE_CODE);
--==>>Table COURSE_OPEN��(��) ����Ǿ����ϴ�.

ALTER TABLE COURSE_OPEN
ADD CONSTRAINT OP_COU_TEA_CODE_FK FOREIGN KEY(TEACHER_CODE)
                                  REFERENCES TEACHER_REGISTER(TEACHER_CODE);
--==>>Table COURSE_OPEN��(��) ����Ǿ����ϴ�.

ALTER TABLE COURSE_OPEN
ADD CONSTRAINT OP_COU_CLA_CODE_FK FOREIGN KEY(CLASSROOM_CODE)
                                  REFERENCES CLASSROOM_REGISTER(CLASSROOM_CODE);
--==>>Table COURSE_OPEN��(��) ����Ǿ����ϴ�.
                                  
--------------------------------------------------------------------------------

--�� ������û ���̺� ����(REG_COU)
CREATE TABLE COURSE_REGISTER
( REG_COURSE_CODE   VARCHAR2(10)   CONSTRAINT REG_COU_CODE_PK       PRIMARY KEY 
, OP_COURSE_CODE    VARCHAR2(10)   CONSTRAINT REG_COU_COU_CODE_NN   NOT NULL
, STUDENT_CODE      VARCHAR2(10)   CONSTRAINT REG_COU_STD_CODE_NN   NOT NULL
, REG_COURSE_DATE   DATE           DEFAULT SYSDATE
);


--==>>Table COURSE_REGISTER��(��) �����Ǿ����ϴ�.

--FK 2��
-- ������û ���̺� FK �߰�
ALTER TABLE COURSE_REGISTER
ADD ( CONSTRAINT REG_COU_COU_CODE_FK FOREIGN KEY(OP_COURSE_CODE)
                 REFERENCES COURSE_OPEN(OP_COURSE_CODE)
    , CONSTRAINT TEG_COU_STD_CODE_FK FOREIGN KEY(STUDENT_CODE)
                 REFERENCES STUDENT_REGISTER(STUDENT_CODE) );
--==>>Table COURSE_REGISTER��(��) ����Ǿ����ϴ�.                 
--------------------------------------------------------------------------------

--�� �ߵ�Ż�� ���̺� ����(DR_STD)
CREATE TABLE STUDENT_DROP
( DROP_CODE         VARCHAR2(10)    CONSTRAINT DR_STD_CODE_PK   PRIMARY KEY
, REG_COURSE_CODE   VARCHAR2(10)    CONSTRAINT DR_STD_COU_CODE  NOT NULL
, DR_REASON_CODE    NUMBER
, DROP_DATE         DATE            DEFAULT SYSDATE
);
--==>>Table STUDENT_DROP��(��) �����Ǿ����ϴ�.

--FK 3��
-- �ߵ�Ż�� ���̺� FK �߰�
ALTER TABLE STUDENT_DROP
ADD ( CONSTRAINT DR_STD_COU_CODE_FK FOREIGN KEY(REG_COURSE_CODE)
                 REFERENCES COURSE_REGISTER(REG_COURSE_CODE)
    , CONSTRAINT DR_STD_RE_CODE_FK FOREIGN KEY(DR_REASON_CODE)
                 REFERENCES DROP_REASON(DR_REASON_CODE));
--==>>Table STUDENT_DROP��(��) ����Ǿ����ϴ�.                                                 
--------------------------------------------------------------------------------

-- �ߵ�Ż�������ڵ� DR_RE 
CREATE TABLE DROP_REASON
( DR_REASON_CODE   NUMBER                                   -- �ߵ�Ż�������ڵ�
, DETAIL           VARCHAR2(30)                             -- �ߵ�Ż���󼼻���
, CONSTRAINT DR_RE_CODE_PK PRIMARY KEY(DR_REASON_CODE)
, CONSTRAINT DR_RE_DET_NN CHECK(DETAIL IS NOT NULL)
);
--==>>Table DROP_REASON��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------

-- ���ǽǵ�� REG_CLASS
CREATE TABLE CLASSROOM_REGISTER
( CLASSROOM_CODE      NUMBER                                    -- ���ǽ��ڵ�
, CLASSROOM_NAME      VARCHAR2(20)                              -- ���ǽǸ�
, CLASSROOM_CAPACITY  NUMBER                                    -- �����ο�
, CONSTRAINT REG_CLASS_CODE_PK PRIMARY KEY (CLASSROOM_CODE)
, CONSTRAINT REG_CLASS_NAME_NN CHECK(CLASSROOM_NAME IS NOT NULL)
, CONSTRAINT REG_CLASS_CAPA_NN CHECK(CLASSROOM_CAPACITY IS NOT NULL)
);         
--==>>Table CLASSROOM_REGISTER��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�� ����(COU) ���̺� ����
CREATE TABLE COURSE
( COURSE_CODE    NUMBER           -- (�����ڵ�)
, COURSE_NAME    VARCHAR2(20)     -- (������)
, CONSTRAINT COU_CODE_PK PRIMARY KEY(COURSE_CODE)
, CONSTRAINT COU_NAME_NN CHECK(COURSE_NAME IS NOT NULL)
);
--==>>Table COURSE��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------

--�� ���񰳼�(OP_SUB) ���̺� ����
CREATE TABLE SUBJECT_OPEN
( OP_SUBJECT_CODE   VARCHAR2(10)            -- (���񰳼��ڵ�)
, SUBJECT_CODE      NUMBER                  -- (�����ڵ�)
, TEXTBOOK_CODE     NUMBER                  -- (�����ڵ�) 
, OP_COURSE_CODE    VARCHAR2(10)            -- (���������ڵ�)
, START_DATE        DATE                    -- (��������)
, END_DATE          DATE                    -- (��������)     
, ATTENDANCE_RATE   NUMBER                  -- (������)
, WRITING_RATE      NUMBER                  -- (�ʱ����)   
, PERFORMANCE_RATE  NUMBER                  -- (�Ǳ����) 
, OPEN_DATE         DATE DEFAULT SYSDATE    -- (��������) 
, CONSTRAINT OP_SUB_CODE_PK PRIMARY KEY(OP_SUBJECT_CODE)
, CONSTRAINT OP_SUB_SUB_CODE_NN CHECK(SUBJECT_CODE IS NOT NULL)
, CONSTRAINT OP_SUB_OP_COU_CODE_NN CHECK(OP_COURSE_CODE IS NOT NULL)
, CONSTRAINT OP_SUB_STR_DATE_NN CHECK(START_DATE IS NOT NULL)
, CONSTRAINT OP_SUB_END_DATE_NN CHECK(END_DATE IS NOT NULL)
);
--==>>Table SUBJECT_OPEN��(��) �����Ǿ����ϴ�.

--FK 4��
-- FK �߰� ����(���񰳼�(OP_SUB) ���̺�)
ALTER TABLE SUBJECT_OPEN
ADD ( CONSTRAINT OP_SUB_SUB_CODE_FK FOREIGN KEY(SUBJECT_CODE)
                 REFERENCES SUBJECT(SUBJECT_CODE)
    , CONSTRAINT OP_SUB_TXT_CODE_FK FOREIGN KEY(TEXTBOOK_CODE)
                 REFERENCES TEXTBOOK(TEXTBOOK_CODE)
    , CONSTRAINT OP_SUB_OP_COU_CODE_FK FOREIGN KEY(OP_COURSE_CODE)
                 REFERENCES COURSE_OPEN(OP_COURSE_CODE) );
--==>>Table SUBJECT_OPEN��(��) ����Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�� ���� ���̺� ����
CREATE TABLE TEXTBOOK
( TEXTBOOK_CODE NUMBER
, TEXTBOOK_NAME VARCHAR2(20)
, PUBLISHER     VARCHAR2(30)
, CONSTRAINT TXT_CODE_PK PRIMARY KEY (TEXTBOOK_CODE)
);
--==>>Table TEXTBOOK��(��) �����Ǿ����ϴ�.
ALTER TABLE TEXTBOOK
ADD CONSTRAINT TXT_NAME_NN CHECK("TEXTBOOK_NAME" IS NOT NULL);
--==>>Table TEXTBOOK��(��) ����Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�۰��� ���̺�
CREATE TABLE SUBJECT
( SUBJECT_CODE NUMBER
, SUBJECT_NAME VARCHAR2(20)
, CONSTRAINT SUB_CODE_PK PRIMARY KEY (SUBJECT_CODE)
);
--==>>Table SUBJECT��(��) �����Ǿ����ϴ�.
ALTER TABLE SUBJECT
ADD CONSTRAINT SUB_NAME_NN CHECK("SUBJECT_NAME" IS NOT NULL);
--==>>Table SUBJECT��(��) ����Ǿ����ϴ�.
--------------------------------------------------------------------------------
--�� ���� �Է� ���̺�
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
--==>>Table SCORE_INPUT��(��) �����Ǿ����ϴ�.

ALTER TABLE SCORE_INPUT RENAME COLUMN ATTENDANCE_CODE TO ATTENDANCE_SCORE;

ALTER TABLE SCORE_INPUT
ADD ( CONSTRAINT IN_SCR_OP_SUB_CODE_NN CHECK("OP_SUBJECT_CODE" IS NOT NULL)
    , CONSTRAINT IN_SCR_REG_COU_CODE_NN CHECK("REG_COURSE_CODE" IS NOT NULL) );
--==>>Table SCORE_INPUT��(��) ����Ǿ����ϴ�.

--FK 5��
-- FK ����
ALTER TABLE SCORE_INPUT
ADD ( CONSTRAINT IN_SCR_OP_SUB_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE)         
                 REFERENCES SUBJECT_OPEN(OP_SUBJECT_CODE)
    , CONSTRAINT IN_SCR_REG_COU_CODE_FK FOREIGN KEY(REG_COURSE_CODE)    
                 REFERENCES COURSE_REGISTER(REG_COURSE_CODE) );
--==>>Table SCORE_INPUT��(��) ����Ǿ����ϴ�.
--------------------------------------------------------------------------------
-- GRANT CREATE VIEW TO TEAM4; (SYS����)
-- �������� VIEW ����
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


--�� TEACHER_REGISTER ���̺��� ID �÷� ����
--   ���� : TEACHER_CODE�� ���� ��� ���. 
ALTER TABLE TEACHER_REGISTER DROP COLUMN ID;
--==>>Table TEACHER_REGISTER��(��) ����Ǿ����ϴ�.
ALTER TABLE MANAGER_REGISTER DROP COLUMN ID;
--==>>Table MANAGER_REGISTER��(��) ����Ǿ����ϴ�.
ALTER TABLE STUDENT_REGISTER DROP COLUMN ID;
--==>>Table STUDENT_REGISTER��(��) ����Ǿ����ϴ�.


SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM USER_TABLES;


