SELECT empno, ename, sal 
    FROM emp; -- Ư�� col ���
    
SELECT *
    FROM emp; -- ��� col ���

SELECT empno as �����ȣ, ename as ����̸�, sal as "Salary"
    FROM emp; -- col�� ��Ī ����ؼ� ��µǴ� col�̸� �ٲٱ�

SELECT ename || sal
    FROM emp; -- �� �ٿ��� ���
    
SELECT ename || '�� ������ ' || sal || '�� �Դϴ�.' as ��������
    FROM emp;
    
SELECT ename || '�� ������ ' || job || ' �Դϴ�.' as ��������
    FROM emp;

SELECT DISTINCT job
    FROM emp; -- ������ �ߺ� �����ؼ� ���

SELECT UNIQUE job
    FROM emp; -- ������ �ߺ� �����ؼ� ���
    
SELECT ename, sal
    FROM emp
    ORDER BY sal asc; -- �����͸� sal�� ���� ������������ ��� (asc : ASCENDING)
    
SELECT ename, sal
    FROM emp           -- ORDER BY���� SQL �ۼ� �� �� �������� �ۼ��ϰ�, ����ÿ��� �� �������� �����
    ORDER BY sal desc; -- �����͸� sal�� ���� ������������ ��� (desc : DESCENDING)
    
SELECT ename, sal as ����
    FROM emp   
    ORDER BY ���� asc; -- col ��Ī�� ORDER BY ���� ��� ����
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY deptno asc, sal desc; -- �μ��� ���� ��������, �μ��� ������ sal�� ��������
    
SELECT ename, deptno, sal
    FROM emp
    ORDER BY 2 asc, 3 desc; -- col ���� ������ ORDER BY�� ��� ����
    
SELECT ename, sal, job
    FROM emp
    WHERE sal = 3000; -- ������ 3000�� ����� ������ ���


/* WHERE �� �˻� ����
    > : ũ��
    < : �۴�
    >= : �̻�
    <= : ����
    = : ����
    != : ���� �ʴ�
    ^= : ���� �ʴ�
    <> : ���� �ʴ�
    
    BETWEEN AND : ~���̿� �ִ�
    LIKE : ��ġ�ϴ� �������� �˻�
    IS NULL : NULL������ ����
    IN : �� ����Ʈ �� ��ġ�ϴ� �� �˻�
*/

SELECT ename as �̸�, sal as ����
    FROM emp   
    WHERE sal >= 3000; -- ������ 3000 �̻��� ��� �˻�

-- ���� ���������� ���� �߻�
SELECT ename as �̸�, sal as ����    -- 3
    FROM emp                        -- 1
    WHERE ���� >= 3000;              -- 2
-- ��Ī �������� WHERE�� ���� ����Ǳ� ������ �߻��ϴ� ����

SELECT ename, sal, job, hiredate, deptno
    FROM emp
    WHERE ename = 'SCOTT'; -- ���� �˻�

SELECT ename, hiredate
    FROM emp   
    WHERE hiredate = '81/11/17'; -- ��¥ �˻�

SELECT *
    FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT'; -- ���� ������ ������ ��¥ ���� ��ȸ
    
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; -- ������ ��¥ ���� ����

SELECT ename, sal*12 as ����
    FROM emp
    WHERE sal*12 >= 36000; -- ��������� ����

SELECT ename, sal, comm, sal + comm
    FROM emp   
    WHERE deptno = 10; -- NULL�� ���

SELECT sal + NVL(comm, 0)
    FROM emp
    WHERE ename = 'KING'; -- NVL(���, ��) : ����� NULL�̶�� ������ ó���ϰڴ�
    
SELECT ename, sal, job, deptno
    FROM emp
    WHERE sal <= 1200; -- �񱳿����� ����
    
SELECT ename, sal
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000; -- BETWEEN a AND b : a�� b ������ ���� ���� (a, b�� ����)
    -- BETWEEN ���Ѱ� AND ���Ѱ� ���� �ۼ��ؾ���
SELECT ename, sal
    FROM emp
    WHERE (sal >= 1000 AND sal <= 3000); -- BETWEEN���� ������ ȿ��
    
SELECT ename, sal
    FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000; -- 1000~3000 �̿��� �� (NOT ���)

SELECT ename, sal
    FROM emp
    WHERE (sal < 1000 OR sal > 3000); -- ���� ������ �Ȱ��� ȿ��
    
SELECT ename, hiredate
    FROM emp
    WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31'; -- ��¥�� ����

/*
    ���ϵ�ī�� : _ % ( �⺻������ �� �ڸ��� � ���ڰ� �͵� ������� )
    _ : ������ 1����
    % : ��� �ǰ�, 1���� �̻��̾ ��
*/

    
SELECT ename, sal
    FROM emp
    WHERE ename LIKE 'S%'; -- ���ϵ�ī�� ���
    

SELECT ename
    FROM emp
    WHERE ename LIKE '_M%'; -- result : SMITH
    
SELECT ename
    FROM emp
    WHERE ename LIKE '%T'; -- result : SCOTT

SELECT ename
    FROM emp
    WHERE ename LIKE '%A%'; -- �̸��� A�� ���Ե� ��� ���
    
SELECT ename, comm
    FROM emp
    WHERE comm is null; -- comm�� NULL�� ��� �� ���
    
SELECT ename, sal ,job
    FROM emp
    WHERE job in ('SALESMAN', 'ANALYST', 'MANAGER'); -- in : ���� ������ �˻�����
    
SELECT ename, sal, job
    FROM emp
    WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER'); -- ���� ������ �Ȱ��� ȿ��
    
SELECT ename, sal, job
    FROM emp
    WHERE job NOT in ('SALESMAN', 'ANALYST', 'MANAGER'); -- NOT �̿��� ���͸�

/*
    UPPER : �� �빮��
    LOWER : �� �ҹ���
    INITCAP : ù���� �빮��, ������ �ҹ���
*/

SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
    FROM emp;
    
SELECT ENAME, SAL
    FROM emp
    WHERE LOWER(ename)='scott'; -- �����Ͱ� �빮������ �ҹ������� �𸦶� Ȱ�� ����
    
SELECT SUBSTR('SMITH', 1, 3) -- startIdx : 1 ( 0�� �ƴ� ) 
    FROM DUAL;               -- result : SMI ( ���ڿ� ���� )
    
SELECT ename, LENGTH(ename) -- ename�� ���� �� ����
    FROM emp;
    
SELECT LENGTHB('�����ٶ�') -- byte���� ����
    FROM DUAL;

SELECT INSTR('SMITH', 'M') -- ���ڿ��� Ư�� ö���� ��ġ ��� (SQL�� startIdx�� 1)
    FROM DUAL;             -- result : 2
    
SELECT INSTR('abcdefg@naver.com', '@') -- naver.com�� �����ϰ� �ʹٸ�?
    FROM DUAL;

SELECT SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com', '@') + 1, LENGTH('abcdefg@naver.com'))
    FROM DUAL;
    
-- REPLACE : Ư�� ö�ڸ� �ٸ� ö�ڷ� ����
-- REGEXP_REPLACE : ���Խ� �Լ�, �� ������ ������ �˻� �������� ������ ��ȸ ����
SELECT ename, REPLACE(sal, 0, '*')
    FROM emp;
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') as SALARY
    FROM emp;
    
SELECT REPLACE(ENAME, SUBSTR(ENAME, 2, 1), '*') as "������_�̸�"
    FROM emp;    
    
    
    
-- LPAD : ���ʿ� Ư�� ö�ڸ� N�� ��ŭ ä���
-- RPAD : �����ʿ� Ư�� ö�ڸ� N�� ��ŭ ä���
SELECT ename, LPAD(sal, 10, '*') as salary1, RPAD(sal, 10, '*') as salary2
    FROM emp;

SELECT ename, sal, LPAD('��', round(sal/100), '��') as bar_chart
    FROM emp; -- PAD�� �̿��� ������ �ð�ȭ

    --     TRIM : ���� ��������
    --     RTRIM : ������ ���� ���� + �����ʿ��� �ݺ����� ����
    --     LTRIM : ���� ���� ���� + ���ʿ��� �ݺ����� ����

SELECT 'smith', LTRIM('smith','s'), RTRIM('smith','h'), TRIM('s' from 'smiths')
    FROM dual;
  
-- ROUND : �ݿø��ؼ� ����ϱ� ROUND(�ݿø� �� ����, �ݿø� �� �ڸ�)
SELECT '876.567' as ����, ROUND(876.567, 1)
    FROM dual;

-- TRUNC : �����ؼ� ����ϱ�
SELECT '876.567' as ����, TRUNC(876.567, 1)
    FROM dual;
    
-- MOD : ���� ������ �� ���
SELECT MOD(10, 3)
    FROM DUAL;

SELECT empno, MOD(empno, 2)
    FROM emp;

SELECT empno, ename
    FROM emp   
    WHERE MOD(empno, 2) = 0;
    
-- FLOOR : �� ���
SELECT FLOOR(10 / 3)   
    FROM DUAL;

-- MONTHS_BETWEEN : ��¥ �� ���� �� ���
SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
    FROM emp;
    
-- ADD_MONTHS : ���� �� ���� ��¥ ���
SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
    FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR_MM-DD') + 100
    FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '100' MONTH
    FROM DUAL;

-- NEXT_DAY : Ư�� ��¥ �ڿ� ���� ���� ��¥ ���
SELECT '2022/03/26' as ��¥, NEXT_DAY('2022/03/26', '��')
    FROM DUAL;
    
-- LAST_DAY : Ư�� ��¥�� �ִ� ���� ������ ��
SELECT '2019/05/22' as ��¥, LAST_DAY('2019/05/22') as "������ ��¥"
    FROM DUAL;
    
SELECT LAST_DAY(SYSDATE) - SYSDATE as "���� ��¥"
    FROM DUAL;
    
SELECT ename, hiredate, ROUND(SYSDATE - hiredate) as "���"
    FROM emp
    WHERE ename = 'KING';
    
SELECT ename, TO_CHAR(hiredate, 'DAY') as ����, TO_CHAR(sal, '999,999') as ����
    FROM emp
    WHERE ename = 'SCOTT';

-- IF ���� SQL�� ����
    
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as ���ʽ�
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

-- MAX : �ִ밪 ���
SELECT MAX(sal)
    FROM emp;

SELECT MAX(sal)
    FROM emp
    WHERE job = 'SALESMAN';





















    
    
    
    
    
    