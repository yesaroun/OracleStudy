SELECT USER
FROM DUAL;
--==>> SYS

--○ SCOTT 계정에서 VIEW를 생성할 수 있는 권한 부여
--                  --------------------------
--                      CREATE VIEW
GRANT CREATE VIEW TO SCOTT;
--==>> Grant을(를) 성공했습니다.        --> (다시 스캇으로 돌아감)

--○ SCOTT 계정으로부터 VIEW 를 생성할 수 있는 권한 박탈
REVOKE CREATE VIEW FROM SCOTT;