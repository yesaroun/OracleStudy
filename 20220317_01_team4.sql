SELECT USER
FROM DUAL;
--==>>TEAM4



--------------------------------------------------------------------------------




-- 2
   -- ����  ������ �� ���Ŀ� ���� �Ұ� (�����³� ����(����) ����) -> ����-�� > 0
   -- ����  ������ �� ������ ���� �Ұ� (�����³� ����(����) ����) -> ����-�� < 0
-- �� COURSE OPEN ���� ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_OP_COU_TC_DELETE
( V_OP_COURSE_CODE     IN COURSE_OPEN.OP_COURSE_CODE%TYPE
)
IS
    V_END_DATE   COURSE_OPEN.END_DATE%TYPE;
    V_TC_CODE   TEACHER_REGISTER.TEACHER_CODE%TYPE;
    V_CHECK_DATE    NUMBER;
    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT END_DATE INTO V_END_DATE
      FROM COURSE_OPEN
     WHERE OP_COURSE_CODE = V_OP_COURSE_CODE;
    
    V_CHECK_DATE := TO_NUMBER(SYSDATE - V_END_DATE);
    -- ���� �Ⱓ�߿� ���� ������ ���� �߻�
    IF (V_CHECK_DATE < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    V_TC_CODE := '�������';
    
    UPDATE COURSE_OPEN
    SET TEACHER_CODE = V_TC_CODE
    WHERE OP_COURSE_CODE = V_OP_COURSE_CODE;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20015,'������ ������ �� �����ϴ�. ������ �����ϼ���.');
             ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
        
    COMMIT;

END;



CREATE OR REPLACE PROCEDURE PRC_OP_COU_TEA_EDIT
( V_OP_COURSE_CODE    IN COURSE_OPEN.OP_COURSE_CODE%TYPE
, V_NEWTEA_CODE       IN COURSE_OPEN.TEACHER_CODE%TYPE  
)
IS 
    V_END_DATE          COURSE_OPEN.END_DATE%TYPE;
    V_CHECK_DATE        NUMBER;
    
     USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT END_DATE INTO V_END_DATE
      FROM COURSE_OPEN
     WHERE COURSE_OPEN.OP_COURSE_CODE = V_OP_COURSE_CODE;

    V_CHECK_DATE := TO_NUMBER(SYSDATE - V_END_DATE);
    
    IF(V_CHECK_DATE > 0 )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE COURSE_OPEN 
    SET  TEACHER_CODE = V_NEWTEA_CODE
    WHERE OP_COURSE_CODE = V_OP_COURSE_CODE;
     -- ���� ����;
        
    EXCEPTION
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20012,'�ش� ������ ���� ������ ������ �� �����ϴ�.');
             ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
        
    COMMIT;
END;

SELECT *
FROM VIEW_CONSTCHECK;

--�� ���̺���ȸ
SELECT *
FROM USER_TABLES;

DESC SUBJECT;

