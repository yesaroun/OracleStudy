-- 1
-- ○ COURSE_OPEN에 OP_COU_TEA_CODE_NN의 NOT NULL 제거
ALTER TABLE COURSE_OPEN 
DROP CONSTRAINT OP_COU_TEA_CODE_NN;


-- 2
-- 과정코드로 과정명 수정
CREATE OR REPLACE PROCEDURE PRC_COURSE_UPDATE
( V_COURSE_CODE     IN COURSE.COURSE_CODE%TYPE
, V_COURSE_NAME     IN COURSE.COURSE_NAME%TYPE
)
IS
BEGIN
    UPDATE COURSE
       SET COURSE_NAME = V_COURSE_NAME
     WHERE COURSE_CODE = V_COURSE_CODE;
    
    COMMIT;
END;

EXEC PRC_COURSE_UPDATE(1, '자바만함');

SELECT *
  FROM COURSE;