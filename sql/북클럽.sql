INSERT INTO BOOK_MEMBER VALUES('admin', '1111', '모임장', '울산', '1111', '1111', null, '남', '2022/04/18' ,  'N', 'Y', 'Y', null );

select * from book_member;
update book_member
set
is_admin = 'Y'
where mem_id = 'admin';

select * from book_club_apply;

select COUNT(MEM_ID) 
from book_member 
where club_code = 'CLUB_001';

delete book_club_apply;

--북클럽조회
SELECT CLUB_CODE
    , CLUB_NAME
    , CLUB_HEAD_CNT
    , CLUB_INTRO
    , CLUB_DATE 
    , mem_id
    , mem_name
FROM BOOK_CLUB
ORDER BY CLUB_DATE;

select * from book_club_board;

--북클럽 등록
INSERT INTO BOOK_CLUB (  
    CLUB_CODE
    , CLUB_NAME
    , CLUB_HEAD_CNT
    , CLUB_INTRO
) VALUES (
    SELECT(CLUB_CODE, 
    , #{clubName}
    , #{clubHeadCnt}
    , #{clubIntro}
)
INSERT INTO BOOK_CLUB (CLUB_NAME, CLUB_HEAD_CNT, CLUB_INTRO) VALUES ('자바', 10, '반갑습니다');

SELECT 'CLUB_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(CLUB_CODE, 6))), 0) + 1, 3, 0) AS CLUB_CODE
FROM BOOK_CLUB;

--이때 함께 클럽어드민 부여
UPDATE BOOK_MEMBER
SET
CLUB_ADMIN = 'Y'
WHERE MEM_ID = #{memId};

MERGE INTO BOOK_MEMBER
USING DUAL
ON (CLUB_CODE = #{clubCode} AND MEM_ID = #{memId})
WHEN MATCHED THEN
    UPDATE
    SET;
    




--클럽어드민 클럽회원 리스트 조회
SELECT BC.MEM_ID
    , BC.MEM_NAME
    , BM.MEM_AT_IMG_NAME
FROM BOOK_CLUB BC, BOOK_MEMBER BM
WHERE BC.MEM_ID = BM.MEM_ID
AND CLUB_CODE = #{clubCode}
ORDER BY MEM_NAME;


--회원 리스트 조회
SELECT MEM_NAME
    , MEM_IMAGE
    , CLUB_CODE
FROM BOOK_MEMBER
WHERE CLUB_CODE = #{clubCode};


--게시판 조회
SELECT CB_BOARD_NUM
    , CB_BOARD_TITLE
    , CB_BOARD_DATE
    , MEM_ID
FROM BOOK_CLUB_BOARD
WHERE CLUB_CODE = #{clubCode};

SELECT 'CB_BOARD_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(CB_BOARD_NUM, 10))), 0) + 1, 3, 0) AS CB_BOARD_NUM 
FROM BOOK_CLUB_BOARD;

select * from BOOK_CLUB_BOARD;

--게시판 등록
INSERT INTO CLUB_BOOK_BOARD(
    CB_BOARD_NUM
    , CB_BOARD_TITLE
    , CB_BOARD_CONTENT
    , CB_BOARD_DATE
    , CLUB_CODE
) VALUES (
    #{cbBoardNum}
    , #{cbBoardTitle}
    , #{cbBoardContent}
    , #{cbBoardDate}
    , #{clubCode}
);















INSERT INTO BOOK_MEMBER (MEM_ID, MEM,PWD, MEM_NAME, MEM_ADDR, MEM_TELL, MEM_EMAIL, IS_ADMIN, CLUB_ADMIN) VALUES ('admin', '1111', '관리자', 'Y', 'Y');