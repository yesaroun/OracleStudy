SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "COL1"                    -- 48.678
     , ROUND(48.678, 2) "COL2"          -- 48.68 (�� ��° �Ķ���� ���� ��ȿ�� ǥ���̴�)
     , ROUND(48.674, 2) "COL3"          -- 48.67
     , ROUND(48.674, 1) "COL4"          -- 48.7
     , ROUND(48.674, 0) "COL5"          -- 49
     , ROUND(48.674) "COL6"             -- 49    -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
     , ROUND(48.674, -1) "COL7"         -- 50
     , ROUND(68.674, -2) "COL8"         -- 100
     , ROUND(48.674, -3) "COL9"         -- 0
FROM DUAL;
--==>> 48.678	46.68	46.67	46.7	47	47	50	0	0

--�� TRUNC() ������ ó���� �ִ� �Լ�
SELECT 48.678 "COL1"                    -- 48.678
     , TRUNC(48.678, 2) "COL2"          -- 48.67 (�� ��° �Ķ���� ���� ��ȿ�� ǥ���̴�)
     , TRUNC(48.674, 2) "COL3"          -- 48.67
     , TRUNC(48.674, 1) "COL4"          -- 48.6
     , TRUNC(48.674, 0) "COL5"          -- 48
     , TRUNC(48.674) "COL6"             -- 48    -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
     , TRUNC(48.674, -1) "COL7"         -- 40
     , TRUNC(68.674, -2) "COL8"         -- 0
     , TRUNC(48.674, -3) "COL9"         -- 0
FROM DUAL;


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5, 2) "RESULT"
FROM DUAL;
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ


--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5, 3) "RESULT"
FROM DUAL;
--==>> 125
-- 5�� 3���� ��������� ��ȯ


--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2) "RESULT"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2�� ���� ����� ��ȯ


--�� LOG() �α� �Լ�
--  (����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α�, �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10, 100) "COL1"
     , LOG(10, 20) "COL2"
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--�� �ﰢ�Լ�
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/
--> ���� ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.


--�� �ﰢ�Լ��� ���Ҽ�(���� : -1 ~ 1)
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>> 0.52359877559829887307710723054658381405	
--     1.04719755119659774615421446109316762805	
--     0.4636476090008061162142562314612144020295
--> ���� �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.


--�� SIGN() ����, ��ȣ, Ư¡
--> ���� ������� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2) "COL1"
     , SIGN(5-5) "COL2"
     , SIGN(5-8) "COL3"
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� ���ȴ�.


--�� ASCII(), CHR() �� ���� ����(����)�ϴ� �Լ�
SELECT ASCII('A') "COL1"
        , CHR(65) "COL2"
FROM DUAL;
--==>> 65   A
--> ��ASCII()�� : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--  ��CHR()��   : �Ű������� �Ѱܹ��� �ƽ�Ű�ڵ� ������ �ش� ���ڸ� ��ȯ�Ѵ�.


--------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ ������ �⺻ ������ DAY(�ϼ�) �̴�~!!!
SELECT SYSDATE "COL1"           -- 2022-02-22 09:44:04
     , SYSDATE + 1 "COL2"       -- 2022-02-23 09:44:04  �� �Ϸ� ��
     , SYSDATE - 2 "COL3"       -- 2022-02-20 09:44:04  �� ��Ʋ ��
     , SYSDATE - 30 "COL4"      -- 2022-01-23 09:44:04  �� 30�� ��
FROM DUAL;
    

--�� �ð� ���� ����
SELECT SYSDATE "COL1"           -- 2022-02-22 09:46:21
     , SYSDATE + 1/24 "COL2"    -- 2022-02-22 10:46:21  �� �� �ð� ��
     , SYSDATE - 2/24 "COL3"    -- 2022-02-22 07:46:21  �� �� �ð� ��
FROM DUAL;


--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�ϴ� �������� �����Ѵ�.
/*
--------------------  --------------------
 ����ð�               ���� �� �ð�
--------------------  --------------------
2022-02-22 10:03:21   2022-02-23 12:05:27
*/
SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + 2/24 + 3/(24*60) + 4/(24*60*60) "���� �� �ð�"
FROM DUAL;
--==>>
/*
--------------------  --------------------
 ����ð�               ���� �� �ð�
--------------------  --------------------
2022-02-22 10:05:36   2022-02-23 12:08:40
*/

-- ��� 1.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;
--==>> 2022-02-22 10:17:37	
--     2022-02-23 12:20:41


-- ��� 2
SELECT SYSDATE "���� �ð�"
     , SYSDATE + ((1*24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "���� �� �ð�"
FROM DUAL;
--==>> 2022-02-22 10:19:20	
--     2022-02-23 12:22:24


--�� ��¥ - ��¥ = �ϼ�
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') - TO_DATE('2022-02-22', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 118


--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 2022-06-20 00:00:00

SELECT TO_DATE('2022-06-35', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> ���� �߻�
--     ORA-01847: day of month must be between 1 and last day of month

SELECT TO_DATE('2022-02-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> ���� �߻�
--     ORA-01839: date not valid for month specified

SELECT TO_DATE('2022-13-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> ���� �߻�
--     ORA-01843: not a valid month


--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� �����ϴ� ��������
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������.


--�� ADD_MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE "COL1"
     , ADD_MONTHS(SYSDATE, 2) "COL2"
     , ADD_MONTHS(SYSDATE, 3) "COL3"
     , ADD_MONTHS(SYSDATE, -2) "COL4"
     , ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
--==>>
/*
2022-02-22 10:30:04	    �� ����
2022-04-22 10:30:04	    �� 2���� ��
2022-05-22 10:30:04	    �� 3���� ��
2021-12-22 10:30:04	    �� 2���� ��
2021-11-22 10:30:04     �� 3���� ��
*/
--> ���� ���ϰ� ����


--�� MONTHS_BETWEEN()
--   ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ�Ѵ�.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "RESULT"
FROM DUAL;
--==>> 236.723857526881720430107526881720430108

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--  ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
--  ù ��° ���ڰ��� �ش��ϴ� ��¥����
--  �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.


--�� NEXT_DAY()
SELECT NEXT_DAY(SYSDATE, '��') "COL1"        -- ���ƿ��� ���� ���� ����� ����
     , NEXT_DAY(SYSDATE, '��') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:38:22	
--     2022-02-28 10:38:22


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>>Session��(��) ����Ǿ����ϴ�.

-- ����� �ٲٰ� �ѱ� ���ϸ� ������

SELECT NEXT_DAY(SYSDATE, '��') "COL1"        
     , NEXT_DAY(SYSDATE, '��') "COL2"
FROM DUAL;
--==>> ���� �߻�
--     ORA-01846: not a valid day of the week

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"       
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:38:22	
--     2022-02-28 10:38:22
-- (�̷��� �ϸ� ���� �ȳ�)


--�� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"       
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> ���� �߻�
--     ORA-01846: not a valid day of the week

SELECT NEXT_DAY(SYSDATE, '��') "COL1"        
     , NEXT_DAY(SYSDATE, '��') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:42:31	2022-02-28 10:42:31


--�� LAST_DAY()
-->  �ش� ��¥�� ���ԵǾ��ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE) "COL1"
     , LAST_DAY(TO_DATE('2020-02-10', 'YYYY-MM-DD')) "COL2"
     , LAST_DAY(TO_DATE('2019-02-10', 'YYYY-MM-DD')) "COL3"
FROM DUAL;
--==>>
/*
2022-02-28 10:44:54	
2020-02-29 00:00:00	
2019-02-28 00:00:00
*/

--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���úη�... ��Ⱑ ���뿡�� �ٽ� ����(?)����...
--   �����Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.
SELECT ADD_MONTHS(SYSDATE, 22)
FROM DUAL;
--==>> 2023-12-22

-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �Ѵٰ� �����ϸ�
--    ��Ⱑ �� ���� �Ծ�� ���� �����ٱ�...

--    �����Ⱓ * 3
--    --------
--   (�������� - ��������)

--   (�������� - ��������) * 3
SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3 "��"
FROM DUAL;
--==>> 2004


--�� ���� ��¥ �� �ð����κ���...
--   ������(2022-06-20 18:00:00) ����
--   ���� �Ⱓ��... ������ ���� ���·� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�                |  ������              | ��     | �ð� | ��    | ��
--------------------------------------------------------------------------------
2022-02-22 11:34:35     | 2022-06-20 18:00:00 | 117     | 7    | 15    | 15 
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE "����ð�"       -- �� Ǯ��
     , TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1 "��"
     
     , TRUNC((TO_DATE('2022-06-20 18', 'YYYY-MM-DD HH24') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24) "�ð�"
     
     , TRUNC((((TO_DATE('2022-06-20 18:00', 'YYYY-MM-DD HH24:MI') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24)
     - TRUNC((TO_DATE('2022-06-20 18', 'YYYY-MM-DD HH24') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24)) * 60) "��"
     
     , ROUND((((((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24)
     - TRUNC((TO_DATE('2022-06-20 18', 'YYYY-MM-DD HH24') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24)) * 60) 
     - TRUNC((((TO_DATE('2022-06-20 18:00', 'YYYY-MM-DD HH24:MI') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24)
     - TRUNC((TO_DATE('2022-06-20 18', 'YYYY-MM-DD HH24') - SYSDATE - (TRUNC(TO_DATE('2022-06-20', 'YYYY-MM-DD') - SYSDATE)+1)) * 24)) * 60)) * 60) "��"
FROM DUAL;

--��1�� 2�ð� 3�� 4�ʡ���... ���ʡ��� ȯ���ϸ�...
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

--��93784�ʡ���... �ٽ� ���� �ð� �� �ʡ��� ȯ���ϸ�...
SELECT TRUNC(TRUNC(TRUNC(93784/60) / 60) / 24) "��" 
     , MOD(TRUNC(TRUNC(93784/60) / 60), 24) "�ð�"
     , MOD(TRUNC(93784/60), 60) "��"
     , MOD(93784, 60) "��"
FROM DUAL;
--==>> 1	2	3	4


-- �����ϱ��� ���� �Ⱓ Ȯ�� (���� : �ϼ�)
SELECT �������� - ���� ����
FROM DUAL;

SELECT TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 118.132719907407407407407407407407407407

-- �����ϱ��� ���� �Ⱓ Ȯ�� (���� : ��)
SELECT (TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 10205664.99999999999999999999999999999998

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60) / 60) / 24) "��" 
     , MOD(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60) / 60), 24) "�ð�"
     , MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "��"
     , TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "��"
FROM DUAL;

SELECT SYSDATE "����ð�"
     , TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60) / 60) / 24) "��" 
     , MOD(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60) / 60), 24) "�ð�"
     , MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "��"
     , TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "��"
FROM DUAL;
--==>> 2022-02-22 15:08:41	    2022-06-20 18:00:00	    118	    2	    51	    18







--�� ���� �¾ ��¥ �� �ð����κ���... �������
--   �󸶸�ŭ�� �ð��� ��� �ִ���...
--   ������ ���� ���·� ��ȸ�� �� �ֵ��� �������� �ۼ��Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�                |  �������            | ��     | �ð� | ��    | ��
--------------------------------------------------------------------------------
2022-02-22 11:34:35     | 1997-07-01 12:00:00 | 117     | 7    | 15    | 15 
--------------------------------------------------------------------------------
*/
SELECT (SYSDATE - TO_DATE('1997-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)
FROM DUAL;

SELECT SYSDATE "����ð�"
     , TO_DATE('1997-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS') "�������"
     , TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE('1997-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)) /60) /60) /24) "��"
     , MOD(TRUNC(TRUNC(((SYSDATE - TO_DATE('1997-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)) / 60)/60), 24) "��"
     , MOD(TRUNC((SYSDATE - TO_DATE('1997-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60) / 60), 60)  "��"
     , TRUNC(MOD((SYSDATE - TO_DATE('1997-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60), 60)) "��"
FROM DUAL;


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ �����͸� ������� �ݿø�, ���� ���� ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "COL1"                   -- 2022-02-22   �� �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "COL2"    -- 2022-01-01   �� �⵵���� ��ȿ�� ������(��ݱ�/�Ϲݱ� ����)
     , ROUND(SYSDATE, 'MONTH') "COL3"   -- 2022-03-01   �� ������ ��ȿ�� ������ (15�� ����)
     , ROUND(SYSDATE, 'DD') "COL4"      -- 2022-02-23   �� �ϱ��� ��ȿ�� ������ (���� ����)
     , ROUND(SYSDATE, 'DAY') "COL5"     -- 2022-02-20   �� �ϱ��� ������ ������ (������ ���� ����)
FROM DUAL;


--�� ��¥ ����
SELECT SYSDATE "COL1"                   -- 2022-02-22   �� �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "COL2"    -- 2022-01-01   �� �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "COL3"   -- 2022-02-01   �� ������ ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'DD') "COL4"      -- 2022-02-22   �� �ϱ��� ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'DAY') "COL5"     -- 2022-02-20   �� �� �� �ֿ� �ش��ϴ� �Ͽ���
FROM DUAL;


--------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()    : ���� �����͸� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER()  : ���� �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���...
--   �������� ���� ������ �����Ͽ� ����� �� �ִ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--�� ��¥�� �� ������
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"        -- 2022-02-22 (�̰� ��������)
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"              -- 2022   
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"              -- TWENTY TWENTY-TWO
     , TO_CHAR(SYSDATE, 'MM') "COL4"                -- 02
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"             -- 2��
     , TO_CHAR(SYSDATE, 'MON') "COL6"               -- 2��
     , TO_CHAR(SYSDATE, 'DD') "COL7"                -- 22
     , TO_CHAR(SYSDATE, 'MM-DD') "COL8"             -- 02-22
     , TO_CHAR(SYSDATE, 'DAY') "COL9"               -- ȭ����
     , TO_CHAR(SYSDATE, 'DY') "COL10"               -- ȭ
     , TO_CHAR(SYSDATE, 'HH24') "COL11"             -- 16
     , TO_CHAR(SYSDATE, 'HH') "COL12"               -- 04
     , TO_CHAR(SYSDATE, 'HH AM') "COL13"            -- 04 ����      -- AM�̶�� �����ٰ� �������� ����°� �ƴ϶� ���� ����
     , TO_CHAR(SYSDATE, 'HH PM') "COL14"            -- 04 ����
     , TO_CHAR(SYSDATE, 'MI') "COL15"               -- 19
     , TO_CHAR(SYSDATE, 'SS') "COL16"               -- 45
     , TO_CHAR(SYSDATE, 'SSSSS') "COL17"           -- 59369         -- ���� ��¥�� �������� ���ݱ��� �귯�� ��ü ��
     , TO_CHAR(SYSDATE, 'Q') "COL18"                -- 1
FROM DUAL;                                          -- �� ������

SELECT 7 "COL1"             -- ���� ���� ����
     , '7' "COL2"           -- ���� ���� ����
     , TO_CHAR(7) "COL3"    -- ���� ����
FROM DUAL;
--> ��ȸ ����� ���� �������� ���� �������� Ȯ��~!!!

SELECT '4' "COL1"
     , TO_NUMBER('4') "COL2"
     , 4 "COL3"
     , TO_NUMBER('04') "COL4"
FROM DUAL;
--==>> 4	4	4	4


SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) "RESULT"
FROM DUAL;
--==>> 2022


--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1"      -- 2022(������)    �� ������ �����Ͽ� ���� Ÿ������ ��ȯ
     , TO_CHAR(SYSDATE, 'MM') "COL2"        -- 02(������)      �� ���� �����Ͽ� ���� Ÿ������ ��ȯ
     , TO_CHAR(SYSDATE, 'DD') "COL3"        -- 22(������)      �� ���� �����Ͽ� ���� Ÿ������ ��ȯ
     , EXTRACT(YEAR FROM SYSDATE) "COL4"    -- 2022(������)    �� ������ �����Ͽ� ���� Ÿ������ ��ȯ
     , EXTRACT(MONTH FROM SYSDATE) "COL5"   -- 2 (������)      �� ���� �����Ͽ� ���� Ÿ������ ��ȯ
     , EXTRACT(DAY FROM SYSDATE) "COL6"     -- 22 (������)     �� ���� �����Ͽ� ���� Ÿ������ ��ȯ
FROM DUAL;
--> ��, ��, �� �̿��� �ٸ� �׸��� �Ұ�~!!


--�� TO_CHAR() �׸� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "COL1"
     , TO_CHAR(60000, '99,999') "COL2"
     , TO_CHAR(60000, '$99,999') "COL3"
     , TO_CHAR(60000, 'L99,999') "COL4"           -- (�̰Ŵ� �⺻ ��ȭ���� �ܼ��� ���� Ư�� ��ȣ�� ǥ������ �ʴ� ��ȣ�� ���ؼ� ������ ���� Ȯ���ص�)
     , LTRIM(TO_CHAR(60000, 'L99,999')) "RESULT"  -- �̷��� �ϸ� ���� ���� �� ����
FROM DUAL; -- �̰� ������ �� ���� ������


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>> 2022-02-22 16:48:13	
--     2022-02-23 18:51:17

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
--   TO_YMINTERVL(), TO_DSINTERVAL()       -- (�տ��� ��, �� �ڿ��� �� �� ���� �Լ�)

SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� �ð�"     -- (�Ű������� ����Ÿ����)
FROM DUAL;
--==>>
/*
2022-02-22 17:04:53	
2023-04-25 21:09:59
*/


--------------------------------------------------------------------------------


--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2�� �����' END
FROM DUAL;
--==>> 5+2�� �����

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2=6' END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '�� ��� �Ⱦ�'
                END "RESULT"
FROM DUAL;
--==>> 1+1=2

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 2 THEN '1+1=4'
                ELSE '�� ��� �Ⱦ�'
                END "RESULT"
FROM DUAL;
--==>> 1+1=2        -- �̰� �ѹ� ������ �ٸ��� Ȯ�� ����


SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-3=2 THEN '6-3=2'
            WHEN 7*1=8 THEN '7*1=8'
            WHEN 6/2=3 THEN '6/2=3'
            ELSE '�𸣰ڳ�'
        END "RESULT"
FROM DUAL;                              -- ��Ȳ�� �ٸ� ��� TRUE�� ��ȯ�ϸ�ȴ�.
--==>> 6/2=3


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� �����') "RESULT"     -- DECODE �Լ��� �Ķ���� ������ ����
FROM DUAL;
--==>> 5-2=3


--�� CASE WHEN THEN ELSE END(���ǹ�, �б⹮) Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5�� 2�� �� �Ұ�'
        END "RESULT"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN F OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN F OR T AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T AND T THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;
--==>> ��������


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T AND T THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;
--==>> ��������

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN 3<1 AND (F OR T) AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN F AND T AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN F THEN '��������'
            WHEN F AND F THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;
--==>> ��������

--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;


--�� TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸��� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
--   �����ȣ, �����, �ֹι�ȣ, ����, �Ի���
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE  WHEN TO_NUMBER(SUBSTR(JUBUN, 7,1))=1 OR TO_NUMBER(SUBSTR(JUBUN, 7,1))=3 THEN '��'
             WHEN TO_NUMBER(SUBSTR(JUBUN, 7,1))=2 OR TO_NUMBER(SUBSTR(JUBUN, 7,1))=4 THEN '��'
             ELSE '�� �� ����'
        END "����"
     , HIREDATE "�Ի���"
FROM TBL_SAWON;


SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE  WHEN SUBSTR(JUBUN, 7,1)='1' OR SUBSTR(JUBUN, 7,1)='3' THEN '��'
             WHEN SUBSTR(JUBUN, 7,1)='2' OR SUBSTR(JUBUN, 7,1)='4' THEN '��'
             ELSE '�� �� ����'
        END "����"
     , HIREDATE "�Ի���"
FROM TBL_SAWON;



