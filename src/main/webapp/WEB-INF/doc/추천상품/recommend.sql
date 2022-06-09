drop table recom;
/**********************************/
/* Table Name: 추천상품 */
/**********************************/
CREATE TABLE recom(
		recomno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		contentsno                    		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE recom is '추천상품';
COMMENT ON COLUMN recom.recomno is '선호상품 번호';
COMMENT ON COLUMN recom.name is '선호상품이름';
COMMENT ON COLUMN recom.rdate is '등록일';
COMMENT ON COLUMN recom.contentsno is '향수 번호';
COMMENT ON COLUMN recom.memberno is '회원번호';

DROP SEQUENCE recommend_seq;
CREATE SEQUENCE recommend_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
commit;