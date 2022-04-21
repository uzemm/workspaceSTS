DROP TABLE MEMBER_IMAGE;
DROP TABLE QNA_ANSWER;
DROP TABLE QNA;
DROP TABLE BOARD_COMMENT;
DROP TABLE BOARD;
DROP TABLE BOOK_CLUB_BOARD_COMMENT;
DROP TABLE BOOK_CLUB_BOARD;
DROP TABLE BOOK_CLUB_APPLY;
DROP TABLE BOOK_CLUB_LOGO;
DROP TABLE BOOK_CLUB;
DROP TABLE BOOK_COMMENT;
DROP TABLE BOOK_LIKE;
DROP TABLE BOOK_COMPLIT;
DROP TABLE BOOK_HOPE_APPLY;
DROP TABLE BOOK_HOPE;
DROP TABLE RESERVE;
DROP TABLE BUY;
DROP TABLE CART;
DROP TABLE BOOK_MEMBER;

--회원 테이블
CREATE TABLE BOOK_MEMBER (
    MEM_ID VARCHAR2(100) PRIMARY KEY
    , MEM_PWD VARCHAR2(100) NOT NULL
    , MEM_NAME VARCHAR2(100) NOT NULL
    , MEM_ADDR VARCHAR2(200) NOT NULL UNIQUE
    , MEM_TELL VARCHAR2(100) NOT NULL UNIQUE
    , MEM_EMAIL VARCHAR2(100) NOT NULL
    , MEM_IMAGE VARCHAR2(200)
    , MEM_GENDER VARCHAR(6) NOT NULL
    , MEM_BIRTH DATE NOT NULL
    , IS_DELETE VARCHAR2(6) DEFAULT 'N'
    , IS_ADMIN VARCHAR2(6) DEFAULT 'N'
    , CLUB_ADMIN VARCHAR2(6) DEFAULT 'N'
    , CLUB_CODE VARCHAR2(50)
);

--회원프로필 사진
CREATE TABLE MEMBER_IMAGE (
    MEM_IMG_CODE VARCHAR2(100) PRIMARY KEY
    , MEM_ORIGIN_NAME VARCHAR2(200) NOT NULL
    , MEM_AT_IMG_NAME VARCHAR2(200) NOT NULL
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID) ON DELETE CASCADE
);
--QNA 게시판
CREATE TABLE QNA (
    QNA_NUM VARCHAR2(50) PRIMARY KEY
    , QNA_TITLE VARCHAR2(300) NOT NULL
    , QNA_CONTENT VARCHAR2(1000) NOT NULL
    , QNA_CREATE_DATE DATE DEFAULT SYSDATE
    , QNA_IS_PRIVATE VARCHAR2(6) DEFAULT 'N'
    , QNA_PW VARCHAR2(100)
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);
--QNA 답변
CREATE TABLE QNA_ANSWER (
    ANSWER_NUM VARCHAR2(50) PRIMARY KEY
    , ANSWER_CONTENT VARCHAR2(1000) NOT NULL
    , QNA_NUM VARCHAR2(50) REFERENCES QNA (QNA_NUM)
        ON DELETE CASCADE
);
--자유게시판
CREATE TABLE BOARD (
    BOARD_NUM VARCHAR2(50) PRIMARY KEY
    , BOARD_TITLE VARCHAR2(300) NOT NULL
    , BOARD_CONTENT VARCHAR2(1000) NOT NULL
    , BOARD_READ_CNT NUMBER NOT NULL
    , BOARD_CREATE_DATE DATE DEFAULT SYSDATE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);

--자유게시판 댓글
CREATE TABLE BOARD_COMMENT (
    COMMENT_NUM VARCHAR2(100) PRIMARY KEY
    , COMMENT_CONTENT VARCHAR2(500) NOT NULL
    , COMMENT_DATE DATE DEFAULT SYSDATE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
    , BOARD_NUM VARCHAR2(50) REFERENCES BOARD (BOARD_NUM)
        ON DELETE CASCADE
);

--북클럽
CREATE TABLE BOOK_CLUB (
   CLUB_CODE   VARCHAR2(50) PRIMARY KEY
   , CLUB_NAME   VARCHAR2(100) NOT NULL
   , CLUB_HEAD_CNT   NUMBER   NOT NULL
   , CLUB_NUMBER_PEOPLE NUMBER DEFAULT 1
   , CLUB_COMPLIT_CNT NUMBER DEFAULT 0
   , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID) ON DELETE CASCADE
    , MEM_NAME VARCHAR2(100) NOT NULL
   , CLUB_INTRO   VARCHAR2(200) 
    , CLUB_DATE DATE DEFAULT SYSDATE
);

--북클럽 승인
CREATE TABLE BOOK_CLUB_APPLY(
    CLUB_APPLY_CODE VARCHAR2(50) PRIMARY KEY
    , CLUB_CODE VARCHAR2(50) REFERENCES BOOK_CLUB (CLUB_CODE) ON DELETE CASCADE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID) ON DELETE CASCADE
    , MEM_NAME VARCHAR2(100) NOT NULL
);

--북클럽로고
CREATE TABLE BOOK_CLUB_LOGO(
    CB_LOGO_IMG_CODE VARCHAR2(100)  PRIMARY KEY
    , CB_ORIGIN_NAME VARCHAR2(200) NOT NULL
    , CB_AT_IMG_NAME VARCHAR2(200) NOT NULL
    , CLUB_CODE VARCHAR2(50) REFERENCES BOOK_CLUB (CLUB_CODE) ON DELETE CASCADE
);

--북클럽게시판
CREATE TABLE BOOK_CLUB_BOARD(
    CB_BOARD_NUM VARCHAR2(50) PRIMARY KEY
    , CB_BOARD_TITLE VARCHAR2(500) NOT NULL
    , CB_BOARD_CONTENT VARCHAR2(1000) NOT NULL
    , CB_BOARD_DATE DATE DEFAULT SYSDATE 
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID) 
    ON DELETE CASCADE
    , MEM_NAME VARCHAR2(100) NOT NULL
    , CLUB_CODE VARCHAR2(50) REFERENCES BOOK_CLUB (CLUB_CODE) 
    ON DELETE CASCADE
);

--북클럽게시판 댓글
CREATE TABLE BOOK_CLUB_BOARD_COMMENT(
    CB_CMT_NUM VARCHAR2(100) PRIMARY KEY
    , CB_CMT_CONTENT VARCHAR2(500) NOT NULL
    , CB_CMT_DATE DATE DEFAULT SYSDATE 
    , MEM_ID VARCHAR2(50) REFERENCES BOOK_MEMBER (MEM_ID) 
    ON DELETE CASCADE
    , MEM_NAME VARCHAR2(100) NOT NULL
    , MEM_IMAGE VARCHAR2(200)
    , CB_BOARD_NUM VARCHAR2(50) REFERENCES BOOK_CLUB_BOARD (CB_BOARD_NUM) 
    ON DELETE CASCADE
);


--도서 리뷰
CREATE TABLE BOOK_COMMENT (
    REVIEW_NUM VARCHAR2(100) PRIMARY KEY
    , REVIEW_CONTENT VARCHAR2(1000) NOT NULL
    , BOOK_CODE VARCHAR2(50) REFERENCES BOOK (BOOK_CODE)
        ON DELETE CASCADE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);

--도서 찜
CREATE TABLE BOOK_LIKE (
    LIKE_CODE VARCHAR2(100) PRIMARY KEY
    , IS_LIKE VARCHAR2(10) DEFAULT 'N'
    , LIKE_DATE DATE DEFAULT SYSDATE
    , BOOK_CODE VARCHAR2(50) REFERENCES BOOK (BOOK_CODE)
        ON DELETE CASCADE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);

--완독 도서
CREATE TABLE BOOK_COMPLIT (
    COMPLIT_CODE VARCHAR2(100) PRIMARY KEY
    , COMPLIT_DATE DATE DEFAULT SYSDATE
    , BOOK_CODE VARCHAR2(50) REFERENCES BOOK (BOOK_CODE)
        ON DELETE CASCADE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);

--희망도서
CREATE TABLE BOOK_HOPE (
    HOPE_CODE VARCHAR2(50) PRIMARY KEY
    , HOPE_NAME VARCHAR2(100) NOT NULL
    , HOPE_WRITER VARCHAR2(100) NOT NULL
    , HOPE_PUBLISHER VARCHAR2(100) NOT NULL
    , HOPE_DATE DATE DEFAULT SYSDATE
    , IS_HOPE VARCHAR2(10) DEFAULT 'N'
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);

--희망도서승인
CREATE TABLE BOOK_HOPE_APPLY (
    HOPE_APPLY_CODE VARCHAR2(50) PRIMARY KEY
    , HOPE_STATUS NUMBER DEFAULT 0
    , HOPE_APPLY_DATE DATE DEFAULT SYSDATE
    , HOPE_CODE VARCHAR2(50) REFERENCES BOOK_HOPE (HOPE_CODE)
        ON DELETE CASCADE
);
--예약
CREATE TABLE RESERVE (
    RESERVE_CODE VARCHAR2(100) PRIMARY KEY
    , APPLI_DATE DATE DEFAULT SYSDATE
    , IS_RESERVE VARCHAR2(10) DEFAULT 'N'
    , RESERVE_DATE DATE NOT NULL
    , RETURN_DATE DATE NOT NULL
    , BOOK_CODE VARCHAR2(50) REFERENCES BOOK (BOOK_CODE)
        ON DELETE CASCADE
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
        ON DELETE CASCADE
);
--구매
CREATE TABLE BUY (
    BUY_NUM NUMBER PRIMARY KEY
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID)
    , ITEM_CODE VARCHAR2(100) REFERENCES ITEM (ITEM_CODE)
    , ITEM_CNT NUMBER
    , BUY_PRICE NUMBER
    , BUY_DATE DATE DEFAULT SYSDATE
    , ORDER_NUM VARCHAR2(100)
    , MEM_ADDR VARCHAR2(200) REFERENCES BOOK_MEMBER (MEM_ADDR) NOT NULL
    , MEM_TELL VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_TELL) NOT NULL
    , PAY_CODE VARCHAR2(50) 
);

--장바구니
CREATE TABLE CART (
    CART_NUM NUMBER PRIMARY KEY
    , ITEM_CODE VARCHAR2(100) REFERENCES ITEM (ITEM_CODE) NOT NULL
    , MEM_ID VARCHAR2(100) REFERENCES BOOK_MEMBER (MEM_ID) NOT NULL
    , ITEM_CNT NUMBER NOT NULL
    , CREATE_DATE DATE DEFAULT SYSDATE    
); 

COMMIT;