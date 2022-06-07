/**********************************/
/* Table Name: 추천상품 */
/**********************************/
CREATE TABLE recommend(
        RECOMMENDNO                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        SEQNO                               NUMBER(7)         DEFAULT 1         NULL ,
        RDATE                                 DATE         NOT NULL,
        CONTENTSNO                      NUMBER(10)         NULL ,
        MEMBERNO                         NUMBER(10)         NULL ,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE recommend is '추천상품';
COMMENT ON COLUMN recommend.RECOMMENDNO is '추천상품번호';
COMMENT ON COLUMN recommend.SEQNO is '출력 순서';
COMMENT ON COLUMN recommend.RDATE is '등록일';
COMMENT ON COLUMN recommend.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN recommend.MEMBERNO is '회원 번호';

DROP SEQUENCE recommend_seq;
CREATE SEQUENCE recommend_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
commit;