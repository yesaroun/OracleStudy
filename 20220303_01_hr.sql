SELECT USER
  FROM DUAL;
--==>> HR


--���� ����ȭ(Normalization) ����-- (�߿� ����� �����ؾ���!)

--�� ����ȭ��?       (DB ������� �����ؼ� �����ϴ� �����ڿ��Դ� �ſ� �߿�)

--   �� ����� �����ͺ��̽� ������ �޸� ���� ���� ����
--   � �ϳ��� ���̺���... �ĺ��ڸ� ������ ���� ���� ���̺��
--   ������ ������ ���Ѵ�.

-- ex) ȣ���̰�... �������� �Ǹ��Ѵ�.
--     �� ����Ʈ �� �ŷ�ó ���� ����� �����ִ� ��ø�� ������
--                    �����ͺ��̽�ȭ �Ϸ��� �Ѵ�.

-- ���̺�� : �ŷ�ó����
/*
  10Byte     10Byte     10Byte      10Byte        10Byte 10Byte    10Byte 
--------------------------------------------------------------------------------
�ŷ�óȸ��� ȸ���ּ�   ȸ����ȭ     �ŷ�ó������ ����  �̸���     �޴���
--------------------------------------------------------------------------------
  LG         ���￩�ǵ� 02-345-6789  ������       ���� yyj@na...  010-1234-1234
  LG         ���￩�ǵ� 02-345-6789  �ּ���       ���� csh@da...  010-2345-2345
  LG         ���￩�ǵ� 02-345-6789  �ֹ���       �븮 cmj@da...  010-3456-3456
  LG         ���￩�ǵ� 02-345-6789  ȫ����       ���� heh@gm...  010-5678-5678
  SK         ����Ұ 02-987-6543  ������       ���� phs@na...  010-8585-8585
  LG         �λ굿���� 051-345-6789 ���̻�       �븮 oys@te...  010-9900-9900
  SK         ����Ұ 02-987-6543  ������       �븮 jej@na...  010-2450-8888
                                    :
--------------------------------------------------------------------------------                 

����) ���� ���ǵ� LG��� ȸ�翡 �ٹ��ϴ� �ŷ�ó ���� �����
      �� 100�� ���̶�� �����Ѵ�.
      (�� ��(���ڵ�)�� 70Byte�̴�.)
      
      ��� ��... �����￩�ǵ����� ��ġ�� LG���簡 �����д硻����
      ����� �����ϰ� �Ǿ���.
      ȸ�� �ּҴ� �����д硻���� �ٲ��
      ȸ�� ��ȭ�� ��031-1111-2222���� �ٲ�� �Ǿ���.
      
      �׷���... 100�� ���� ȸ�� �ּҿ� ȸ�� ��ȭ�� �����ؾ� �Ѵ�.
      
      -- �� �� ����Ǿ�� �� ������ �� UPDATE
      
      UPDATE �ŷ�ó����
      SET ȸ���ּ� = '���д�', ȸ����ȭ = '031-1111-2222'
      WHERE �ŷ�óȸ��� = 'LG'
        AND ȸ���ּ� = '���￩�ǵ�';
        
      -- 100�� �� ���� �ϵ��ũ�󿡼� �о�ٰ�
         �޸𸮿� �ε���� �־�� �Ѵ�.
         ��, 100�� * 70Byte�� ���
         �ϵ��ũ�󿡼� �о�ٰ� �޸𸮿� �ε���� �־�� �Ѵٴ� ���̴�.
         
         --> �̴� ���̺��� ���谡 �߸��Ǿ����Ƿ�
             DB ������ ������ �޸� ���� ���� �ٿ�� ���̴�.
             
             --> �׷��Ƿ� ����ȭ ������ �����Ͽ� ���̺��� �߸��� ���踦 �ٷ���ƾ� �Ѵ�.      
*/

-- �� 1 ����ȭ
--> � �ϳ��� ���̺� �ݺ��Ǵ� �÷� ������ �����Ѵٸ�
--  ������ �ݺ��Ǿ� ������ �÷��� �и��Ͽ�
--  ���ο� ���̺��� ������ش�.

--> �� 1 ����ȭ�� �����ϴ� �������� �и��� ���̺���
--  �ݵ�� �θ� ���̺�� �ڽ� ���̺��� ���踦 ���� �ȴ�.

--> �θ� ���̺� �� �����޴� �÷� �� PRIMARY KEY
--  �ڽ� ���̺� �� �����ϴ� �÷� �� FOREIGN KEY

--�� �����޴� �÷��� ���� Ư¡
--   �ݵ�� ������ ��(������)�� ���;� �Ѵ�.
--   �ߺ��� ��(������)�� ����� �Ѵ�.
--   NULL�� �־�� �ȵȴ�. (NOT NULL �̾�� �Ѵ�.)

--> �� 1 ����ȭ�� �����ϴ� ��������
--  �θ� ���̺��� PRIMARY KEY�� �׻� �ڽ� ���̺��� FOREIGN KEY�� ���̵ȴ�.


/*
-- ���̺�� : ȸ�� �� �θ� ���̺�
10Byte     10Byte     10Byte     10Byte     
----------------------------------------------
ȸ��ID   �ŷ�óȸ��� ȸ���ּ�   ȸ����ȭ 
=======
�����޴� �÷� �� P.K
----------------------------------------------
  10       LG         ���￩�ǵ� 02-345-6789  
  20       SK         ����Ұ 02-987-6543  
  30       LG         �λ굿���� 051-345-6789  
----------------------------------------------

-- ���̺�� : ���� �� �ڽ� ���̺�
   10Byte        10Byte 10Byte    10Byte      10Byte
-----------------------------------------------------
  �ŷ�ó������ ����  �̸���     �޴���        ȸ��ID    
                                              -------
                                              �����ϴ� �÷� �� F.K
-----------------------------------------------------
  ������       ���� yyj@na...  010-1234-1234    10    
  �ּ���       ���� csh@da...  010-2345-2345    10
  �ֹ���       �븮 cmj@da...  010-3456-3456    10
  ȫ����       ���� heh@gm...  010-5678-5678    10
  ������       ���� phs@na...  010-8585-8585    20
  ���̻�       �븮 oys@te...  010-9900-9900    30
  ������       �븮 jej@na...  010-2450-8888    20
                                    :
-------------------------------------------------------               
*/

/*
-- ���̺��� �и�(����)�Ǳ� ���� ���·� ��ȸ
SELECT A.�ŷ�óȸ��� A.ȸ���ּ�  A.ȸ����ȭ     
       B.�ŷ�ó������ B.����  B.�̸���  B.�޴���
FROM ȸ�� A, ���� B
WHERE A.ȸ��ID = B.ȸ��ID


����) ���� ���ǵ� LG��� ȸ�翡 �ٹ��ϴ� �ŷ�ó ���� �����
      �� 100�� ���̶�� �����Ѵ�.
      
      ��� ��... �����￩�ǵ����� ��ġ�� LG���簡 �����д硻����
      ����� �����ϰ� �Ǿ���.
      ȸ�� �ּҴ� �����д硻���� �ٲ��
      ȸ�� ��ȭ�� ��031-1111-2222���� �ٲ�� �Ǿ���.
      
      �׷���... ȸ�� ���̺��� 1���� ȸ���ּҿ� ȸ����ȭ�� �����ؾ� �Ѵ�.
      
      -- �� �� ����Ǿ�� �� ������ �� UPDATE
      
      UPDATE ȸ��
      SET ȸ���ּ� = '���д�', ȸ����ȭ = '031-1111-2222'
      WHERE ȸ��ID = 10;
        
      -- 1 �� ���� �ϵ��ũ�󿡼� �о�ٰ�
         �޸𸮿� �ε���� �־�� �Ѵ�.
         ��, 1 * 40Byte�� �ϵ��ũ�󿡼� �о�ٰ� �޸𸮿� �ε���� �־�� �Ѵٴ� ���̴�.
         
         --> ����ȭ �������� 100�� ���� ó���ؾ� �� ��������
             1�Ǹ� ó���ϸ� �Ǵ� ������ �ٲ� ��Ȳ�̱� ������
             DB ������ �޸� ���� �Ͼ�� �ʰ� ���� ������ ó���� ���̴�.
             
*/

-- �ŷ�óȸ���, ȸ����ȭ
SELECT �ŷ�óȸ���, ȸ����ȭ         | SELECT �ŷ�óȸ���, ȸ����ȭ
FROM ȸ��                             | FROM  �ŷ�ó ����
--> 3 *  40 Byte                      | --> 200�� * 70Byte

-- �ŷ�ó������, ����
SELECT �ŷ�ó������, ����             |  SELECT �ŷ�ó������, ����  
FROM ����;                            |  FROM �ŷ�ó����;
--> 200�� * 50Byte                    |  --> 200�� * 70Byte

-- �ŷ�óȸ���, �ŷ�ó������     
SELECT A.�ŷ�óȸ���, B.�ŷ�ó������ | SELECT �ŷ�óȸ���, �ŷ�ó������
FROM ȸ�� A JOIN ���� B               | FROM �ŷ�ó����;
ON A.ȸ��ID = B.ȸ��ID;               |
-> (3*40 + 200��*50)Byte              | --> 200�� * 70 Byte


-- ���̺�� : �ֹ�
/*
--------------------------------------------------------------------------------
   ��ID             ��ǰ�ڵ�           �ֹ�����                    �ֹ�����
   ++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------------
 HEH1217(ȫ����)     P-KKBK(�ܲʹ��)    2022-03-01 13:50:23          10
 CMJ8335(�ֹ���)     P-KKDS(��ũ�ٽ�)    2022-03-01 14:15:11          24
 LHS3235(��ȣ��)     P-CCPI(��������)    2022-03-01 16:14:36          12
 PHS5834(������)     P-MGRT(������Ʈ)    2022-03-02 10:20:54          20
 LSM1124(�Ӽҹ�)     P-KSTD(ī��Ÿ��)    2022-03-02 11:32:47          30
                                :
--------------------------------------------------------------------------------
*/

--�� �ϳ��� ���̺� �����ϴ� PRIMARY KEY�� �ִ� ������ 1���̴�.
--   ������, PRIMARY KEY�� �̷��(�����ϴ�) �÷��� ������ ����(������)�� ���� �����ϴ�.
--   �÷� 1���θ� ������ PRIMARY KEY�� SINGLE PRIMARY KEY ��� �θ���.
--   (���� �����̸Ӹ� Ű)
--   �� �� �̻��� �÷����� ������ PRIMARY KEY�� COMPOSITE PRIMARY KEY��� �θ���.
--   (���� �����̸Ӹ� Ű)



-- �� 2 ����ȭ
--> �� 1 ����ȭ�� ��ģ ��������� PRIMARY KEY�� SINGLE COLUMN�̶��
--  �� 2 ����ȭ�� �������� �ʴ´�.
--  ������, PRIMARY KEY�� COMPOSITE COLUMN�̶��
--  ��.��.��. �� 2 ����ȭ�� �����ؾ� �Ѵ�.

--> �ĺ��ڰ� �ƴ� �÷��� �ĺ��� ��ü �÷��� ���� �������̾�� �ϴµ�
--  �ĺ��� ��ü�÷��� �ƴ� �Ϻ� �ĺ��� �÷��� ���ؼ��� �������̶��
--  �̸� �и��Ͽ� ���ο� ���̺��� �������ش�.
--  �� ������ �� 2 ����ȭ��� �Ѵ�.

/*
-- ���̺�� : ���� �� �θ� ���̺�
---------------------------------------------------------------------
�����ȣ    �����   ������ȣ �����ڸ�  ���ǽ��ڵ�   ���ǽǼ���
+++++++++            ++++++++
    P.K
---------------------------------------------------------------------
 J0101     �ڹٱ���    21      ������ó  A301       ����ǽ��� 3�� 40�� �Ը�
 J0102     �ڹ��߱�    22      �׽���    T502       ���ڰ��а� 5�� 60�� �Ը�
 O1123     ����Ŭ�߱�  22      �׽���    A201       ����ǽ��� 2�� 30�� �Ը�
 O1150     ����Ŭ��ȭ  10      �念��    KT502      ���ڰ��а� 5�� 60�� �Ը�
 J3342     JSP����     20      �ƽ���    K101       �ι����а� 1�� 90�� �Ը�
                            :
---------------------------------------------------------------------

-- ���̺�� : ���� �� �ڽ� ���̺�
---------------------------------------------------------------------
�����ȣ    ������ȣ    �й�              ����
====================
        F.K
++++++++                ++++++
   P.K
---------------------------------------------------------------------
O1123       22          2212316(�����)    80
O1123       22          2212318(������)    92
O1123       22          2212319(������)    76
O1123       22          2212323(������)    88
                    :
J0101       21          2212316(�����)    99
                    :
---------------------------------------------------------------------


*/

-- �� 3 ����ȭ
--> �ĺ��ڰ� �ȴ� �÷��� �ĺ��ڰ� �ȴ� �÷��� �������� ��Ȳ�̶��
--  �̸� �и��Ͽ� ���ο� ���̺��� ������ �־�� �Ѵ�
--  �� ������ �� 3 �������̶� �Ѵ�.



--�� ����(Relation)�� ����

-- 1 : many ����    (1 : �� ����)
--> �� 1 ����ȭ�� �����Ͽ� ������ ��ģ ��������� ��Ÿ���� �ٶ����� ����.
--  ������ �����ͺ��̽��� Ȱ���ϴ� �������� �߱��ؾ� �ϴ� ����


-- 1 : 1 ����       (1 : 1 ����)
--> ����, ���������� ������ �� �ִ� �����̱� ������
--  ������ �����ͺ��̽� ���� �������� �������̸� ���ؾ� �� ����.

-- �л�                           -- ����
-----------------------              -------------------------------------------
-- �й� �̸� ��ȭ �ּ�               �й� �������� �������� �������� ��������
-----------------------              -------------------------------------------
-- 7369 ȫ�浿 ..........            7369 ....      ...      ....     ...


-- many : many ���� (�� : �� ����)
--> ������ �𵨸������� ������ �� ������
--  ���� �������� �𵨸������� ������ �� ���� ����.
/*
-- ���̺�� : ��                    - ���̺�� : ��ǰ
------------------------------------- ------------------------------------------
����ȣ ���� �̸��� ��ȭ��ȣ       ��ǰ��ȣ ��ǰ�� ��ǰ�ܰ� ��ǰ����...
------------------------------------- ------------------------------------------
 1001    �ּ��� csh@t.. 010...         pkdlek  �����   600     ���찡 ���..
 1002    ���� ksk@t.. 010...         wkrkfc  �ڰ�ġ   500     �ڰ��� ���..
 1003    ������ phj@t.. 010...         rkawkr  ���ڱ�   400     ���ڰ� ���..
 1004    ������ hch@t.. 010...         rhrnak  ������ 400     ������ ���..
            :                                       :
------------------------------------- ------------------------------------------

                    - ���̺�� : �ֹ�����(�Ǹ�)
                    -------------------------------------
                    ����ȣ ��ǰ��ȣ  �ֹ�����  �ֹ�����
                    -------------------------------------
                    1001     rhrnak     2022-03-..  10
                    1001     pkdlek     2022-03-..  20
                    1002     rhrnak     2022-03-..  20
                                    :
                    -------------------------------------
                    (�ֹ����� ���̺��� �� �� �� ���踦 ���߸�)

*/

-- �� 4 ����ȭ
--> ������ Ȯ���� ����� ���� ��many(��) : many(��)�� ���踦
--  ��1(��) : many(��)�� ����� ���߸��� ������ �ٷ� �� 4 ����ȭ ���� ����
--  �� �Ļ� ���̺� ���� �� ��:�� ���踦 1:�� ����� ���߸��� ���� ����


-- ������ȭ(������ȭ) (����ȭ�� �и����ٸ� ������ȭ�� ��ġ�� �Ŵ�.)

/*
-- A ��� �� ������ȭ�� �������� �ʴ� ���� �ٶ����� ���~~!!!

-- ���̺��:�μ�             - ���̺��:���
   10       10      10          10      10    10   10    10     10
-----------------------     ------------------------------------------- + ------
�μ���ȣ   �μ���  �ּ�      �����ȣ ����� ���� �޿� �Ի��� �μ���ȣ    �μ���(�μ������� �μ� ���̺��� �ҷ��� �ϴµ� �׷��� ���ϰ� JOIN�ϴ°���)
-----------------------     ------------------------------------------- + ------
        10�� ��                           1,000,000 �� ��
-----------------------     ------------------------------------------- + ------

--> ��ȸ �����
-----------------------
�μ��� ����� ���� �޿�
-----------------------

--> ���μ��� ���̺�� ����������̺��� JOIN ���� ���� ũ��
--  (10*30Byte) + (1000000*60Byte)

--> ������� ���̺��� ������ȭ �� �� �� ���̺� �о�� ���� ũ�� (������ �޸𸮸� �� ����)
--  1000000*70Byte


-- B ��� �� ������ȭ�� �����ϴ� ���� �ٶ����� ���~!!!

-- ���̺��:�μ�             - ���̺��:���
   10       10      10          10      10    10   10    10     10
-----------------------     ------------------------------------------- + ------
�μ���ȣ   �μ���  �ּ�      �����ȣ ����� ���� �޿� �Ի��� �μ���ȣ    �μ���(�μ������� �μ� ���̺��� �ҷ��� �ϴµ� �׷��� ���ϰ� JOIN�ϴ°���)
-----------------------     ------------------------------------------- + ------
        500,000 �� ��                           1,000,000 �� ��
-----------------------     ------------------------------------------- + ------

--> ��ȸ �����
-----------------------
�μ��� ����� ���� �޿�
-----------------------

--> ���μ��� ���̺�� ����������̺��� JOIN ���� ���� ũ��
--  (500000*30Byte) + (1000000*60Byte)

--> ������� ���̺��� ������ȭ �� �� �� ���̺� �о�� ���� ũ�� (������ȭ �Ѱ� �� ���� �޸�) 
--  1000000*70Byte

-- (�޶����� ��� ���ڵ尡 ���Դ����� �ٸ��� �����Ѱ� �ٲ� �׷��� ������ ���Ŀ� �����Ͱ� � ���·� Ŀ������ ���� �ľ��� �ʿ�)

*/

-------------------------------------------------------------------------------------------


--�� ����
/*
1. ����(relationship, relation)
    - ��� ��Ʈ��(entry)�� ���ϰ��� ������.
    - �� ��(column)�� ������ �̸��� ������ ������ ���ǹ��ϴ�.
    - ���̺��� ��� ��(row==Ʃ��==tuple)�� �������� ������ ������ ���ǹ��ϴ�.

2. �Ӽ�(attribute)
    - ���̺��� ��(column)�� ��Ÿ����.
    - �ڷ��� �̸��� ���� �ּ� ���� ���� : ��ü�� ����, ���� ���
    - �Ϲ� ����(file)�� �׸�(������==item==�ʵ�==field)�� �ش��Ѵ�.
    - ��ƼƼ(entity)�� Ư���� ���¸� ���
    - �Ӽ�(attribute)�� �̸��� ��� �޶�� �Ѵ�.

3. Ʃ��==tuple==��ƼƼ==entity
    - ���̺��� ��(row)
    - ������ �� ���� �Ӽ����� ����
    - ���� ���� ����
    - �Ϲ� ����(file)�� ���ڵ�(record)�� �ش��Ѵ�.
    - Ʃ�� ����(tuble variable)
      : Ʃ��(tuble)�� ����Ű�� ����, ��� Ʃ�� ������ ���������� �ϴ� ����

4. ������(domin)
    - �� �Ӽ�(attribute)�� ���� �� �ֵ��� ���� ������ ����
    - �Ӽ� ��� ������ ���� �ݵ�� ������ �ʿ�� ����
    - ��� �����̼ǿ��� ��� �Ӽ����� �������� ������(atomic)�̾�� ��.
    - ������ ������
        : �������� ���Ұ� �� �̻� �������� �� ���� ����ü�� ���� ��Ÿ��.

5. �����̼�(relation)
    - ���� �ý��ۿ��� ���ϰ� ���� ����
    - �ߺ��� Ʃ��(tuple==entity==��ƼƼ)�� �������� �ʴ´�. �� ��� ������(Ʃ���� ���ϼ�)
    - �����̼�==Ʃ��(��ƼƼ==entity)�� ����. ���� Ʃ���� ������ ���ǹ��ϴ�.
    - �Ӽ�(attribute)������ ������ ����.

*/


---------------------------------------------------------------------------------------

--���� ���Ἲ(INTEGRITY) ����--
/*
1. ���Ἲ���� ��ü ���Ἲ(Entity Integrity)
              ���� ���Ἲ(Relational Integrity)
              ������ ���Ἲ(Domain Integrity)�� �ִ�.

2. ��ü ���Ἲ(Entity Integrity)
   ��ü ���Ἲ�� �����̼ǿ��� ����Ǵ� Ʃ��(tuple)��
   ���ϼ��� �����ϱ� ���� ���������̴�.

3. ���� ���Ἲ(Relational Integrity)
   ���� ���Ἲ�� �����̼� ���� ������ �ϰ�����
   �����ϱ� ���� ���� �����̴�.

4. ������ ���Ἲ(Domain Integrity)
   ������ ���Ἲ�� ��밡���� ���� ������
   �����ϱ� ���� ���������̴�.
   (���ϰ� �����ؼ� ������Ÿ���̶�� �����ϸ�ȴ�)

5. ���������� ����

    - PRIMARY KEY(PK:P) �� �⺻Ű, ����Ű
      �ش� �÷��� ���� �ݵ�� �����ؾ� �ϸ�, �����ؾ� �Ѵ�.
      (NOT NULL �� UNIQUE�� ���յ� ����)
      
    - FOREIGN KEY(FK:F:R) �� �ܷ�Ű, �ܺ�Ű, ����Ű
      �ش� �÷��� ���� �����Ǵ� ���̺��� �÷� �����͵� �� �ϳ���
      ��ġ�ϰų� NULL�� ������.
      
    - UNIQUE(UK:U)
      ���̺� ������ �ش� �÷��� ���� �׻� �����ؾ� �Ѵ�.
    
    - NOT NULL(NN:CK:C)
      �ش� �÷��� NULL�� ������ �� ����.
    
    - CHECK(CK:C)
      �ش� �÷��� ���� ������ �������� ���� ������ ������ �����Ѵ�.
*/

---------------------------------------------------------------------------------

--���� PRIMARY KEY ����--

-- 1. ���̺� ���� �⺻ Ű�� �����Ѵ�.

-- 2. ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷� �Ǵ� �÷��� �����δ�.
--    �⺻ Ű�� ���̺� �� �ִ� �ϳ��� �����Ѵ�.
--    �׷��� �ݵ�� �ϳ��� �÷������θ� �����Ǵ� ���� �ƴϴ�.
--    NULL �� ���� ����, �̹� ���̺� �����ϰ� �ִ� �����͸�
--    �ٽ� �Է��� �� ������ ó���Ѵ�.
--    UNIQUE INDEX �� �ڵ����� �����ȴ�.(����Ŭ�� ��ü������ �����.)

3. ���� �� ����
--  �� �÷� ������ ����
--     �÷��� ������Ÿ�� [CONSTAINT CONSTRAIN ��] PRIMARY KEY[(�÷���, ...)]

--  �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT �� PRIMARY KEY(�÷���, ...)

-- 4. CONSTRAINT �߰� �� CONSTRAINT���� �����ϸ�
--    ����Ŭ ������ �ڵ������� CONSTRAINT ���� �ο��Ѵ�.
--    �Ϲ������� (CONSTRAINT ���� �����̺��_�÷���_CONSTRAINT���ڡ�)
--    �������� ����Ѵ�.

--�� PK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST1
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'TEST');    --> ���� �߻�(�̹� �Էµ� �����ʹϱ�)
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'ABCD');    --> ���� �߻�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(3, NULL);      
INSERT INTO TBL_TEST1(COL1) VALUES(4);                  --(COL2�� NULL)
INSERT INTO TBL_TEST1(COL1) VALUES(4);                  --> ���� �߻�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(5, 'ABCD');    --(�ι� ° �÷��� ������ �ߺ��Ǿ �������)
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(NULL, NULL);   --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

DESC TBL_TEST1;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)     �� PK �������� Ȯ�� �Ұ�
COL2          VARCHAR2(30) 
*/

--�� �������� Ȯ��
SELECT *
FROM USER_CONSTRAINTS;
--==>>
/*
HR	REGION_ID_NN	C	REGIONS	"REGION_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	REG_ID_PK	P	REGIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	REG_ID_PK		
HR	COUNTRY_ID_NN	C	COUNTRIES	"COUNTRY_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	COUNTRY_C_ID_PK	P	COUNTRIES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	COUNTRY_C_ID_PK		
HR	COUNTR_REG_FK	R	COUNTRIES		HR	REG_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	LOC_CITY_NN	C	LOCATIONS	"CITY" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	LOC_ID_PK	P	LOCATIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	LOC_ID_PK		
HR	LOC_C_ID_FK	R	LOCATIONS		HR	COUNTRY_C_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_NAME_NN	C	DEPARTMENTS	"DEPARTMENT_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_ID_PK	P	DEPARTMENTS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	DEPT_ID_PK		
HR	DEPT_LOC_FK	R	DEPARTMENTS		HR	LOC_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JOB_TITLE_NN	C	JOBS	"JOB_TITLE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JOB_ID_PK	P	JOBS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	JOB_ID_PK		
HR	EMP_LAST_NAME_NN	C	EMPLOYEES	"LAST_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_EMAIL_NN	C	EMPLOYEES	"EMAIL" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_HIRE_DATE_NN	C	EMPLOYEES	"HIRE_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_JOB_NN	C	EMPLOYEES	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_SALARY_MIN	C	EMPLOYEES	salary > 0				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_EMAIL_UK	U	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	EMP_EMAIL_UK		
HR	EMP_EMP_ID_PK	P	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	EMP_EMP_ID_PK		
HR	EMP_DEPT_FK	R	EMPLOYEES		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_JOB_FK	R	EMPLOYEES		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_MANAGER_FK	R	EMPLOYEES		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_MGR_FK	R	DEPARTMENTS		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMPLOYEE_NN	C	JOB_HISTORY	"EMPLOYEE_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_START_DATE_NN	C	JOB_HISTORY	"START_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_END_DATE_NN	C	JOB_HISTORY	"END_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_JOB_NN	C	JOB_HISTORY	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_DATE_INTERVAL	C	JOB_HISTORY	end_date > start_date				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMP_ID_ST_DATE_PK	P	JOB_HISTORY					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	JHIST_EMP_ID_ST_DATE_PK		
HR	JHIST_JOB_FK	R	JOB_HISTORY		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMP_FK	R	JOB_HISTORY		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_DEPT_FK	R	JOB_HISTORY		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	SYS_C004102	O	EMP_DETAILS_VIEW					ENABLED	NOT DEFERRABLE	IMMEDIATE	NOT VALIDATED	GENERATED NAME			2014-05-29				
HR	SYS_C007043	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2022-03-03	HR	SYS_C007043		
*/ --(���߿��� �츮�� TBL_TEST1�� Ȯ���ؾ���)

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007043	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2022-03-03	HR	SYS_C007043		
--          -----------
--          �������� �̸�(��) (P�� �����̸Ӹ�Ű �����)

--�� ���������� ������ �÷� Ȯ��(��ȸ)
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007043	TBL_TEST1	COL1	1
--          -----------             ----
--          �������� ��              ����÷�


--�� USER_CONSTRAINTS �� USER_CONS_COLUMNS�� �������
--   ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸��� ��ȸ�Ѵ�.

-- ��Ǯ��
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
  FROM USER_CONSTRAINTS UC
  JOIN USER_CONS_COLUMNS UCC
    ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;

-- Ǯ��
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
  FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>>
/*
HR	REGION_ID_NN	REGIONS	C	REGION_ID
HR	REG_ID_PK	REGIONS	P	REGION_ID
HR	COUNTRY_ID_NN	COUNTRIES	C	COUNTRY_ID
HR	COUNTRY_C_ID_PK	COUNTRIES	P	COUNTRY_ID
HR	COUNTR_REG_FK	COUNTRIES	R	REGION_ID
HR	LOC_ID_PK	LOCATIONS	P	LOCATION_ID
HR	LOC_CITY_NN	LOCATIONS	C	CITY
HR	LOC_C_ID_FK	LOCATIONS	R	COUNTRY_ID
HR	DEPT_ID_PK	DEPARTMENTS	P	DEPARTMENT_ID
HR	DEPT_NAME_NN	DEPARTMENTS	C	DEPARTMENT_NAME
HR	DEPT_MGR_FK	DEPARTMENTS	R	MANAGER_ID
HR	DEPT_LOC_FK	DEPARTMENTS	R	LOCATION_ID
HR	JOB_ID_PK	JOBS	P	JOB_ID
HR	JOB_TITLE_NN	JOBS	C	JOB_TITLE
HR	EMP_EMP_ID_PK	EMPLOYEES	P	EMPLOYEE_ID
HR	EMP_LAST_NAME_NN	EMPLOYEES	C	LAST_NAME
HR	EMP_EMAIL_NN	EMPLOYEES	C	EMAIL
HR	EMP_EMAIL_UK	EMPLOYEES	U	EMAIL
HR	EMP_HIRE_DATE_NN	EMPLOYEES	C	HIRE_DATE
HR	EMP_JOB_NN	EMPLOYEES	C	JOB_ID
HR	EMP_JOB_FK	EMPLOYEES	R	JOB_ID
HR	EMP_SALARY_MIN	EMPLOYEES	C	SALARY
HR	EMP_MANAGER_FK	EMPLOYEES	R	MANAGER_ID
HR	EMP_DEPT_FK	EMPLOYEES	R	DEPARTMENT_ID
HR	JHIST_EMPLOYEE_NN	JOB_HISTORY	C	EMPLOYEE_ID
HR	JHIST_EMP_FK	JOB_HISTORY	R	EMPLOYEE_ID
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	P	EMPLOYEE_ID
HR	JHIST_START_DATE_NN	JOB_HISTORY	C	START_DATE
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	C	START_DATE
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	P	START_DATE
HR	JHIST_END_DATE_NN	JOB_HISTORY	C	END_DATE
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	C	END_DATE
HR	JHIST_JOB_NN	JOB_HISTORY	C	JOB_ID
HR	JHIST_JOB_FK	JOB_HISTORY	R	JOB_ID
HR	JHIST_DEPT_FK	JOB_HISTORY	R	DEPARTMENT_ID
HR	SYS_C007043	TBL_TEST1	P	COL1
*/

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
  FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
   AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007043	TBL_TEST1	P	COL1



--�� PK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST2
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1)        --�̰� Ű�� �����̸Ӹ� Ű �����ϴ°��̰� TEST2_COL1_PK�� �̸��ϻ�
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'TEST');  --> ���� �߻�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'ABCD');  --> ���� �߻�(COL1�� �����ϱ�)
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES(4);
INSERT INTO TBL_TEST2(COL1) VALUES(4);                --> ���� �߻�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(NULL, NULL); --> ���� �߻� (ù���� �÷� ������)

SELECT *
FROM TBL_TEST2;

COMMIT;

--�� USER_CONSTRAINTS �� USER_CONS_COLUMNS�� �������
--   ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸��� ��ȸ�Ѵ�.

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
  FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
   AND UC.TABLE_NAME = 'TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1
--(�̷��� �ϸ� �츮�� ������ �̸��� TEST2_COL1 PK �̷��� ���ͼ� �ٷ� �� �� ����)


--�� PK ���� �ǽ�(�� ���� �÷� PK ����)
-- ���̺� ����
CREATE TABLE TBL_TEST3
( COL1 NUMBER(5)
, COL2 VARCHAR(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');    --> ���� �߻�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'ABCD');    --(���� �����̸Ӹ�Ű ���� �Ѵ� ���ƾ� �����ٴ� �ǹ��� �׷��� ��) --����!
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);      --> ���� �߻�(���°� ������ �ȵ����� NULL�� ���� ������)
INSERT INTO TBL_TEST3(COL1) VALUES();                   --> ���� �߻�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL);   --> ���� �߻�

COMMIT;

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	ABCD
1	TEST
2	ABCD
5	ABCD
*/


--�� PK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� ����)
-- ���̺� ����
CREATE TABLE TBL_TEST4
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST4��(��) �����Ǿ����ϴ�.

--�� �̹� ������� �ִ� ���̺�             **
--   �ο��Ϸ��� ���������� ������ �����Ͱ� ���ԵǾ� ���� ���
--   �ش� ���̺� ���������� �߰��ϴ� ���� �Ұ����ϴ�.

-- �������� �߰�
ALTER TABLE TBL_TEST4
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4��(��) ����Ǿ����ϴ�.
--(������ �Է��� ������ ���� �ʰڴ�.)

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
  FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
 WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
   AND UC.TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1


--�� �������� Ȯ�� ���� ��(VIEW) ���� (�Ź� ������ �� ���� �������ϱ�)
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
     , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
     , UC.TABLE_NAME "TABLE_NAME"
     , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
     , UCC.COLUMN_NAME "COLUMN_NAME"
     , UC.SEARCH_CONDITION "SEARCH_CONDITION"
     , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.

--�� ������ ��(VIEW)�� ���� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		

--------------------------------------------------------------------------------

--���� UNIQUE(UK:U) ����--

-- 1. ���̺��� ������ �÷��� �����Ͱ� �ߺ����� �ʰ� ������ �� �ֵ��� �����ϴ� ��������.
--    PRIMARY KEY �� ������ ��������������, NULL�� ����Ѵٴ� �������� �ִ�.
--    ���������� PRIMARY KEY �� ���������� UNIQUE INDEX�� �ڵ� �����ȴ�.
--    �ϳ��� ���̺� ������ UNIQUE ���������� ���� �� �����ϴ� ���� �����ϴ�.
--    ��, �ϳ��� ���̺� UNIQUE ���������� ������ ����� ���� �����ϴٴ� ���̴�.

-- 2. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��] UNIQUE

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� UNIQUE(�÷���, ...)

--�� UK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST5
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)   UNIQUE
);
--==>> Table TBL_TEST5��(��) �����Ǿ����ϴ�.


-- �������� ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>>
/*
HR	SYS_C007047	TBL_TEST5	P	COL1		
HR	SYS_C007048	TBL_TEST5	U	COL2		
*/

-- ������ �Է�
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(1, 'TEST');    --> ���� �߻�
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(1, 'ABCD');    --> ���� �߻�
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST5(COL1) VALUES(4);   
INSERT INTO TBL_TEST5(COL1, COL2) VALUES(5, 'ABCD');    --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TEST
2	ABCD
3	
4	
*/

--�� UK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST6
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST6_COL1_PK PRIMARY KEY(COL1, COL2)
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==>> Table TBL_TEST6��(��) �����Ǿ����ϴ�.

-- Ȯ�κ��� �̾ ����

