SELECT USER
  FROM DUAL;
--==>> HR


--■■■ 정규화(Normalization) ■■■--

--○ 정규화란?       (DB 설계부터 시작해서 개발하는 개발자에게는 매우 중요)

--   한 마디로 데이터베이스 서버의 메모리 낭비를 막기 위해
--   어떤 하나의 테이블을... 식별자를 가지는 여러 개의 테이블로
--   나누는 과정을 말한다.

-- ex) 호석이가... 옥장판을 판매한다.
--     고객 리스트 → 거래처 직원 명단이 적혀있는 수첩의 정보를
--                    데이터베이스화 하려고 한다.

-- 테이블명 : 거래처직원
/*
  10Byte     10Byte     10Byte      10Byte        10Byte 10Byte    10Byte 
--------------------------------------------------------------------------------
거래처회사명 회사주소   회사전화     거래처직원명 직급  이메일     휴대폰
--------------------------------------------------------------------------------
  LG         서울여의도 02-345-6789  양윤정       부장 yyj@na...  010-1234-1234
  LG         서울여의도 02-345-6789  최선하       과장 csh@da...  010-2345-2345
  LG         서울여의도 02-345-6789  최문정       대리 cmj@da...  010-3456-3456
  LG         서울여의도 02-345-6789  홍은혜       부장 heh@gm...  010-5678-5678
  SK         서울소곡동 02-987-6543  박현수       부장 phs@na...  010-8585-8585
  LG         부산동래구 051-345-6789 오이삭       대리 oys@te...  010-9900-9900
  SK         서울소곡동 02-987-6543  정윤정       대리 jej@na...  010-2450-8888
                                    :
--------------------------------------------------------------------------------                 

가정) 서울 여의도 LG라는 회사에 근무하는 거래처 직원 명단이
      총 100만 명이라고 가정한다.
      (한 행(레코드)는 70Byte이다.)
*/



