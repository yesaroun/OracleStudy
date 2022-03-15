SELECT;


--○ 패키지 활용 실습
SELECT INSA_PACK.FN_GENDER('751212-1234567') "함수호출결과"
  FROM DUAL;
--==>> 남자

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN) "함수호출"
FROM TBL_INSA;

/*
물리적인 디비 설계까지만 하기

ERD를 그려서 만나기
공부하지 않은 내용은 제외하고 만나기
공부하지 않은 내용부터 찾기 (2~3가지, 총 3가지일듯)

3부분을 찾아서 만나기
*/