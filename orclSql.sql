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
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    