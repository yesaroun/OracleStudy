
--------------------------------------------------------------------------------
-- *2
--�� ���̵� ��ȸ �Լ� FN_ID_CHECK(ID)
CREATE OR REPLACE FUNCTION FN_ID_CHECK
(ID MANAGER_REGISTER.MANAGER_CODE%TYPE)
RETURN NUMBER 
IS
    V_M NUMBER;
    V_T NUMBER;
    V_S NUMBER;
    V_RESULT NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_T
    FROM TEACHER_REGISTER
    WHERE TEACHER_CODE = ID;
    
    SELECT COUNT(*) INTO V_M
    FROM MANAGER_REGISTER
    WHERE MANAGER_CODE = ID;
    
    SELECT COUNT(*) INTO V_S
    FROM STUDENT_REGISTER
    WHERE STUDENT_CODE = ID;
    
    IF (SUBSTR(ID,1,1) = 'M')
        THEN V_RESULT := V_M;
    ELSIF (SUBSTR(ID,1,1) = 'T')
        THEN V_RESULT := V_T;
    ELSIF (SUBSTR(ID,1,1) = 'S')
        THEN V_RESULT := V_S;
    ELSE
        V_RESULT := 0;
    END IF;
 
    RETURN V_RESULT;    -- ��ȯ : ��ġ�ϴ� ID�� ������ 1, ������ 0
END;

--------------------------------------------------------------------------------
-- *3
--�� ��й�ȣ ��ȸ �Լ� FN_PW_CHECK(ID,PW)
CREATE OR REPLACE FUNCTION FN_PW_CHECK
( CODE MANAGER_REGISTER.MANAGER_CODE%TYPE
, PW MANAGER_REGISTER.PASSWORD%TYPE)
RETURN NUMBER 
IS
    V_M NUMBER;
    V_T NUMBER;
    V_S NUMBER;
    V_RESULT    NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_M
    FROM MANAGER_REGISTER
    WHERE PASSWORD = PW
      AND MANAGER_CODE = CODE;

    SELECT COUNT(*) INTO V_T
    FROM TEACHER_REGISTER
    WHERE PASSWORD = PW
      AND TEACHER_CODE = CODE;
    
    SELECT COUNT(*) INTO V_S
    FROM STUDENT_REGISTER
    WHERE PASSWORD = PW
      AND STUDENT_CODE = CODE;
    
    IF (V_M = 1 AND V_T = 0 AND V_S = 0)
    THEN V_RESULT := V_M;
    ELSIF (V_T = 1 AND V_M = 0 AND V_S = 0)
    THEN V_RESULT := V_T;
    ELSIF (V_S = 1 AND V_M = 0 AND V_T = 0)
    THEN V_RESULT := V_S;
    ELSE
        V_RESULT := 0;
    END IF;
 
    RETURN V_RESULT;    -- ��ȯ : ��ġ�ϴ� PW�� ������ 1, ������ 0
END;

--------------------------------------------------------------------------------

-- *12
--�� ������ ��ȯ �Լ� FN_COURSE(�����ڵ�)
CREATE OR REPLACE FUNCTION FN_COURSE(V_COU_COD NUMBER)
RETURN VARCHAR2
IS
    V_COU_NAME   COURSE.COURSE_NAME%TYPE;
BEGIN
    SELECT COURSE_NAME INTO V_COU_NAME
      FROM COURSE
     WHERE COURSE_CODE = V_COU_COD;
     
     RETURN V_COU_NAME;
END;


--------------------------------------------------------------------------------
-- *13
--�� ������ ��ȯ �Լ� FN_TEACHER_REGISTER(����ID)
CREATE OR REPLACE FUNCTION FN_TEACHER_REGISTER(V_TC_COD VARCHAR2)
RETURN  VARCHAR2
IS
    V_NAME  TEACHER_REGISTER.NAME%TYPE;
BEGIN
    SELECT NAME INTO V_NAME
      FROM TEACHER_REGISTER
     WHERE TEACHER_CODE = V_TC_COD;
    
    RETURN V_NAME;
END;

--------------------------------------------------------------------------------

-- *14
--�� ���ǽǸ� ��ȯ �Լ� FN_CLASSROOM_REGISTER(���ǽ��ڵ�) 
CREATE OR REPLACE FUNCTION FN_CLASSROOM_REGISTER(V_CLAS_COD NUMBER)
RETURN  VARCHAR2
IS
    V_CLAS_NAME    CLASSROOM_REGISTER.CLASSROOM_NAME%TYPE;
BEGIN
    SELECT CLASSROOM_NAME INTO V_CLAS_NAME
      FROM CLASSROOM_REGISTER
     WHERE CLASSROOM_CODE = V_CLAS_COD;
    
    RETURN V_CLAS_NAME;
END;

--------------------------------------------------------------------------------

-- *15
--�� ����� ��ȯ �Լ� FN_TEXTBOOK(�����ڵ�)
CREATE OR REPLACE FUNCTION FN_TEXTBOOK(V_TXT_COD  NUMBER)
RETURN  VARCHAR2
IS
    V_TXT_NAME     TEXTBOOK.TEXTBOOK_NAME%TYPE;
BEGIN
    SELECT TEXTBOOK_NAME INTO V_TXT_NAME
      FROM TEXTBOOK
     WHERE TEXTBOOK_CODE = V_TXT_COD;
     
     RETURN V_TXT_NAME;
END;

--------------------------------------------------------------------------------
-- *16
--�� ����� ��ȯ �Լ� FN_SUBJECT(�����ڵ�)
CREATE OR REPLACE FUNCTION FN_SUBJECT(V_SUB_COD NUMBER)
RETURN  VARCHAR2
IS
    V_SUB_NAME  SUBJECT.SUBJECT_NAME%TYPE;
BEGIN
    SELECT SUBJECT_NAME INTO V_SUB_NAME
      FROM SUBJECT
     WHERE SUBJECT_CODE = V_SUB_COD;
     
     RETURN V_SUB_NAME;
END;