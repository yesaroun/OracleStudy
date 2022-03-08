SELECT USER
FROM DUAL;
--==>> SCOTT

--�� IF��(���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL�� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE�̸� THEN�� ELSE ������ ������ �����ϰ�
--    FALSE �� NULL �̸� ELSE �� END IF; ������ ������ �����ϰ� �ȴ�.

-- 2. ���� �� ����
/*
IF ����
    THEN ó����;
END IF;
*/

/*
IF ����
    THEN ó����;
ELSE
    ó����;
END IF;
*/

/*
IF ����
    THEN ó����;
ELSIF ����
    THEN ó����;
ELSIF ����
    THEN ó����;
ELSE
    ó����;
END IF;
*/

-- (�̰� �ؾ� ����� ����)
SET SERVEROUTPUT ON;

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'C'
        THEN DBMS_OUTPUT.PUT_LINE('COOL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;


--�� CASE ��(���ǹ�)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1 THEN ���๮;
    WHEN ��2 THEN ���๮;
    ELSE ���๮;
END CASE;
*/

ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';
--(���⼭ NUM���� ������ ���� ���� PLSQL�� �������°� &NUM)

DECLARE
    -- �ֿ� ���� ����
    SEL NUMBER := &NUM;
    RESULT VARCHAR2(10) := '����';
BEGIN
    -- �׽�Ʈ
    --DBMS_OUTPUT.PUT_LINE('SEL : ' || SEL);
    --DBMS_OUTPUT.PUT_LINE('RESULT : ' || RESULT);
    
    -- ���� �� ó��
    /*
    CASE SEL
        WHEN 1
        THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
        WHEN 2
        THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
    END CASE;
    */
    
    CASE SEL
        WHEN 1
        THEN RESULT := '����';
        WHEN 2
        THEN RESULT := '����';
        ELSE
            RESULT := 'Ȯ�κҰ�';
    END CASE;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE('ó�� ����� ' || RESULT || '�Դϴ�.');
    
END;

--�� �ܺ� �Է� ó��
-- ACCEPT ����
-- ACCEPT ������ PROMPT '�޼���';
--> �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
--  ��&�ܺκ����� ���·� �����ϰ� �ȴ�.

--�� ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���.';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���.';

DECLARE
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    
    TOTAL NUMBER := 0;
BEGIN
    -- �׽�Ʈ
    --DBMS_OUTPUT.PUT_LINE('NUM1 : ' || NUM1);
    --DBMS_OUTPUT.PUT_LINE('NUM2 : ' || NUM2);
    
    -- ���� �� ó��
    TOTAL := NUM1 + NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' ||TOTAL);
    
END;
--==>> 25 + 47 = 72


--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
-- ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� �ݾ� �Է� : 990

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4
*/

-- �� Ǯ��
ACCEPT A PROMPT '�ݾ� �Է�';

DECLARE
    MONEY NUMBER := &A;
    AN NUMBER := &A;
    
    C500 NUMBER := 0;
    C100 NUMBER := 0;
    C50 NUMBER := 0;
    C10 NUMBER := 0;
    
BEGIN
    IF TRUNC(AN/500) > 0
        THEN C500 := TRUNC(AN/500);
    END IF;
    
    IF TRUNC(AN/500) > 0
        THEN AN := AN - C500*500;
    END IF;
    
    IF TRUNC(AN/100) > 0
        THEN C100 := TRUNC(AN/100);
    END IF;
    
    IF TRUNC(AN/100) > 0
        THEN AN := AN - C100*100;
    END IF;
    
    IF TRUNC(AN/50) > 0
        THEN C50 := TRUNC(AN/50);
    END IF;
    
    IF TRUNC(AN/50) > 0
        THEN AN := AN - C50*50;
    END IF;
    
    IF TRUNC(AN/10) > 0
        THEN C10 := TRUNC(AN/10);
    END IF;
    
    IF TRUNC(AN/10) > 0
        THEN AN := AN - C10*10;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ��� �Ѿ� : ' || MONEY);
    DBMS_OUTPUT.PUT_LINE('500�� : ' || C500 || ' ��, 100�� : ' || C100 || ' ��, 50�� : ' || C50 || ' ��, 10�� : ' || C10 || ' ��');
    
END;


-- Ǯ��

ACCEPT INPUT PROMPT '�ݾ� �Է�';
DECLARE
    --�� �ֿ� ���� ����
    MONEY   NUMBER := &INPUT;       -- ������ ���� �Է°��� ��Ƶ� ����
    MONEY2  NUMBER := &INPUT;       -- ��� ����� ���� �Է°��� ��Ƶ� ����
                                    -- (MONEY ������ ������ ó���ϴ� �������� ���� ���ϱ� ������...)
        
    M500    NUMBER;                 -- 500�� ¥�� ������ ��Ƶ� ����         
    M100    NUMBER;                 -- 100�� ¥�� ������ ��Ƶ� ����  
    M50     NUMBER;                 --  50�� ¥�� ������ ��Ƶ� ����  
    M10     NUMBER;                 --  10�� ¥�� ������ ��Ƶ� ����  
BEGIN
    --�� ���� �� ó��
    -- MONEY�� 500���� ������ ���� ���ϰ� �������� ������. -- 500���� ����
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY�� 500���� ������ ���� ������ �������� ���Ѵ�. �� 500���� ���� Ȯ���ϰ� ���� �ݾ�
    MONEY := MOD(MONEY, 500);
    
    -- MONEY�� 100���� ������ ���� ���ϰ� �������� ������. �� 100���� ����
    M100 := TRUNC(MONEY / 100);
    
    -- MONEY�� 100���� ������ ���� ������ �������� ���Ѵ�. �� 100���� ���� Ȯ���ϰ� ���� �ݾ�
    MONEY := MOD(MONEY, 100);
    
    -- MONEY�� 50���� ������ ���� ���ϰ� �������� ������.  �� 50���� ����
    M50 := TRUNC(MONEY / 50);
    
    MONEY := MOD(MONEY, 50);
    
    M10 := TRUNC(MONEY / 10);
    
    MONEY := MOD(MONEY, 10);
    
    --�� ��� ���
    -- ���յ� ���(ȭ������� ����)�� ���Ŀ� �°� ���� ����Ѵ�.
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ��� �Ѿ� : ' || MONEY2);
    DBMS_OUTPUT.PUT_LINE('ȭ����� : 500�� : ' || M500 || ' ��, 100�� : ' || M100 || ' ��, 50�� : ' || M50 || ' ��, 10�� : ' || M10 || ' ��');
END;
--==>>
/*
�Է¹��� �ݾ��� �Ѿ� : 790
ȭ����� : 500�� : 1 ��, 100�� : 2 ��, 50�� : 1 ��, 10�� : 4 ��
*/


--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ���ǰ� ������� ������ �ݺ��ϴ� ����.

-- 2. ���� �� ����
/*
LOOP
    -- ���๮
    
    EXIT WHEN ����;       -- ������ ���� ��� �ݺ����� ����������.
END LOOP;
*/

-- 1 ���� 10������ �� ���(LOOP �� Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    N := 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N>=10;
        
        N := N + 1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/


--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE�� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--    WHILE LOOP ������ ����Ѵ�.
--    ������ �ݺ��� ���۵Ǵ� ������ üũ�ϰ� �Ǿ�
--    LOOP ���� ������ �� ���� ������� ���� ��쵵 �ִ�.
--    LOOP �� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE ���� LOOP       -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/

-- 1 ���� 10������ �� ���(WHILE LOOP �� Ȱ��)

DECLARE
    N NUMBER;
BEGIN
    N := 0;
    WHILE N<10 LOOP
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/


-- �� FOR �ݺ���
-- FOR LOOP ~ END LOOP;

-- 1. �����ۼ������� 1�� �����ϸ�
--    ������������ �� �� ���� �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� IN [REVERSE] ���ۼ� .. ������ LOOP
    -- ���๮;
END LOOP;
*/

-- 1 ���� 10������ �� ���(FOR LOOP �� Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);    
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/


--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--   �ش� �ܼ��� �������� ����ϴ� PL/SQL������ �ۼ��Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� ���� �Է��ϼ��� : 2

2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18
*/

-- 1. LOOP ���� ���

ACCEPT NUM PROMPT '���� �Է��ϼ���'

DECLARE
    N   NUMBER := &NUM;
    CO   NUMBER := 1;
    RESULT  NUMBER := 0;

BEGIN
    LOOP
        RESULT := N * CO;
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || CO || ' = ' || RESULT);
        
        CO := CO + 1;
        EXIT WHEN CO >= 10;
    END LOOP;
END;

-- Ǯ��
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
        EXIT WHEN N >= 9;
        N := N + 1;
    END LOOP;
END;
--==>>
/*
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45
*/


-- 2. WHILE LOOP���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���'

DECLARE
    N   NUMBER := &NUM;
    CO  NUMBER := 1;
    RESULT  NUMBER := 0;
    
BEGIN
    WHILE CO < 10 LOOP
        RESULT := N * CO;
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || CO || ' = ' || RESULT);
        
        CO := CO + 1;
    END LOOP;
END;

-- Ǯ�� (���� ã��)

ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    N := 0;
    
    WHILE N<9 LOOP
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
    END LOOP;

-- 3. FOR LOOP���� ���



ACCEPT NUM PROMPT '���� �Է��ϼ���'

DECLARE
    N   NUMBER := &NUM;
    CO  NUMBER := 1;
    RESULT  NUMBER := 0;
    
BEGIN
    FOR CO IN 1 .. 9 LOOP
        RESULT := N * CO;
        
        DBMS_OUTPUT.PUT_LINE(N || ' * ' || CO || ' = ' || RESULT);
        
    END LOOP;
END;

-- Ǯ��

ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
   FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
    END LOOP;
END;
--==>>
/*
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
*/


--�� ������ ��ü(2�� ~ 9��)�� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--   ��, ���� �ݺ���(�ݺ����� ��ø) ������ Ȱ���Ѵ�.
/*
���� ��)

==[ 2�� ]==
2 * 1 =  2
    :
==[ 9�� ]==
    :
9 * 9 = 81
*/

-- �� Ǯ��

DECLARE
    N1  NUMBER := 2;
    N2  NUMBER := 1;
BEGIN
    <<Outer_loop>>
    LOOP
        DBMS_OUTPUT.PUT_LINE('==[ ' || N1 || '�� ]==');
        
        <<Inner_loop>>
        LOOP
            DBMS_OUTPUT.PUT_LINE(N1 || ' * ' || N2 || ' = ' || N1*N2);
            N2 := N2 + 1;
            EXIT WHEN N2 > 9;
        END LOOP Inner_loop;
        
        N1 := N1 + 1;
        N2 := 1;
        EXIT WHEN N1 > 9;
    END LOOP Outer_loop;
END;

-- Ǯ��

DECLARE
    N   NUMBER;
    M   NUMBER;
BEGIN
    FOR N IN 2 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('==[ ' || N || '�� ]==');
        
        FOR M IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(N || ' * ' || M || ' = ' || (N*M));
        END LOOP;
    END LOOP;
END;
--==>>
/*
==[ 2�� ]==
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18

==[ 3�� ]==
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27

==[ 4�� ]==
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36

==[ 5�� ]==
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45

==[ 6�� ]==
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54

==[ 7�� ]==
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
7 * 5 = 35
7 * 6 = 42
7 * 7 = 49
7 * 8 = 56
7 * 9 = 63

==[ 8�� ]==
8 * 1 = 8
8 * 2 = 16
8 * 3 = 24
8 * 4 = 32
8 * 5 = 40
8 * 6 = 48
8 * 7 = 56
8 * 8 = 64
8 * 9 = 72

==[ 9�� ]==
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81
*/
