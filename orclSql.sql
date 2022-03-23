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
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    