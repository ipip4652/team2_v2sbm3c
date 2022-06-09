drop table favorite;
/**********************************/
/* Table Name: 관심분야 */
/**********************************/
CREATE TABLE FAVORITE(
		favoriteno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		seqno                         		NUMBER(7)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cateno                        		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE FAVORITE is '관심분야';
COMMENT ON COLUMN FAVORITE.favoriteno is '관심 번호';
COMMENT ON COLUMN FAVORITE.seqno is '출력순서';
COMMENT ON COLUMN FAVORITE.rdate is '등록일';
COMMENT ON COLUMN FAVORITE.cateno is '카테고리 번호';
COMMENT ON COLUMN FAVORITE.memberno is '회원 번호';


DROP SEQUENCE favorite_seq;
CREATE SEQUENCE favorite_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
 
 
commit;