SELECT * FROM EMP;
SELECT ROWNUM, EMPNO 
FROM EMP
WHERE EMPNO NOT IN(1002);

SELECT ROWNUM --ORDER BY전에 순번 부여
    , EMPNO
    , ENAME
    , HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

SELECT EMPNO
    , ENAME
    , HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

SELECT ROWNUM
    , EMPNO
    , ENAME
    , HIREDATE
FROM 
(
    SELECT 
        EMPNO
        , ENAME
        , HIREDATE
    FROM EMP
    ORDER BY HIREDATE DESC
);

SELECT ROW_NUM
    , EMPNO 
    , ENAME
    , HIREDATE
FROM 
(
        SELECT ROWNUM AS ROW_NUM
        , EMPNO 
        , ENAME
        , HIREDATE
    FROM 
    (
        SELECT 
            EMPNO
            , ENAME
            , HIREDATE
        FROM EMP
        WHERE DEPTNO = 30
        ORDER BY HIREDATE DESC
    )
)
WHERE ROW_NUM >=1 AND ROW_NUM <= 5; --한페이지에 5개씩




SELECT ORDER_NUM
    , MEM_ID
    , MEM_NAME
    , BUY_DATE
    , ROW_NUM
FROM
(
        SELECT ORDER_NUM
        , MEM_ID
        , MEM_NAME
        , BUY_DATE
        , ROWNUM AS ROW_NUM
    FROM
    (
        SELECT DISTINCT ORDER_NUM
            , MEM_ID
            , (SELECT MEM_NAME
                FROM SHOP_MEMBER
                WHERE MEM_ID = SHOP_BUY.MEM_ID) AS MEM_NAME
                , TO_CHAR(BUY_DATE, 'YYYY-MM-DD HH24:MI') AS BUY_DATE
        FROM SHOP_BUY
        WHERE 1 = 1
        <if test="searchOrderNum != null and !searchOrderNum.equals('')">
        AND UPPER(ORDER_NUM) LIKE UPPER('%'||#{searchOrderNum}||'%')
        </if>
        <if test="searchBuyer != null and !searchBuyer.equals('')">
        AND (UPPER(MEM_ID) LIKE UPPER('%'||#{searchBuyer}||'%')
                OR
            UPPER((SELECT MEM_NAME
                FROM SHOP_MEMBER
                WHERE MEM_ID = SHOP_BUY.MEM_ID)) LIKE UPPER ('%'||#{searchBuyer}||'%'))
        </if>
        AND TO_CHAR(BUY_DATE, 'YYYY-MM-DD') &gt;= #{searchFromDate} AND TO_CHAR(BUY_DATE,'YYYY-MM-DD') &lt;= #{searchToDate}
        ORDER BY BUY_DATE DESC
    )
)

SELECT CB_BOARD_NUM
        , CB_BOARD_TITLE
        , CB_BOARD_DATE
        , MEM_ID
        , CLUB_CODE
        , MEM_NAME
        , CB_CMT_COUNT
    , ROW_NUM
FROM
(
        SELECT CB_BOARD_NUM
        , CB_BOARD_TITLE
        , CB_BOARD_DATE
        , MEM_ID
        , CLUB_CODE
        , MEM_NAME
        , CB_CMT_COUNT
        , ROWNUM AS ROW_NUM
    FROM
    (
        SELECT CB_BOARD_NUM
		    , CB_BOARD_TITLE
		    , TO_CHAR(CB_BOARD_DATE, 'YYYY-MM-DD') AS CB_BOARD_DATE
		    , MEM_ID
		    , CLUB_CODE
		    , MEM_NAME
		    , (SELECT COUNT(CB_CMT_NUM)
				FROM BOOK_CLUB_BOARD_COMMENT
				WHERE CB_BOARD_NUM = BOOK_CLUB_BOARD.CB_BOARD_NUM) AS CB_CMT_COUNT
		FROM BOOK_CLUB_BOARD
        WHERE CLUB_CODE = #{clubCode} 
		AND ${sort} LIKE '%'||#{keyword}||'%'
		ORDER BY CB_BOARD_NUM DESC
    )
)










