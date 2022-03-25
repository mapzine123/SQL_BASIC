SELECT empno, ename, sal 
    FROM emp; -- 특정 col 출력
    
SELECT *
    FROM emp; -- 모든 col 출력

SELECT empno as 사원번호, ename as 사원이름, sal as "Salary"
    FROM emp; -- col에 별칭 사용해서 출력되는 col이름 바꾸기

SELECT ename || sal
    FROM emp; -- 값 붙여서 출력
    
SELECT ename || '의 월급은 ' || sal || '원 입니다.' as 월급정보
    FROM emp;
    
SELECT ename || '의 직업은 ' || job || ' 입니다.' as 직업정보
    FROM emp;

SELECT DISTINCT job
    FROM emp; -- 데이터 중복 제거해서 출력

SELECT UNIQUE job
    FROM emp; -- 데이터 중복 제거해서 출력
    
SELECT ename, sal
    FROM emp
    ORDER BY sal asc; -- 데이터를 sal에 대해 오름차순으로 출력 (asc : ASCENDING)
    
SELECT ename, sal
    FROM emp           -- ORDER BY절은 SQL 작성 시 맨 마지막에 작성하고, 실행시에도 맨 마지막에 실행됨
    ORDER BY sal desc; -- 데이터를 sal에 대해 내림차순으로 출력 (desc : DESCENDING)
    
SELECT ename, sal as 월급
    FROM emp   
    ORDER BY 월급 asc; -- col 별칭을 ORDER BY 절에 사용 가능
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY deptno asc, sal desc; -- 부서로 먼저 오름차순, 부서가 같은건 sal로 내림차순
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY 2 asc, 3 desc; -- col 정렬 순서도 ORDER BY에 사용 가능
    
SELECT ename, sal, job
    FROM emp
    WHERE sal = 3000; -- 월급이 3000인 사람의 정보만 출력


/* WHERE 절 검색 조건
    > : 크다
    < : 작다
    >= : 이상
    <= : 이하
    = : 같다
    != : 같지 않다
    ^= : 같지 않다
    <> : 같지 않다
    
    BETWEEN AND : ~사이에 있는
    LIKE : 일치하는 문자패턴 검색
    IS NULL : NULL값인지 여부
    IN : 값 리스트 중 일치하는 값 검색
*/

SELECT ename as 이름, sal as 월급
    FROM emp   
    WHERE sal >= 3000; -- 월급이 3000 이상인 사람 검색

-- 실행 순서때문에 오류 발생
SELECT ename as 이름, sal as 월급    -- 3
    FROM emp                        -- 1
    WHERE 월급 >= 3000;              -- 2
-- 별칭 설정보다 WHERE이 먼저 실행되기 때문에 발생하는 오류

SELECT ename, sal, job, hiredate, deptno
    FROM emp
    WHERE ename = 'SCOTT'; -- 문자 검색

SELECT ename, hiredate
    FROM emp   
    WHERE hiredate = '81/11/17'; -- 날짜 검색

SELECT *
    FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT'; -- 현재 접속한 세션의 날짜 형식 조회
    
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- 세션의 날짜 형식 변경

SELECT ename, sal*12 as 연봉
    FROM emp
    WHERE sal*12 >= 36000; -- 산술연산자 적용

SELECT ename, sal, comm, sal + comm
    FROM emp   
    WHERE deptno = 10; -- NULL값 출력

SELECT sal + NVL(comm, 0)
    FROM emp
    WHERE ename = 'KING'; -- NVL(대상, 값) : 대상이 NULL이라면 값으로 처리하겠다
    
SELECT ename, sal, job, deptno
    FROM emp
    WHERE sal <= 1200; -- 비교연산자 적용
    
SELECT ename, sal
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000; -- BETWEEN a AND b : a와 b 사이의 값들 추출 (a, b도 포함)
    -- BETWEEN 하한값 AND 상한값 으로 작성해야함
SELECT ename, sal
    FROM emp
    WHERE (sal >= 1000 AND sal <= 3000); -- BETWEEN절과 동일한 효과
    
SELECT ename, sal
    FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000; -- 1000~3000 이외의 값 (NOT 사용)

SELECT ename, sal
    FROM emp
    WHERE (sal < 1000 OR sal > 3000); -- 위의 구문과 똑같은 효과
    
SELECT ename, hiredate
    FROM emp
    WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31'; -- 날짜도 가능

/*
    와일드카드 : _ % ( 기본적으로 이 자리에 어떤 문자가 와도 상관없음 )
    _ : 무조건 1글자
    % : 없어도 되고, 1글자 이상이어도 됨
*/

    
SELECT ename, sal
    FROM emp
    WHERE ename LIKE 'S%'; -- 와일드카드 사용
    

SELECT ename
    FROM emp
    WHERE ename LIKE '_M%'; -- result : SMITH
    
SELECT ename
    FROM emp
    WHERE ename LIKE '%T'; -- result : SCOTT

SELECT ename
    FROM emp
    WHERE ename LIKE '%A%'; -- 이름에 A가 포함된 모든 사람
    
SELECT ename, comm
    FROM emp
    WHERE comm is null; -- comm이 NULL인 모든 값 출력
    
SELECT ename, sal ,job
    FROM emp
    WHERE job in ('SALESMAN', 'ANALYST', 'MANAGER'); -- in : 여러 조건을 검색가능
    
SELECT ename, sal, job
    FROM emp
    WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER'); -- 위의 예제와 똑같은 효과
    
SELECT ename, sal, job
    FROM emp
    WHERE job NOT in ('SALESMAN', 'ANALYST', 'MANAGER'); -- NOT 이용해 필터링

/*
    UPPER : 다 대문자
    LOWER : 다 소문자
    INITCAP : 첫글자 대문자, 나머지 소문자
*/

SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
    FROM emp;
    
SELECT ENAME, SAL
    FROM emp
    WHERE LOWER(ename)='scott'; -- 데이터가 대문자인지 소문자인지 모를때 활용 가능
    
SELECT SUBSTR('SMITH', 1, 3) -- startIdx : 1 ( 0이 아님 ) 
    FROM DUAL;               -- result : SMI ( 문자열 추출 )
    
SELECT ename, LENGTH(ename) -- ename의 글자 수 추출
    FROM emp;
    
SELECT LENGTHB('가나다라마') -- byte길이 추출
    FROM DUAL;

SELECT INSTR('SMITH', 'M') -- 문자에서 특정 철자의 위치 출력 (SQL은 startIdx가 1)
    FROM DUAL;             -- result : 2
    
SELECT INSTR('abcdefg@naver.com', '@') -- naver.com만 추출하고 싶다면?
    FROM DUAL;

SELECT SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com', '@') + 1, LENGTH('abcdefg@naver.com'))
    FROM DUAL;
    
-- REPLACE : 특정 철자를 다른 철자로 변경
-- REGEXP_REPLACE : 정규식 함수, 더 복잡한 형태의 검색 패턴으로 데이터 조회 가능
SELECT ename, REPLACE(sal, 0, '*')
    FROM emp;
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') as SALARY
    FROM emp;
    
SELECT REPLACE(ENAME, SUBSTR(ENAME, 2, 1), '*') as "전광판_이름"
    FROM emp;    
    
    
    
-- LPAD : 왼쪽에 특정 철자를 N개 만큼 채우기
-- RPAD : 오른쪽에 특정 철자를 N개 만큼 채우기
SELECT ename, LPAD(sal, 10, '*') as salary1, RPAD(sal, 10, '*') as salary2
    FROM emp;

SELECT ename, sal, LPAD('■', round(sal/100), '■') as bar_chart
    FROM emp; -- PAD를 이용한 데이터 시각화

    --     TRIM : 양쪽 공백제거
    --     RTRIM : 오른쪽 공백 제거 + 오른쪽에서 반복문자 제거
    --     LTRIM : 왼쪽 공백 제거 + 왼쪽에서 반복문자 제거

SELECT 'smith', LTRIM('smith','s'), RTRIM('smith','h'), TRIM('s' from 'smiths')
    FROM dual;
  
-- ROUND : 반올림해서 출력하기 ROUND(반올림 할 숫자, 반올림 할 자리)
SELECT '876.567' as 숫자, ROUND(876.567, 1)
    FROM dual;

-- TRUNC : 버림해서 출력하기
SELECT '876.567' as 숫자, TRUNC(876.567, 1)
    FROM dual;
    
-- MOD : 나눈 나머지 값 출력
SELECT MOD(10, 3)
    FROM DUAL;

SELECT empno, MOD(empno, 2)
    FROM emp;

SELECT empno, ename
    FROM emp   
    WHERE MOD(empno, 2) = 0;
    
-- FLOOR : 몫 출력
SELECT FLOOR(10 / 3)   
    FROM DUAL;

-- MONTHS_BETWEEN : 날짜 간 개월 수 출력
SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
    FROM emp;
    
-- ADD_MONTHS : 개월 수 더한 날짜 출력
SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
    FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR_MM-DD') + 100
    FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '100' MONTH
    FROM DUAL;

-- NEXT_DAY : 특정 날짜 뒤에 오는 요일 날짜 출력
SELECT '2022/03/26' as 날짜, NEXT_DAY('2022/03/26', '수')
    FROM DUAL;
    
-- LAST_DAY : 특정 날짜가 있는 달의 마지막 날
SELECT '2019/05/22' as 날짜, LAST_DAY('2019/05/22') as "마지막 날짜"
    FROM DUAL;
    
SELECT LAST_DAY(SYSDATE) - SYSDATE as "남은 날짜"
    FROM DUAL;
    
SELECT ename, hiredate, ROUND(SYSDATE - hiredate) as "경력"
    FROM emp
    WHERE ename = 'KING';
    
SELECT ename, TO_CHAR(hiredate, 'DAY') as 요일, TO_CHAR(sal, '999,999') as 월급
    FROM emp
    WHERE ename = 'SCOTT';

-- IF 문을 SQL로 구현
    
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as 보너스
    FROM emp;
    
SELECT ename, job, sal, CASE 
    WHEN sal >= 3000 THEN 500
    WHEN sal >= 2000 THEN 300
    WHEN sal >= 1000 THEN 200
    ELSE 0 END AS BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');
    
SELECT ename, job, comm, CASE  
    WHEN comm IS NULL THEN 500
    ELSE 0 END BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- MAX : 최대값 출력
SELECT MAX(sal)
    FROM emp;

SELECT MAX(sal)
    FROM emp
    WHERE job = 'SALESMAN';





















    
    
    
    
    
    