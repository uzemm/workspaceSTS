--1.
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER 계정명 IDENTIFIED BY 비밀번호;
GRANT CONNECT, RESOURCE, CREATE VIEW TO 계정명;
ALTER USER 계정명 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

--2.
