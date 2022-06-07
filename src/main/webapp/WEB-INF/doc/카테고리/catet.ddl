/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.rdate is '등록일';
COMMENT ON COLUMN cate.cnt is '관련 자료수';


/**********************************/
/* Table Name: 컨텐츠 - 영화 상품 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		CATENO                        		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		RECOM                         		NUMBER(7)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		REPLYCNT                      		NUMBER(7)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR2(100)		 NULL ,
		FILE1SAVED                    		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
		PRICE                         		NUMBER(10)		 NULL ,
		DC                            		NUMBER(10)		 NULL ,
		SALEPRICE                     		NUMBER(10)		 NULL ,
		POINT                         		NUMBER(10)		 NULL ,
		SALECNT                       		NUMBER(10)		 NULL ,
		cateno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE CONTENTS is '컨텐츠 - 영화 상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN CONTENTS.ADMINNO is '관리자 번호';
COMMENT ON COLUMN CONTENTS.CATENO is '카테고리 번호';
COMMENT ON COLUMN CONTENTS.TITLE is '제목';
COMMENT ON COLUMN CONTENTS.CONTENT is '내용';
COMMENT ON COLUMN CONTENTS.RECOM is '추천수';
COMMENT ON COLUMN CONTENTS.CNT is '조회수';
COMMENT ON COLUMN CONTENTS.REPLYCNT is '댓글수';
COMMENT ON COLUMN CONTENTS.PASSWD is '패스워드';
COMMENT ON COLUMN CONTENTS.WORD is '검색어';
COMMENT ON COLUMN CONTENTS.RDATE is '등록일';
COMMENT ON COLUMN CONTENTS.FILE1 is '메인 이미지';
COMMENT ON COLUMN CONTENTS.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN CONTENTS.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN CONTENTS.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN CONTENTS.PRICE is '정가';
COMMENT ON COLUMN CONTENTS.DC is '할인률';
COMMENT ON COLUMN CONTENTS.SALEPRICE is '판매가';
COMMENT ON COLUMN CONTENTS.POINT is '포인트';
COMMENT ON COLUMN CONTENTS.SALECNT is '수량';
COMMENT ON COLUMN CONTENTS.cateno is '카테고리 번호';


