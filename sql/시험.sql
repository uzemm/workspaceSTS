CREATE TABLE MEMBER (
    MEM_NUM NUMBER PRIMARY KEY
    , MEM_ID VARCHAR2(50) NOT NULL
    , MEM_NAME VARCHAR2(50) NOT NULL
    , MEM_PW VARCHAR2(50) NOT NULL
    , MEM_TELL VARCHAR2(50) NOT NULL
);
INSERT INTO MEMBER VALUES(1, '1', '1', '1,', '1');
INSERT INTO MEMBER VALUES(2, 'java', 'java', '1,', '1');
DROP TABLE CINEMA;
CREATE TABLE CINEMA(
    CINEMA_NUM NUMBER PRIMARY KEY
    , CINEMA_NAME VARCHAR2(50) NOT NULL
    , MOVIE_NAME VARCHAR2(100) NOT NULL
);
INSERT INTO CINEMA VALUES(2, 'VIP', '어벤져스:인피니티 자바');
DROP TABLE SEAT;
CREATE TABLE SEAT(
    SEAT_NUM NUMBER PRIMARY KEY
    , ROW_NUM NUMBER NOT NULL
    , COL_NUM NUMBER NOT NULL
    , IS_SEAT VARCHAR2(50) DEFAULT 'N'
    , CINEMA_NUM NUMBER REFERENCES CINEMA (CINEMA_NUM)
);
INSERT INTO SEAT VALUES(1, 1, 1, 'N', 2);
select * from seat;
DROP TABLE RESERVE;
CREATE TABLE RESERVE(
    RESERVE_NUM NUMBER PRIMARY KEY
    , MEM_NUM NUMBER REFERENCES MEMBER (MEM_NUM)
    , CINEMA_NUM NUMBER REFERENCES CINEMA (CINEMA_NUM)
    , SEAT_NUM NUMBER REFERENCES SEAT (SEAT_NUM)
);

SELECT RESERVE_NUM
    , CINEMA_NUM
    , SEAT_NUM
FROM RESERVE
WHERE MEM_NUM = (SELECT MEM_NUM FROM MEMBER WHERE MEM_ID = 'java');
select * from cinema;
SELECT CINEMA_NUM
FROM CINEMA
WHERE CINEMA_NAME = 'VIP'
AND MOVIE_NAME = '어벤져스:인피니티 자바';

SELECT DECODE(IS_SEAT, ‘N’, ‘예매가능’, '예매할 수 있는 좌석이 없습니다.’) AS ‘예매가능여부’
FROM SEAT
WHERE CINEMA_NUM = (SELECT CINEMA_NUM FROM CINEMA WHERE CINEMA_NAME = 'VIP' AND MOVIE_NAME = '어벤져스:인피니티 자바');

select cinema;
SELECT CINEMA_NUM
FROM CINEMA
WHERE CINEMA_NAME = 'VIP';

AND MOVIE_NAME = '어벤져스:인피니티 자바';






















