
/*
1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
2. PRC_�԰�_DELETE(�԰��ȣ)
3. PRC_���_DELETE(����ȣ)
*/

--  1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)       
CREATE OR REPLACE PROCEDURE PRO_�԰�_UPDATE
( V_�԰��ȣ IN TBL_�԰�.�԰��ȣ%TYPE
, V_�԰���� IN TBL_�԰�.�԰����%TYPE
)
IS
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�����԰����  TBL_�԰�.�԰����%TYPE;
    V_������      TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
      FROM TBL_�԰�
     WHERE �԰��ȣ = V_�԰��ȣ;

    SELECT ������ INTO V_������
      FROM TBL_��ǰ
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
     
    IF(V_������ - V_�����԰���� + V_�԰���� < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
     
    UPDATE TBL_�԰�
       SET �԰���� = V_�԰����
     WHERE �԰��ȣ = V_�԰��ȣ;
     
    UPDATE TBL_��ǰ
       SET ������ = ������ - V_�����԰���� + V_�԰���� 
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
     
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;

  
-- 2. PRC_�԰�_DELETE(�԰��ȣ)
CREATE OR REPLACE PROCEDURE PRO_�԰�_DELETE
( V_�԰��ȣ    IN TBL_�԰�.�԰��ȣ%TYPE
)
IS
    V_�����԰����    TBL_�԰�.�԰����%TYPE;
    V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������        TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    SELECT �԰����, ��ǰ�ڵ� INTO V_�����԰����, V_��ǰ�ڵ�
      FROM TBL_�԰�
     WHERE �԰��ȣ = V_�԰��ȣ;
     
    SELECT ������ INTO V_������
      FROM TBL_��ǰ
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

    IF(V_������ - V_�����԰���� < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    DELETE
      FROM TBL_�԰�
     WHERE �԰��ȣ = V_�԰��ȣ;
    
    UPDATE TBL_��ǰ
       SET ������ = ������ - V_�����԰����
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
     
    COMMIT;
     
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
     
END;


-- 3. PRC_���_DELETE(����ȣ)
CREATE OR REPLACE PROCEDURE PRC_���_DELETE
( V_����ȣ    IN TBL_���.����ȣ%TYPE
)
IS
    V_����������    TBL_���.������%TYPE;
    V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������        TBL_��ǰ.������%TYPE;
    
BEGIN
    SELECT ������, ��ǰ�ڵ� INTO V_����������, V_��ǰ�ڵ�
      FROM TBL_���
     WHERE ����ȣ = V_����ȣ;
     
    SELECT ������ INTO V_������
      FROM TBL_��ǰ
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

    DELETE
      FROM TBL_���
     WHERE ����ȣ = V_����ȣ;
    
    UPDATE TBL_��ǰ
       SET ������ = ������ + V_����������
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
     
    COMMIT;
     
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
     
END;
