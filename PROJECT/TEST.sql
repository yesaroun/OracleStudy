

EXEC PRC_OP_COU_UPDATE('C1',1,'T0001',101,'2021-10-10','2022-12-31',SYSDATE);

SELECT *
FROM COURSE_OPEN;
/*
C1	1		101	2021-07-01	2021-12-31	2022-03-20
C2	1		201	2021-09-01	2022-03-01	2022-03-20
C3	1		301	2022-01-01	2022-06-30	2022-03-20
*/

SELECT *
  FROM TEACHER_REGISTER;
--==>>
/*
T0001	1234	�豳��	9909091234567	2022-03-20
T0002	2345678	�ڱ���	6501012345678	2022-03-20
*/

-- �������� ����
EXEC TEACHER_REGISTER_TC_UPDATE('T0001', '1234', '4567', '�̱���', '9707011234567');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
  FROM TEACHER_REGISTER;
--==>>
/*
T0001	4567	�̱���	9707011234567	2022-03-20
T0002	2345678	�ڱ���	6501012345678	2022-03-20
*/

-- �߸��� ���� ID�Է�
EXEC TEACHER_REGISTER_TC_UPDATE('T0005', '1234', '4567', '�̱���', '9707011234567');
--==>> ORA-20202: ��ȿ�� ������ �ƴմϴ�.

-- �߸��� ��й�ȣ �Է�
EXEC TEACHER_REGISTER_TC_UPDATE('T0001', '5648', '4567', '�̱���', '9707011234567');
--==>> ORA-20103: ���̵�, ��й�ȣ�� ��ġ���� �ʽ��ϴ�


------

SELECT *
  FROM STUDENT_REGISTER;
--==>>
/*
S0001	1234	�����	9203271234567	2022-03-20
S0002	1234	�����	9505012234567	2022-03-20
S0003	1234	�����	9705031234567	2022-03-20
S0004	1234	�����	9908012234567	2022-03-20
S0005	1234	�����	9102031234567	2022-03-20
S0006	1234	�����	9808182234567	2022-03-20
S0007	1234	���ĥ	9909091234567	2022-03-20
S0008	1234	�����	9403042234567	2022-03-20
S0009	1234	�����	9202011234567	2022-03-20
S0010	1234	�����	9712242234567	2022-03-20
*/

EXEC PRC_STD_INSERT('�̰���', '9707011234567');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
  FROM STUDENT_REGISTER;
--==>>
/*
S0001	1234	�����	9203271234567	2022-03-20
S0002	1234	�����	9505012234567	2022-03-20
S0003	1234	�����	9705031234567	2022-03-20
S0004	1234	�����	9908012234567	2022-03-20
S0005	1234	�����	9102031234567	2022-03-20
S0006	1234	�����	9808182234567	2022-03-20
S0007	1234	���ĥ	9909091234567	2022-03-20
S0008	1234	�����	9403042234567	2022-03-20
S0009	1234	�����	9202011234567	2022-03-20
S0010	1234	�����	9712242234567	2022-03-20
S0011	1234567	�̰���	9707011234567	2022-03-20
*/







