drop table contents;

/**********************************/
/* Table Name: 향수상품 */
/**********************************/
CREATE TABLE CONTENTS(
        CONTENTSNO                          NUMBER(10)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)       NULL ,
        cateno                              NUMBER(10)       NULL ,
        pcompany                            VARCHAR2(300)        NULL ,
        pname                               VARCHAR2(300)        NULL ,
        pcontent                            VARCHAR2(4000)       NULL ,
        PRICE                               NUMBER(10)       NULL ,
        WORD                                VARCHAR2(300)        NULL ,
        FILE1                               VARCHAR2(100)        NULL ,
        FILE1SAVED                          VARCHAR2(100)        NULL ,
        THUMB1                              VARCHAR2(100)        NULL ,
        SIZE1                               NUMBER(10)       NULL ,
        sex                                 CHAR(1)      NULL ,
        RDATE                               DATE         NOT NULL,
        SALECNT                             NUMBER(10)       NULL ,
  FOREIGN KEY (cateno) REFERENCES cate (cateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE CONTENTS is '향수상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '향수 번호';
COMMENT ON COLUMN CONTENTS.memberno is '회원번호';
COMMENT ON COLUMN CONTENTS.cateno is '카테고리 번호';
COMMENT ON COLUMN CONTENTS.pcompany is '향수회사명';
COMMENT ON COLUMN CONTENTS.pname is '향수이름';
COMMENT ON COLUMN CONTENTS.pcontent is '향수내용';
COMMENT ON COLUMN CONTENTS.PRICE is '판매가';
COMMENT ON COLUMN CONTENTS.WORD is '검색어';
COMMENT ON COLUMN CONTENTS.FILE1 is '메인 이미지';
COMMENT ON COLUMN CONTENTS.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN CONTENTS.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN CONTENTS.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN CONTENTS.sex is '성별';
COMMENT ON COLUMN CONTENTS.RDATE is '등록일';
COMMENT ON COLUMN CONTENTS.SALECNT is '수량';

