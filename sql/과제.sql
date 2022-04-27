CREATE TABLE TEST_BOARD (
    BOARD_NUM NUMBER PRIMARY KEY
    , BOARD_TITLE VARCHAR2(200) NOT NULL
    , BOARD_CONTENT VARCHAR2(500)
    , BOARD_WRITER VARCHAR2(100) NOT NULL
    , CREATE_DATE DATE DEFAULT SYSDATE
);

DROP TABLE TEST_MEMBER;
SELECT * FROM TEST_MEMBER;

CREATE TABLE TEST_MEMBER (
    MEMBER_ID VARCHAR2(100) PRIMARY KEY
    , MEMBER_PASSWORD VARCHAR2(100) NOT NULL
    , MEMBER_NAME VARCHAR2(100) NOT NULL
    , MEMBER_AGE NUMBER
    , MEMBER_ADDR VARCHAR2(300)
    , MEMBER_BIRTHDAY DATE
    , ADMIN_YN VARCHAR2(6) DEFAULT 'N'
);

SELECT TO_CHAR(MEMBER_BIRTHDAY, 'YYYY"년" MM"월" DD"일"') AS MEMBER_BIRTHDAY FROM TEST_MEMBER;

INSERT INTO TEST_MEMBER VALUES ('tester01', '1111', '테스터01', 20, '서울시', TO_DATE('19900101', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester02', '1111', '테스터02', 21, '서울시', TO_DATE('19900201', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester03', '1111', '테스터03', 22, '서울시', TO_DATE('19900301', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester04', '1111', '테스터04', 23, '대구시', TO_DATE('19900401', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester05', '1111', '테스터05', 24, '대구시', TO_DATE('19900501', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester06', '1111', '테스터06', 25, '부산시', TO_DATE('19900601', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester07', '1111', '테스터07', 26, '부산시', TO_DATE('19900701', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester08', '1111', '테스터08', 27, '울산시', TO_DATE('19900801', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('tester09', '1111', '테스터09', 28, '울산시', TO_DATE('19900901', 'YYYYMMDD'), 'N');
INSERT INTO TEST_MEMBER VALUES ('admin01', '0000', '관리자01', 29, '울산시', TO_DATE('19901001', 'YYYYMMDD'), 'Y');
INSERT INTO TEST_MEMBER VALUES ('admin02', '0000', '관리자02', 29, '울산시', TO_DATE('19901001', 'YYYYMMDD'), 'Y');



SELECT MEMBER_ID
    , MEMBER_PASSWORD
    , MEMBER_NAME
    , MEMBER_AGE
    , MEMBER_ADDR
    , MEMBER_BIRTHDAY
    , ADMIN_YN
FROM 
(
    SELECT MEMBER_ID
        , MEMBER_PASSWORD
        , MEMBER_NAME
        , MEMBER_AGE
        , MEMBER_ADDR
        , TO_CHAR(MEMBER_BIRTHDAY, 'YYYY"년" MM"월" DD"일"') AS MEMBER_BIRTHDAY
        , ADMIN_YN
    FROM TEST_MEMBER
    ORDER BY MEMBER_ADDR DESC
)
WHERE ADMIN_YN = 'N'
ORDER BY MEMBER_ID;

---------------------------------

CREATE TABLE TEST_DEPARTMENT(
	DEPTNO VARCHAR2(50) PRIMARY KEY
	, DNAME VARCHAR2(50) NOT NULL
	, REGION VARCHAR2(50) NOT NULL
);
delete TEST_DEPARTMENT;
delete TEST_EMP;
select * from TEST_DEPARTMENT order by deptno;
delete TEST_EMP where ename = '홍길동';
DROP TABLE TEST_EMP;
select * from test_emp;

CREATE TABLE TEST_EMP(
	EMPNO VARCHAR2(50) PRIMARY KEY
	, ENAME VARCHAR2(50) NOT NULL
	, JOB VARCHAR2(50) NOT NULL
	, EAGE NUMBER NOT NULL
    , GENDER VARCHAR2(50) NOT NULL
	, TELL VARCHAR2(50) 
	, DEPTNO VARCHAR2(50) REFERENCES TEST_DEPARTMENT (DEPTNO) ON DELETE CASCADE
);

CREATE TABLE MENU(
    MENU_CODE VARCHAR2(50) PRIMARY KEY
    , MENU_NAME VARCHAR2(100) NOT NULL 
    , MENU_URI VARCHAR2(100) NOT NULL
);

INSERT INTO MENU VALUES ('MENU_001', '부서관리', 'deptManage');
INSERT INTO MENU VALUES ('MENU_002', '사원등록', 'empEnrollment');
INSERT INTO MENU VALUES ('MENU_003', '사원목록', 'empList');

SELECT * FROM TEST_DEPARTMENT;

















