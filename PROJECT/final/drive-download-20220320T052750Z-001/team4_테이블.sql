SELECT USER
FROM DUAL;
--==>>TEAM4

--------------------------------------------------------------------------------

--�� �����ڵ�� ���̺� ����
CREATE TABLE MANAGER_REGISTER
( MANAGER_CODE   VARCHAR2(10)
, PASSWORD       VARCHAR2(30) CONSTRAINT MA_PASSWORD_NN NOT NULL
, REGISTER_DATE  DATE DEFAULT SYSDATE
, CONSTRAINT MA_CODE_PK PRIMARY KEY(MANAGER_CODE)
);

--------------------------------------------------------------------------------

--�� ������� ���̺� ����
CREATE TABLE TEACHER_REGISTER
( TEACHER_CODE    VARCHAR2(10)          --(�����ڵ�)
, PASSWORD        VARCHAR2(30) CONSTRAINT TC_PASSWORD_NN NOT NULL         --(��й�ȣ)
, NAME            VARCHAR2(20) CONSTRAINT TC_NAME_NN NOT NULL          --(������)
, SSN             VARCHAR2(13) CONSTRAINT TC_SSN_NN NOT NULL          --(�ֹι�ȣ)
, REGISTER_DATE   DATE DEFAULT SYSDATE  --(��������)
, CONSTRAINT TC_CODE_PK PRIMARY KEY(TEACHER_CODE)
);

--------------------------------------------------------------------------------

--�� �л� ���(STD) ���̺� ����
CREATE TABLE STUDENT_REGISTER
( STUDENT_CODE      VARCHAR2(10)         -- (�л��ڵ�)
, PASSWORD          VARCHAR2(30) CONSTRAINT STD_PASSWORD_NN NOT NULL           -- (��й�ȣ)
, NAME              VARCHAR2(20) CONSTRAINT STD_NAME_NN NOT NULL           -- (�л���)
, SSN               VARCHAR2(13) CONSTRAINT STD_SSN_NN NOT NULL           -- (�ֹι�ȣ)
, REGISTER_DATE     DATE DEFAULT SYSDATE -- (��������)
, CONSTRAINT STD_STD_CODE_PK PRIMARY KEY(STUDENT_CODE)
, CONSTRAINT STD_REG_DATE_NN CHECK(REGISTER_DATE IS NOT NULL)
, CONSTRAINT STD_SSN_UK UNIQUE(SSN)
);
--==>>Table STUDENT_REGISTER��(��) �����Ǿ����ϴ�.

--------------------------------------------------------------------------------

--�� ���� ����(OP_COU) ���̺� ����
CREATE TABLE COURSE_OPEN
( OP_COURSE_CODE    VARCHAR2(10)         -- (���������ڵ�)
, COURSE_CODE       NUMBER CONSTRAINT OP_COU_COU_CODE_NN NOT NULL               -- (�����ڵ�)
, TEACHER_CODE      VARCHAR2(10)       -- (�����ڵ�)
, CLASSROOM_CODE    NUMBER CONSTRAINT OP_COU_CLA_CODE_NN NOT NULL               -- (���ǽ��ڵ�)
, START_DATE        DATE CONSTRAINT OP_COU_STA_DATE_NN NOT NULL                 -- (��������)
, END_DATE          DATE CONSTRAINT OP_COU_END_DATE_NN NOT NULL                 -- (��������)
, OPEN_DATE         DATE DEFAULT SYSDATE -- (��������)
, CONSTRAINT OP_COU_OP_COU_CODE_PK PRIMARY KEY(OP_COURSE_CODE)
, CONSTRAINT OP_COU_COU_CODE_FK FOREIGN KEY(COURSE_CODE)
                                REFERENCES COURSE(COURSE_CODE)
, CONSTRAINT OP_COU_TEA_CODE_FK FOREIGN KEY(TEACHER_CODE)
                                REFERENCES TEACHER_REGISTER(TEACHER_CODE)
, CONSTRAINT OP_COU_CLA_CODE_FK FOREIGN KEY(CLASSROOM_CODE)
                                REFERENCES CLASSROOM_REGISTER(CLASSROOM_CODE);
);

--------------------------------------------------------------------------------

--�� ������û ���̺� ����(REG_COU)
CREATE TABLE COURSE_REGISTER
( REG_COURSE_CODE   VARCHAR2(10)   
, OP_COURSE_CODE    VARCHAR2(10) CONSTRAINT REG_COU_COU_CODE_NN NOT NULL     
, STUDENT_CODE      VARCHAR2(10) CONSTRAINT REG_COU_STD_CODE_NN NOT NULL     
, REG_COURSE_DATE   DATE DEFAULT SYSDATE
, CONSTRAINT REG_COU_CODE_PK PRIMARY KEY(REG_COURSE_CODE)
, CONSTRAINT REG_COU_COU_CODE_FK FOREIGN KEY(OP_COURSE_CODE)
                                 REFERENCES COURSE_OPEN(OP_COURSE_CODE)
, CONSTRAINT TEG_COU_STD_CODE_FK FOREIGN KEY(STUDENT_CODE)
                                 REFERENCES STUDENT_REGISTER(STUDENT_CODE)
);

--------------------------------------------------------------------------------

--�� �ߵ�Ż�� ���̺� ����(DR_STD)
CREATE TABLE STUDENT_DROP
( DROP_CODE         VARCHAR2(10)    
, REG_COURSE_CODE   VARCHAR2(10) CONSTRAINT DR_STD_COU_CODE_NN NOT NULL   
, DR_REASON_CODE    NUMBER
, DROP_DATE         DATE DEFAULT SYSDATE
, CONSTRAINT DR_STD_CODE_PK   PRIMARY KEY(DROP_CODE)
, CONSTRAINT DR_STD_COU_CODE_FK FOREIGN KEY(REG_COURSE_CODE)
                                REFERENCES COURSE_REGISTER(REG_COURSE_CODE)
, CONSTRAINT DR_STD_RE_CODE_FK FOREIGN KEY(DR_REASON_CODE)
                                REFERENCES DROP_REASON(DR_REASON_CODE)
);

--------------------------------------------------------------------------------

--�� �ߵ�Ż�������ڵ� ���̺� ����(DR_RE) 
CREATE TABLE DROP_REASON
( DR_REASON_CODE   NUMBER                                   -- �ߵ�Ż�������ڵ�
, DETAIL           VARCHAR2(30) CONSTRAINT DR_RE_DET_NN NOT NULL                             -- �ߵ�Ż���󼼻���
, CONSTRAINT DR_RE_CODE_PK PRIMARY KEY(DR_REASON_CODE)
);

--------------------------------------------------------------------------------

--�� ���ǽǵ�� ���̺� ����(REG_CLASS)
CREATE TABLE CLASSROOM_REGISTER
( CLASSROOM_CODE      NUMBER                                    -- ���ǽ��ڵ�
, CLASSROOM_NAME      VARCHAR2(20) CONSTRAINT REG_CLASS_NAME_NN NOT NULL                             -- ���ǽǸ�
, CLASSROOM_CAPACITY  NUMBER CONSTRAINT REG_CLASS_CAPA_NN NOT NULL                                   -- �����ο�
, CONSTRAINT REG_CLASS_CODE_PK PRIMARY KEY (CLASSROOM_CODE)
);         

--------------------------------------------------------------------------------

--�� ����(COU) ���̺� ����
CREATE TABLE COURSE
( COURSE_CODE    NUMBER           -- (�����ڵ�)
, COURSE_NAME    VARCHAR2(20) CONSTRAINT COU_NAME_NN NOT NULL    -- (������)
, CONSTRAINT COU_CODE_PK PRIMARY KEY(COURSE_CODE)
);

--------------------------------------------------------------------------------

--�� ���񰳼�(OP_SUB) ���̺� ����
CREATE TABLE SUBJECT_OPEN
( OP_SUBJECT_CODE   VARCHAR2(10)            -- (���񰳼��ڵ�)
, SUBJECT_CODE      NUMBER CONSTRAINT OP_SUB_SUB_CODE_NN NOT NULL                 -- (�����ڵ�)
, TEXTBOOK_CODE     NUMBER                  -- (�����ڵ�) 
, OP_COURSE_CODE    VARCHAR2(10) CONSTRAINT OP_SUB_OP_COU_CODE_NN NOT NULL           -- (���������ڵ�)
, START_DATE        DATE CONSTRAINT OP_SUB_STR_DATE_NN NOT NULL                   -- (��������)
, END_DATE          DATE CONSTRAINT OP_SUB_END_DATE_NN NOT NULL                   -- (��������)     
, ATTENDANCE_RATE   NUMBER                  -- (������)
, WRITING_RATE      NUMBER                  -- (�ʱ����)   
, PERFORMANCE_RATE  NUMBER                  -- (�Ǳ����) 
, OPEN_DATE         DATE DEFAULT SYSDATE    -- (��������) 
, CONSTRAINT OP_SUB_CODE_PK PRIMARY KEY(OP_SUBJECT_CODE)
, CONSTRAINT OP_SUB_SUB_CODE_FK FOREIGN KEY(SUBJECT_CODE)
                                REFERENCES SUBJECT(SUBJECT_CODE)
, CONSTRAINT OP_SUB_TXT_CODE_FK FOREIGN KEY(TEXTBOOK_CODE)
                                REFERENCES TEXTBOOK(TEXTBOOK_CODE)
, CONSTRAINT OP_SUB_OP_COU_CODE_FK FOREIGN KEY(OP_COURSE_CODE)
                                REFERENCES COURSE_OPEN(OP_COURSE_CODE)
);

--------------------------------------------------------------------------------

--�� ���� ���̺� ����
CREATE TABLE TEXTBOOK
( TEXTBOOK_CODE NUMBER
, TEXTBOOK_NAME VARCHAR2(20) CONSTRAINT TXT_NAME_NN NOT NULL
, PUBLISHER     VARCHAR2(30)
, CONSTRAINT TXT_CODE_PK PRIMARY KEY (TEXTBOOK_CODE)
);

--------------------------------------------------------------------------------

--�۰��� ���̺�
CREATE TABLE SUBJECT
( SUBJECT_CODE NUMBER
, SUBJECT_NAME VARCHAR2(20) CONSTRAINT SUB_NAME_NN NOT NULL
, CONSTRAINT SUB_CODE_PK PRIMARY KEY (SUBJECT_CODE)
);

--------------------------------------------------------------------------------

--�� ���� �Է� ���̺�
CREATE TABLE SCORE_INPUT
( SCORE_CODE        VARCHAR2(10)
, OP_SUBJECT_CODE   VARCHAR2(10) CONSTRAINT IN_SCR_OP_SUB_CODE_NN NOT NULL
, REG_COURSE_CODE   VARCHAR2(10) CONSTRAINT IN_SCR_REG_COU_CODE_NN NOT NULL
, ATTENDANCE_SCORE  NUMBER DEFAULT 0
, WRITING_SCORE     NUMBER DEFAULT 0
, PERFORMANCE_SCORE NUMBER DEFAULT 0
, SCORE_DATE        DATE DEFAULT SYSDATE
, CONSTRAINT IN_SCR_CODE_PK PRIMARY KEY (SCORE_CODE)
, CONSTRAINT IN_SCR_OP_SUB_CODE_FK FOREIGN KEY(OP_SUBJECT_CODE)         
                                   REFERENCES SUBJECT_OPEN(OP_SUBJECT_CODE)
, CONSTRAINT IN_SCR_REG_COU_CODE_FK FOREIGN KEY(REG_COURSE_CODE)    
                                   REFERENCES COURSE_REGISTER(REG_COURSE_CODE)
);

--------------------------------------------------------------------------------

--�� �������� Ȯ�� ���� ��(VIEW) ����
--   (SYS ����)GRANT CREATE VIEW TO TEAM4;
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
      ,UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
      ,UC.TABLE_NAME"TABLE_NAME"
      ,UC.CONSTRAINT_TYPE"CONSTRAINT_TYPE"
      ,UCC.COLUMN_NAME"COLUMN_NAME"
      ,UC.SEARCH_CONDITION"SEARCH_CONDITION"
      ,UC.DELETE_RULE"DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.

