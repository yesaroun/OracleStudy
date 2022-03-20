CREATE OR REPLACE PROCEDURE TEACHER_REGISTER_TC_UPDATE
( V_TC_COD        IN TEACHER_REGISTER.TEACHER_CODE%TYPE
, V_PW            IN TEACHER_REGISTER.PASSWORD%TYPE
, V_NEW_PW        IN TEACHER_REGISTER.PASSWORD%TYPE
, V_NAME          IN TEACHER_REGISTER.NAME%TYPE
, V_SSN           IN TEACHER_REGISTER.SSN%TYPE
)
IS
    TEMP_TC_COD     NUMBER;
    TEMP_PW         NUMBER;
    
    TC_COD_ERROR    EXCEPTION;
    PW_ERROR        EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_TC_COD
      FROM TEACHER_REGISTER
     WHERE TEACHER_CODE = V_TC_COD;
    
    SELECT COUNT(*) INTO TEMP_PW
      FROM TEACHER_REGISTER
     WHERE TEACHER_CODE = V_TC_COD
       AND PASSWORD = V_PW;
    
    IF(TEMP_TC_COD = 0)
        THEN RAISE TC_COD_ERROR;
    ELSIF (TEMP_PW = 0)
        THEN RAISE PW_ERROR;
    END IF;
    
    UPDATE TEACHER_REGISTER
       SET PASSWORD = V_NEW_PW, NAME = V_NAME, SSN = V_SSN
     WHERE TEACHER_CODE = V_TC_COD;

    EXCEPTION
        WHEN TC_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20202, '유효한 교수가 아닙니다.');
            ROLLBACK;
            THEN RAISE_APPLICATION_ERROR(-20103, '아이디, 비밀번호가 일치하지 않습니다');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    COMMIT;
        
END;

CREATE OR REPLACE PROCEDURE TEACHER_REGISTER_UPDATE
( V_TC_COD        IN TEACHER_REGISTER.TEACHER_CODE%TYPE
, V_PW            IN TEACHER_REGISTER.PASSWORD%TYPE
, V_NAME          IN TEACHER_REGISTER.NAME%TYPE
, V_SSN           IN TEACHER_REGISTER.SSN%TYPE
, V_REG_DATE      IN TEACHER_REGISTER.REGISTER_DATE%TYPE
)
IS
    TEMP_TC_COD     NUMBER;
    
    TC_COD_ERROR    EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_TC_COD
      FROM TEACHER_REGISTER
     WHERE TEACHER_CODE = V_TC_COD;
    
    IF(TEMP_TC_COD = 0)
        THEN RAISE TC_COD_ERROR;
    END IF;
    
    UPDATE TEACHER_REGISTER
       SET PASSWORD = V_PW, NAME = V_NAME, SSN = V_SSN
         , REGISTER_DATE = V_REG_DATE
     WHERE TEACHER_CODE = V_TC_COD;

    EXCEPTION
        WHEN TC_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20202, '유효한 교수가 아닙니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE PRC_SUB_OPEN_UPDATE
( V_OPS_COD         IN SUBJECT_OPEN.OP_SUBJECT_CODE%TYPE
, V_SUB_COD         IN SUBJECT_OPEN.SUBJECT_CODE%TYPE
, V_TXT_COD         IN SUBJECT_OPEN.TEXTBOOK_CODE%TYPE
, V_OPC_COD         IN SUBJECT_OPEN.OP_COURSE_CODE%TYPE
, V_SDATE           IN SUBJECT_OPEN.START_DATE%TYPE
, V_EDATE           IN SUBJECT_OPEN.END_DATE%TYPE
)
IS
    TEMP_OPS_COD        NUMBER;
    TEMP_SUB_COD        NUMBER;
    TEMP_TXT_COD        NUMBER;
    TEMP_OPC_COD        NUMBER;
    
    
    OPS_COD_ERROR   EXCEPTION;
    SUB_COD_ERROR   EXCEPTION;
    TXT_COD_ERROR   EXCEPTION;
    OPC_COD_ERROR   EXCEPTION;
    DATE_ERROR      EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_OPS_COD
      FROM SUBJECT_OPEN
     WHERE OP_SUBJECT_CODE = V_OPS_COD;

    SELECT COUNT(*) INTO TEMP_SUB_COD
      FROM SUBJECT_OPEN
     WHERE OP_SUBJECT_CODE = V_SUB_COD;

    SELECT COUNT(*) INTO TEMP_TXT_COD
      FROM SUBJECT_OPEN
     WHERE OP_SUBJECT_CODE = V_TXT_COD;

    SELECT COUNT(*) INTO TEMP_OPC_COD
      FROM SUBJECT_OPEN
     WHERE OP_SUBJECT_CODE = V_OPC_COD;
     
    IF (TEMP_OPS_COD = 0)
        THEN RAISE OPS_COD_ERROR;
    ELSIF (TEMP_SUB_COD = 0)
        THEN RAISE SUB_COD_ERROR;
    ELSIF (TEMP_TXT_COD = 0)
        THEN RAISE TXT_COD_ERROR;
    ELSIF (TEMP_OPC_COD = 0)
        THEN RAISE OPC_COD_ERROR;
    END IF;
    
    IF(V_SDATE > V_EDATE)
        THEN RAISE DATE_ERROR;
    END IF;
     
    UPDATE SUBJECT_OPEN
       SET SUBJECT_CODE = V_SUB_COD, TEXTBOOK_CODE = V_TXT_COD
         , OP_COURSE_CODE = V_OPC_COD
         , START_DATE = V_SDATE, END_DATE = V_EDATE
     WHERE OP_SUBJECT_CODE = V_OPS_COD;
    
    EXCEPTION
        WHEN OPS_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20310, '유효한 과목코드가 아닙니다.');
            ROLLBACK;
        WHEN SUB_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20300, '유효한 과목이 아닙니다.');
            ROLLBACK;
        WHEN TXT_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20307, '유효한 교재가 아닙니다.');
            ROLLBACK;
        WHEN OPC_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20201, '유효한 과정이 아닙니다.');
            ROLLBACK;
        WHEN DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20204, '날짜를 확인하세요.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    COMMIT;
END;




 IF SQL%NOTFOUND
        THEN RAISE STD_COD_ERROR;
    END IF;


CREATE OR REPLACE PROCEDURE PRC_STU_REG_STUEDIT
(V_STD_COD       IN STUDENT_REGISTER.STUDENT_CODE%TYPE  --(학생코드)
,V_PW            IN STUDENT_REGISTER.PASSWORD%TYPE      --(비밀번호)
,V_NEW_PW        IN STUDENT_REGISTER.PASSWORD%TYPE      --(수정할 비밀번호)
,V_NAME          IN STUDENT_REGISTER.NAME%TYPE          --(학생명)
,V_SSN           IN STUDENT_REGISTER.SSN%TYPE           --(주민번호)
)
IS
    TEMP_STD_COD    NUMBER;
    TEMP_PW         NUMBER;
    
    STD_COD_ERROR   EXCEPTION;
    PW_ERROR        EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_STD_COD
      FROM STUDENT_REGISTER
     WHERE STUDENT_CODE = V_STD_COD;
     
    SELECT COUNT(*) INTO TEMP_PW
      FROM STUDENT_REGISTER
     WHERE STUDENT_CODE = V_STD_COD 
       AND PASSWORD = V_PW;
    
    IF(TEMP_STD_COD = 0)
        THEN RAISE STD_COD_ERROR;
    ELSIF (TEMP_PW = 0)
        THEN RAISE PW_ERROR;
    END IF;
    
    --UPDATE
    UPDATE STUDENT_REGISTER
      SET PASSWORD = V_NEW_PW,  NAME =  V_NAME  , SSN = V_SSN
    WHERE STUDENT_CODE = V_STD_COD
      AND PASSWORD = V_PW ;  
    
    EXCEPTION
        WHEN STD_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20100, '해당 아이디가 존재하지 않습니다.');
                ROLLBACK;
         WHEN PW_ERROR
            THEN RAISE_APPLICATION_ERROR(-20103, '아이디, 비밀번호가 일치하지 않습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
      
    COMMIT;
END;

EXEC PRC_STU_REG_STUEDIT('S0001', 12345, 1234, '김공일', '9203271234567');
SELECT *
  FROM STUDENT_REGISTER;

CREATE OR REPLACE PROCEDURE PRC_LOGIN
--관리자PK, 학생PK, 교수PK 모두 VARCHAR2(10)
--관리자PW, 학생PW, 교수PW 모두 VARCHAR2(30)
( V_CODE  IN MANAGER_REGISTER.MANAGER_CODE%TYPE
, V_PW    IN MANAGER_REGISTER.PASSWORD%TYPE
)
IS
    V_CHECKID NUMBER;   --일치1, 불일치0
    V_CHECKPW NUMBER;   --일치1, 불일치0
    
    USER_DEFINE_ERROR1 EXCEPTION;           -- ID 없음 에러
    USER_DEFINE_ERROR2 EXCEPTION;           -- 불일치 에러
BEGIN
    V_CHECKID := FN_ID_CHECK(V_CODE);
    V_CHECKPW := FN_PW_CHECK(V_CODE, V_PW);
   
    -- 로그인 IF문
    IF (V_CHECKID = 1 AND V_CHECKPW = 1)
        THEN DBMS_OUTPUT.PUT_LINE('로그인 성공~!!!');
    ELSIF (V_CHECKID = 0)
        THEN RAISE USER_DEFINE_ERROR1;
    ELSE
        RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 로그인 실패 예외 처리
    EXCEPTION
       WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20100, '해당 아이디가 존재하지 않습니다.');
                ROLLBACK;
       WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20103, '아이디, 비밀번호가 일치하지 않습니다.');
                ROLLBACK;
       WHEN OTHERS
            THEN ROLLBACK;

    -- 커밋
    COMMIT;
END;

INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('S0001', '1234', '김공일', 9203271234567);

EXEC PRC_LOGIN('S0001', '1234');

SET SERVEROUTPUT ON;

SELECT *
  FROM STUDENT_REGISTER;

CREATE OR REPLACE FUNCTION FN_ID_CHECK(ID MANAGER_REGISTER.MANAGER_CODE%TYPE)
RETURN NUMBER 
IS
    V_M NUMBER;
    V_T NUMBER;
    V_S NUMBER;
    V_RESULT    NUMBER;
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
 
    RETURN V_RESULT;
END;

CREATE OR REPLACE FUNCTION FN_PW_CHECK(CODE MANAGER_REGISTER.MANAGER_CODE%TYPE, PW MANAGER_REGISTER.PASSWORD%TYPE)
RETURN NUMBER 
IS
    V_M NUMBER;
    V_T NUMBER;
    V_S NUMBER;
    V_RESULT    NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_T
    FROM TEACHER_REGISTER
    WHERE PASSWORD = PW
      AND TEACHER_CODE = CODE;
    
    SELECT COUNT(*) INTO V_M
    FROM MANAGER_REGISTER
    WHERE PASSWORD = PW
      AND MANAGER_CODE = CODE;
    
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
 
    RETURN V_RESULT;
END;


--------------------------------------------------------------------



CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_DLETE
(V_CLAS_COD   IN CLASSROOM_REGISTER.CLASSROOM_CODE%TYPE
)
IS
    TEMP_CLAS_COD   NUMBER; 
    TEMP_CLAS_FK    NUMBER;
    CLAS_COD_ERROR   EXCEPTION; 
    CLAS_DEL_ERROR   EXCEPTION; 
BEGIN
    SELECT COUNT(*) INTO TEMP_CLAS_COD
      FROM CLASSROOM_REGISTER
     WHERE CLASSROOM_CODE = V_CLAS_COD;    
     
    SELECT COUNT(*) INTO TEMP_CLAS_FK
      FROM COURSE_OPEN
     WHERE CLASSROOM_CODE = V_CLAS_COD;        

    
    IF (TEMP_CLAS_COD  = 0)   
        THEN RAISE CLAS_COD_ERROR;
    ELSIF (TEMP_CLAS_FK <> 0  )
        THEN RAISE CLAS_DEL_ERROR;
    END IF; 

    -- DELETE
    DELETE
      FROM CLASSROOM_REGISTER
     WHERE CLASSROOM_CODE = V_CLAS_COD;      


    EXCEPTION       
        WHEN CLAS_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20203, '유효한 강의실이 아닙니다.');
            ROLLBACK;           
        WHEN CLAS_DEL_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20205, '해당 강의실은 참조되고 있으므로 삭제가 불가능합니다.');
            ROLLBACK;        
        WHEN OTHERS
            THEN ROLLBACK;
            
    COMMIT;
END;

SELECT *
  FROM COURSE_OPEN;

SELECT *
FROM CLASSROOM_REGISTER;
/*
101   101호   10
201   201호   20
301   301호   30
*/
INSERT INTO CLASSROOM_REGISTER (CLASSROOM_CODE, CLASSROOM_NAME, CLASSROOM_CAPACITY)
VALUES (601, '601호', 10);
EXEC PRC_CLASSROOM_DLETE(601);

--관리자(MANAGER)의 학생정보(STUDENT_REGISTER) 수정  PRC_STU_REG_MANEDIT
CREATE OR REPLACE PROCEDURE PRC_STU_REG_MANEDIT
(V_STD_COD      IN STUDENT_REGISTER.STUDENT_CODE%TYPE  --(학생코드)
,V_PW           IN STUDENT_REGISTER.PASSWORD%TYPE      --(비밀번호)
,V_NAME         IN STUDENT_REGISTER.NAME%TYPE          --(학생명)
,V_SSN          IN STUDENT_REGISTER.SSN%TYPE           --(주민번호)
,V_REG_DATE     IN STUDENT_REGISTER.REGISTER_DATE%TYPE --(가입일자)
)
IS    
    STD_COD_ERROR   EXCEPTION;
BEGIN     
    IF SQL%NOTFOUND
        THEN RAISE STD_COD_ERROR;
    END IF;
    
    --UPDATE
    UPDATE STUDENT_REGISTER
    SET PASSWORD = V_PW,  NAME =  V_NAME  , SSN = V_SSN
    , REGISTER_DATE = V_REG_DATE
    WHERE STUDENT_CODE = V_STD_COD;
    
    EXCEPTION
        WHEN STD_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20104, '유효한 회원이 아닙니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE PRC_SUB_MANEDIT
( V_SUB_COD    IN SUBJECT.SUBJECT_CODE%TYPE
, V_SUB_NAME   IN SUBJECT.SUBJECT_NAME%TYPE
)
IS
    TEMP_SUB_COD    NUMBER;
    
    SUB_COD_ERROR   EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_SUB_COD
      FROM SUBJECT
     WHERE SUBJECT_CODE = V_SUB_COD;
     
    IF(TEMP_SUB_COD = 0)
        THEN RAISE SUB_COD_ERROR;
    END IF;

    --UPDATE
    UPDATE SUBJECT
    SET SUBJECT_NAME = V_SUB_NAME
    WHERE SUBJECT_CODE = V_SUB_COD;  

    
    EXCEPTION
        WHEN SUB_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20300, '유효한 과목이 아닙니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    COMMIT;   
END;


CREATE OR REPLACE PROCEDURE PRC_TEXTBOOK_UPDATE
( V_TXT_COD     IN TEXTBOOK.TEXTBOOK_CODE%TYPE
, V_TXT_NAME     IN TEXTBOOK.TEXTBOOK_NAME%TYPE
, V_PUBLISH         IN TEXTBOOK.PUBLISHER%TYPE
)
IS
    TEMP_TXT_COD    NUMBER;
    
    TXT_COD_ERROR   EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_TXT_COD
      FROM TEXTBOOK
     WHERE TEXTBOOK_CODE = V_TXT_COD;
     
    IF (TEMP_TXT_COD = 0)
        THEN RAISE TXT_COD_ERROR;
    END IF;
    
    UPDATE TEXTBOOK
       SET TEXTBOOK_NAME = V_TXT_NAME
         , PUBLISHER = V_PUBLISH
     WHERE TEXTBOOK_CODE = V_TXT_COD;
     
     EXCEPTION
        WHEN TXT_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20307, '유효한 교재가 아닙니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
     
    COMMIT;

END;

EXEC PRC_TEXTBOOK_UPDATE(4, '자바첫걸음', NULL);
-- 1	자바첫걸음	
SELECT *
  FROM TEXTBOOK;

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOK_DELETE
(V_TEXTBOOK_CODE    IN TEXTBOOK.TEXTBOOK_CODE%TYPE
)
IS 
BEGIN
    DELETE
    FROM TEXTBOOK
    WHERE TEXTBOOK_CODE = V_TEXTBOOK_CODE;
     
    COMMIT;
END;

PRC_TEXTBOOK_DELETE('1');

SELECT *
  FROM TEXTBOOK;

-- 과정코드로 과정명 수정
CREATE OR REPLACE PROCEDURE PRC_COURSE_UPDATE
( V_COU_COD     IN COURSE.COURSE_CODE%TYPE
, V_COU_NAME    IN COURSE.COURSE_NAME%TYPE
)
IS
    TEMP_COU_COD    NUMBER;
    
    COU_COD_ERROR   EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_COU_COD
      FROM COURSE
     WHERE COURSE_CODE = V_COU_COD;
     
    IF (TEMP_COU_COD = 0)
        THEN RAISE COU_COD_ERROR;
    END IF;

    UPDATE COURSE
       SET COURSE_NAME = V_COU_NAME
     WHERE COURSE_CODE = V_COU_COD;
     
    EXCEPTION
        WHEN COU_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20201, '유효한 과정이 아닙니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    COMMIT;
END;

EXEC PRC_COURSE_UPDATE(1, '자바만함');

SELECT *
  FROM COURSE;


CREATE OR REPLACE PROCEDURE PRC_OP_COU_UPDATE
( V_OPC_COD         IN COURSE_OPEN.OP_COURSE_CODE%TYPE
, V_COU_COD         IN COURSE_OPEN.COURSE_CODE%TYPE
, V_TC_COD          IN COURSE_OPEN.TEACHER_CODE%TYPE
, V_CLAS_COD        IN COURSE_OPEN.CLASSROOM_CODE%TYPE
, V_SDATE           IN COURSE_OPEN.START_DATE%TYPE
, V_EDATE           IN COURSE_OPEN.END_DATE%TYPE
, V_OPDATE          IN COURSE_OPEN.OPEN_DATE%TYPE 
)
IS
    TEMP_OPC_COD    NUMBER;     -- 임시로 숫자 타입으로 받을거에요
    TEMP_COU_COD    NUMBER;
    TEMP_TC_COD     NUMBER;
    TEMP_CLAS_COD   NUMBER;

    OPC_COD_ERROR   EXCEPTION;  -- 과정코드가 존재하지 않을 경우 -- 이거 에러 때문에 받는거에요
    COU_COD_ERROR   EXCEPTION;  -- 과목코드가 존재하지 않을 경우
    TC_COD_ERROR    EXCEPTION;  -- 교수코드가 존재하지 않을 경우
    CLAS_COD_ERROR  EXCEPTION;  -- 강의실코드가 존재하지 않을 경우
    DATE_ERROR1     EXCEPTION;  -- 날짜가 적합하지 않은 경우 발생하는 에러
BEGIN
    -- 과정코드 존재 확인 -- 이거인데요
    SELECT COUNT(*) INTO TEMP_OPC_COD -- 숫자를 세는거에요 
      FROM COURSE_OPEN          -- COURSE_OPEN 테이블에서
     WHERE OP_COURSE_CODE = V_OPC_COD; -- 입력 받은 값이 존재하면 숫자를 세는 코드인거에요
     -- 그래서 입력한 값이 있다면 COUNT로 1을 하겠죠? 그래서 하면 아마 TEMP_OPC_COD에 숫자가 1들어가니까
    IF (TEMP_OPC_COD = 0)   -- 여기 IF문에 들어가지 않고 지나가는건데 만약 없다면 ! TEMP_OPC_COD에 0이 들어가서 에러가 발생하는 코드입니다!
        THEN RAISE OPC_COD_ERROR;
    END IF;
    
    -- 과목코드 존재확인
    SELECT COUNT(*) INTO TEMP_COU_COD
      FROM COURSE
     WHERE COURSE_CODE = V_COU_COD;
    
    IF(TEMP_COU_COD = 0)
        THEN RAISE COU_COD_ERROR;
    END IF;
    
    -- 교수코드 확인
    SELECT COUNT(*) INTO TEMP_TC_COD
      FROM TEACHER_REGISTER
     WHERE TEACHER_CODE = V_TC_COD;
    
    IF(TEMP_TC_COD = 0)
        THEN RAISE TC_COD_ERROR;
    END IF;
    
    -- 강의실 코드 확인
    SELECT COUNT(*) INTO TEMP_CLAS_COD
      FROM CLASSROOM_REGISTER
     WHERE CLASSROOM_CODE = V_CLAS_COD;
    
    IF(TEMP_CLAS_COD = 0)
        THEN RAISE CLAS_COD_ERROR;
    END IF;
    
    -- 날짜 확인
    IF((V_SDATE > V_EDATE) OR (V_OPDATE > V_EDATE))
        THEN RAISE DATE_ERROR1;
    END IF;

    UPDATE COURSE_OPEN
       SET COURSE_CODE = V_COU_COD, TEACHER_CODE = V_TC_COD
         , CLASSROOM_CODE = V_CLAS_COD
         , START_DATE = V_SDATE, END_DATE = V_EDATE
         , OPEN_DATE = V_OPDATE
     WHERE OP_COURSE_CODE = V_OPC_COD;
     
    COMMIT;
    
    EXCEPTION
        WHEN OPC_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20201, '유효한 과정이 아닙니다.');
            ROLLBACK;
        WHEN COU_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20300, '유효한 과목이 아닙니다.');
        WHEN TC_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20202, '유효한 교수가 아닙니다.');
        WHEN CLAS_COD_ERROR
            THEN RAISE_APPLICATION_ERROR(-20203, '유효한 강의실이 아닙니다.');
        WHEN DATE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20204, '날짜를 확인하세요.');
        WHEN OTHERS
            THEN ROLLBACK;
END;

EXEC PRC_OP_COU_UPDATE('C1', 1, 'A', 101, '2022-07-02', '2021-11-01', '2022-03-17');
-- C1	1		101	2021-07-01	2021-12-31	2022-03-17
SELECT *
  FROM COURSE_OPEN;

SELECT *
  FROM TEACHER_REGISTER;

INSERT INTO TEACHER_REGISTER(TEACHER_CODE, PASSWORD, NAME, SSN, REGISTER_DATE)
VALUES('A', '1234', '김00', '22', '2022-03-01');