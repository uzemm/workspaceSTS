--INSERT INTO table(column1, column2, ...)
--SELECT value1, value2, ... FROM DUAL
--UNION ALL
--SELECT value1, value2, ... FROM DUAL
--UNION ALL
--...
--SELECT value1, value2, ... FROM DUAL;

CREATE TABLE ITEM_IMAGE (
    IMG_CODE VARCHAR2(50) PRIMARY KEY
    , ORIGIN_IMG_NAME VARCHAR2(200) --원본 파일명
    , ATTACHED_IMG_NAME VARCHAR2(200) --첨부된 파일명
    , IS_MAIN VARCHAR2(10) --대표 이미지 여부 'Y', 'N'
    , ITEM_CODE VARCHAR2(100) REFERENCES SHOP_ITEM (ITEM_CODE) ON DELETE CASCADE
);

INSERT INTO ITEM_IMAGE (IMG_CODE, ORIGIN_IMG_NAME, ATTACHED_IMG_NAME, IS_MAIN, ITEM_CODE)
SELECT '6', 'A.JPG', 'AAA_A.JPG', 'Y', 'ITEM_001' FROM DUAL
UNION ALL
SELECT '7', 'A.JPG', 'AAA_A.JPG', 'Y', 'ITEM_001' FROM DUAL
UNION ALL
SELECT '8', 'A.JPG', 'AAA_A.JPG', 'Y', 'ITEM_001' FROM DUAL;

SELECT * FROM ITEM_IMAGE;

SELECT 1,2,3 FROM DUAL
UNION ALL
SELECT 4,5,6 FROM DUAL
UNION ALL
SELECT 7,8,9 FROM DUAL
UNION
SELECT 7,8,9 FROM DUAL;