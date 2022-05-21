INSERT INTO BOOK_MEMBER VALUES('admin', '1111', '모임장', '울산', '1111', '1111', null, '남', '2022/04/18' ,  'N', 'Y', 'Y', null );
update borrow
set rt_date='2022/05/13'
where br_code='BR002';


select * from book_member;
select * from book_club;
select * from book_club_board_comment;
select * from book_club_board;
select * from message
order by send_date desc;
select * from BORROW;
select * from book;
SELECT * FROM BOOK_CLUB_APPLY;
select * from book_complit;
select * from reserve;
SELECT * FROM BOOK_COMPLIT;
SELECT * FROM BOOK_IMAGE;
select * from MONTHLY_BOOK;
select * from hope_book;

SELECT MEM_ID
    , MEM_NAME
    , MEM_IMAGE
    , CLUB_CODE
    , BOOK_COMPLIT_CNT
  FROM (
         SELECT MEM_ID
                , MEM_NAME
                , MEM_IMAGE
                , CLUB_CODE
                , (SELECT COUNT(COMPLIT_CODE)
                            FROM BOOK_COMPLIT
                            WHERE MEM_ID = BM.MEM_ID
                            AND to_char(LOCALTIMESTAMP,'yyyy/mm') || '/01' >= COMPLIT_DATE
                            AND to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy/mm/dd') <= COMPLIT_DATE
                            ) AS BOOK_COMPLIT_CNT
            FROM BOOK_MEMBER BM
            WHERE CLUB_CODE = 'CLUB_001'
            ORDER BY BOOK_COMPLIT_CNT DESC
       )
 WHERE rownum = 1;
 
         SELECT MEM_ID
                , MEM_NAME
                , MEM_IMAGE
                , CLUB_CODE
                , (SELECT COUNT(COMPLIT_CODE)
                            FROM BOOK_COMPLIT
                            WHERE MEM_ID = BM.MEM_ID
                            AND to_char(LOCALTIMESTAMP,'yyyy/mm') || '/01' >= COMPLIT_DATE
                            AND to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy/mm/dd') <= COMPLIT_DATE
                            ) AS BOOK_COMPLIT_CNT
            FROM BOOK_MEMBER BM
            WHERE CLUB_CODE = 'CLUB_001'
            ORDER BY BOOK_COMPLIT_CNT DESC;

delete MONTHLY_BOOK
where club_code = 'CLUB_011';

select * from MONTHLY_BOOK
where club_code = 'CLUB_007';

delete book_club
where club_code = 'CLUB_007';

update MONTHLY_BOOK
set 
club_code = 'CLUB_001'
WHERE MB_CODE = 'MB_001';

update book_member
set
club_admin = 'N'
where mem_id = 'java4';

select * from book_club_board
where cb_pin = 1;

SELECT COUNT(COMPLIT_CODE)
		FROM BOOK_COMPLIT
		WHERE MEM_ID = #{memId}

DELETE BOOK_CLUB
WHERE CLUB_CODE = 'CLUB_001';
update book_member
set
club_admin = 'N'
where mem_id = 'java3';

select count(msg_code)
from message
where get_id = 'java1'
AND IS_READ = 'Y';

SELECT MEM_ID
    , MEM_NAME
    , MEM_IMAGE
    , CLUB_CODE
    , (SELECT COUNT(COMPLIT_CODE)
                FROM BOOK_COMPLIT
                WHERE MEM_ID = BM.MEM_ID
                AND to_char(LOCALTIMESTAMP,'yyyy/mm') || '/01' >= COMPLIT_DATE
                AND to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy/mm/dd') <= COMPLIT_DATE
                ) AS BOOK_COMPLIT_CNT
FROM BOOK_MEMBER BM
WHERE CLUB_CODE = 'CLUB_001'
and rownum <= 3;


SELECT BM.MEM_ID
    , MEM_NAME
    , MEM_IMAGE
    , CLUB_CODE
    , CLUB_ADMIN
    , (SELECT COUNT(COMPLIT_CODE)
		FROM BOOK_COMPLIT
        WHERE MEM_ID = 'java1'
		AND to_char(LOCALTIMESTAMP,'yyyy/mm') || '/01' >= COMPLIT_DATE
		AND to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy/mm/dd') <= COMPLIT_DATE
        ) AS BOOK_COMPLIT_CNT
FROM BOOK_MEMBER BM
WHERE CLUB_CODE = 'CLUB_001'
ORDER BY MEM_ID;

		SELECT COUNT(COMPLIT_CODE)
		FROM BOOK_COMPLIT
		WHERE MEM_ID = #{memId}
		AND to_char(LOCALTIMESTAMP,'yyyy/mm') || '/01' &lt;= COMPLIT_DATE
		AND to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy/mm/dd') &gt;= COMPLIT_DATE

SELECT MSG_CODE
    , SEND_ID
    , GET_ID
    , SEND_DATE
    , MSG_CONTENT
    , IS_READ
FROM MESSAGE
WHERE MSG_CODE = 'MSG_001';

ALTER TABLE BOOK_MEMBER DROP COLUMN CLUB_APPLY_CODE;
ALTER TABLE BOOK_CLUB_BOARD ALTER COLUMN CB_BOARD_DATE DATE DEFAULT LOCALTIMESTAMP;
SELECT CLUB_CODE
FROM BOOK_CLUB_APPLY;

SELECT CLUB_APPLY_CODE
FROM BOOK_CLUB_APPLY
WHERE MEM_ID = 'java5';

delete message
where get_id is null;

--실시간랭킹<완독수>
SELECT COUNT(COMPLIT_CODE)
FROM BOOK_COMPLIT
WHERE MEM_ID = 'test02'
AND to_char(LOCALTIMESTAMP,'yyyy/mm') || '/01' &lt;= COMPLIT_DATE
AND to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy/mm/dd') &gt;= COMPLIT_DATE;

select to_char(LOCALTIMESTAMP,'yyyy-mm') || '-01' as 이번달시작일 from dual; 
select to_char(LAST_DAY(LOCALTIMESTAMP),'yyyy-mm-dd') as 이번달마지막일 from dual; 

--북클럽 신청 취소
delete BOOK_CLUB_APPLY
where mem_ID = 'java7';

--마이페이지 북클럽 신청 조회
select bca.club_code
    , club_apply_code
    , bc.club_name
    , bca.mem_id
    , to_char(club_apply_date, 'yyyy/mm/dd') as club_apply_date
from BOOK_CLUB_APPLY BCA , book_club bc
where bca.club_code = bc.club_code
AND bca.MEM_ID = 'java5';

--북클럽 신청했으면 가입신청 x
select CLUB_APPLY_CODE
    , mem_id
from BOOK_CLUB_APPLY
where mem_id = 'java5';

	<select id="selectMyBookClub" resultMap="clubMapper.apply">
		SELECT BCA.CLUB_CODE
			, CLUB_APPLY_CODE
			, BCA.MEM_ID
			, TO_CHAR(CLUB_APPLY_DATE, 'YYYY/MM/DD') AS CLUB_APPLY_DATE
			, BC.CLUB_NAME
		FROM BOOK_CLUB_APPLY BCA , BOOK_CLUB BC
		WHERE BCA.CLUB_CODE = BC.CLUB_CODE
		AND BCA.MEM_ID = #{memId}
	</select>

--대여정보
SELECT BR_CODE
    , MEM_ID
    , BR_DATE
    , RT_DATE
    , STATUS
    , BOOK_CODE
FROM BORROW
WHERE MEM_ID = 'java1';

--희망도서 수락
INSERT INTO MESSAGE (
    MSG_CODE
    , GET_ID
    , MSG_CONTENT
) VALUES (
    (SELECT 'MSG_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(MSG_CODE, 5))), 0) + 1, 3, 0) AS MSG_CODE FROM MESSAGE)
    , #{getId}
    , 'ㅇㅇㅇ님이 신청하신 책이 도서관에 도착했습니다. 오늘부터 대출 가능합니다.'
)		

		INSERT INTO MESSAGE (
			MSG_CODE
			, GET_ID
			, MSG_CONTENT
		) VALUES (
			(SELECT 'MSG_'||LPAD(NVL(MAX(TO_NUMBER(SUBSTR(MSG_CODE, 5))), 0) + 1, 3, 0) AS MSG_CODE FROM MESSAGE)
			, #{getId}
			, '신청한 북클럽에 가입되셨습니다. 북클럽 게시판에 첫 글을 올려보세요!'
		)	


insert into message (msg_code, get_id, msg_content) values ('msg_004', 'java1', '북클럽에 가입신청이 수락되었습니다. 많은 활동 부탁드립니다.');

delete message
where msg_code = 'msg_004';

select count(cb_cmt_num)
from book_club_board_comment
where cb_board_num = 'CB_BOARD_004';

update book_member
set
is_admin = 'Y'
where mem_id = 'admin';

select * from book_club_apply;

select COUNT(MEM_ID) 
from book_member 
where club_code = 'CLUB_001';

delete book_club_apply;
SELECT MEM_ID
        , MEM_NAME
        , ROW_NUM
    FROM
    (
        SELECT MEM_ID
             , MEM_NAME
             , ROW_NUM
            , ROWNUM AS ROW_NUM
        FROM
		    (
		        SELECT MEM_ID
                    , MEM_NAME
		        FROM BOOK_MEMBER
		        WHERE 1=1
		        <if test="keyword != null and !keyword.equals('')">
		        AND UPPER(MEM_ID) LIKE UPPER('%'||#{keyword}||'%')
		        </if>
		        ORDER BY MEM_ID
		    )
		)
		WHERE ROW_NUM &gt; = #{startNum} AND ROW_NUM &lt; =  #{endNum}





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