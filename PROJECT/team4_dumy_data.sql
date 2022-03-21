-- ���� ����
INSERT INTO TEXTBOOK (TEXTBOOK_CODE, TEXTBOOK_NAME)
VALUES (1, '�ڹ�ù����');
INSERT INTO TEXTBOOK (TEXTBOOK_CODE, TEXTBOOK_NAME)
VALUES (2, '�ڹٶڴ�');
INSERT INTO TEXTBOOK (TEXTBOOK_CODE, TEXTBOOK_NAME)
VALUES (3, '�ڹٳ��ٿ�');

SELECT *
FROM TEXTBOOK;

-- ���� ����
INSERT INTO SUBJECT (SUBJECT_CODE, SUBJECT_NAME)
VALUES (1, '�ڹ��ʱ�');
INSERT INTO SUBJECT (SUBJECT_CODE, SUBJECT_NAME)
VALUES (2, '�ڹ��߱�');
INSERT INTO SUBJECT (SUBJECT_CODE, SUBJECT_NAME)
VALUES (3, '�ڹٰ���');

SELECT *
FROM SUBJECT;

-- ���� ����
INSERT INTO COURSE (COURSE_CODE, COURSE_NAME)
VALUES (1, '�ڹٸ���');

SELECT *
FROM COURSE;

-- ���ǽ� ����
INSERT INTO CLASSROOM_REGISTER (CLASSROOM_CODE, CLASSROOM_NAME, CLASSROOM_CAPACITY)
VALUES (101, '101ȣ', 10);
INSERT INTO CLASSROOM_REGISTER (CLASSROOM_CODE, CLASSROOM_NAME, CLASSROOM_CAPACITY)
VALUES (201, '201ȣ', 20);
INSERT INTO CLASSROOM_REGISTER (CLASSROOM_CODE, CLASSROOM_NAME, CLASSROOM_CAPACITY)
VALUES (301, '301ȣ', 30);

SELECT *
FROM CLASSROOM_REGISTER;

-- �������� ����
INSERT INTO COURSE_OPEN (OP_COURSE_CODE, COURSE_CODE, CLASSROOM_CODE, START_DATE, END_DATE)
VALUES ('C1', 1, 101, TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'));
INSERT INTO COURSE_OPEN (OP_COURSE_CODE, COURSE_CODE, CLASSROOM_CODE, START_DATE, END_DATE)
VALUES ('C2', 1, 201, TO_DATE('2021-09-01', 'YYYY-MM-DD'), TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO COURSE_OPEN (OP_COURSE_CODE, COURSE_CODE, CLASSROOM_CODE, START_DATE, END_DATE)
VALUES ('C3', 1, 301, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'));

SELECT *
FROM COURSE_OPEN;

-- ���񰳼� ����
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C1S1', 1, 1, 'C1', TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-08-31', 'YYYY-MM-DD'), 30, 40, 30);
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C1S2', 2, 2, 'C1', TO_DATE('2021-09-01', 'YYYY-MM-DD'), TO_DATE('2021-10-31', 'YYYY-MM-DD'), 20, 30, 50);
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C1S3', 3, 3, 'C1', TO_DATE('2021-11-01', 'YYYY-MM-DD'), TO_DATE('2021-12-30', 'YYYY-MM-DD'), 70, 10, 20);

INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C2S1', 1, 1, 'C2', TO_DATE('2021-09-01', 'YYYY-MM-DD'), TO_DATE('2021-09-30', 'YYYY-MM-DD'), 30, 40, 30);
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C2S2', 2, 2, 'C2', TO_DATE('2021-10-01', 'YYYY-MM-DD'), TO_DATE('2021-11-30', 'YYYY-MM-DD'), 20, 30, 50);
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C2S3', 3, 3, 'C2', TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'), 70, 10, 20);

INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C3S1', 1, 1, 'C3', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'), 30, 40, 30);
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C3S2', 2, 2, 'C3', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-04-30', 'YYYY-MM-DD'), 20, 30, 50);
INSERT INTO SUBJECT_OPEN (OP_SUBJECT_CODE, SUBJECT_CODE, TEXTBOOK_CODE, OP_COURSE_CODE, START_DATE, END_DATE, ATTENDANCE_RATE, WRITING_RATE, PERFORMANCE_RATE)
VALUES ('C3S3', 3, 3, 'C3', TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), 70, 10, 20);

SELECT *
FROM SUBJECT_OPEN;

-- �л� ����
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD001', '1234', '�����', 9203271234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD002', '1234', '�����', 9505012234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD003', '1234', '�����', 9705031234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD004', '1234', '�����', 9908012234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD005', '1234', '�����', 9102031234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD006', '1234', '�����', 9808182234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD007', '1234', '���ĥ', 9909091234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD008', '1234', '�����', 9403042234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD009', '1234', '�����', 9202011234567);
INSERT INTO STUDENT_REGISTER (STUDENT_CODE, PASSWORD, NAME, SSN)
VALUES ('STD010', '1234', '�����', 9712242234567);

SELECT *
FROM STUDENT_REGISTER;

-- ������û ����
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC11', 'C1', 'STD001');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC12', 'C1', 'STD002');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC13', 'C1', 'STD003');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC21', 'C2', 'STD004');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC22', 'C2', 'STD005');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC23', 'C2', 'STD006');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC31', 'C3', 'STD007');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC32', 'C3', 'STD008');
INSERT INTO COURSE_REGISTER (REG_COURSE_CODE, OP_COURSE_CODE, STUDENT_CODE)
VALUES ('CRC33', 'C3', 'STD009');

SELECT *
FROM COURSE_REGISTER;

select *
  from score_input;

-- ���� �Է�
-- C1 ���ΰ��� �� �л� ����
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S1_001', 'C1S1', 'CRC11', 70, 60, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S1_002', 'C1S1', 'CRC12', 20, 80, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S1_003', 'C1S1', 'CRC13', 90, 80, 90);

INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S2_001', 'C1S2', 'CRC11', 20, 50, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S2_002', 'C1S2', 'CRC12', 50, 80, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S2_003', 'C1S2', 'CRC13', 60, 80, 90);

INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S3_001', 'C1S3', 'CRC11', 70, 40, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S3_002', 'C1S3', 'CRC12', 20, 20, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C1S3_003', 'C1S3', 'CRC13', 90, 30, 90);

-- C2 ���ΰ��� �� �л� ���� ����
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C2S1_001', 'C2S1', 'CRC21', 70, 60, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C2S1_002', 'C2S1', 'CRC22', 20, 80, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C2S1_003', 'C2S1', 'CRC23', 90, 80, 90);

INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C2S2_001', 'C2S2', 'CRC21', 20, 50, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C2S2_002', 'C2S2', 'CRC22', 50, 80, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C2S2_003', 'C2S2', 'CRC23', 60, 80, 90);

INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C3S3_001', 'C3S3', 'CRC21', 70, 40, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C3S3_002', 'C3S3', 'CRC22', 20, 20, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C3S3_003', 'C3S3', 'CRC23', 90, 30, 90);

-- C3 ���ΰ��� C3S1. �� �л� ���� ����
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C3S1_001', 'C3S1', 'CRC31', 70, 60, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C3S1_002', 'C3S1', 'CRC32', 20, 80, 50);
INSERT INTO SCORE_INPUT (SCORE_CODE, OP_SUBJECT_CODE, REG_COURSE_CODE, ATTENDANCE_SCORE, WRITING_SCORE, PERFORMANCE_SCORE)
VALUES ('C3S1_003', 'C3S1', 'CRC33', 90, 80, 90);

SELECT *
FROM SCORE_INPUT;


-- �ߵ�Ż��
INSERT INTO STUDENT_DROP (DROP_CODE, REG_COURSE_CODE) 
VALUES ('D1', 'CRC32');

SELECT *
FROM STUDENT_DROP;

commit;