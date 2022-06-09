drop table c_comment;
/**********************************/
/* Table Name: 상품댓글 */
/**********************************/
CREATE TABLE c_comment(
		commentno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		c_comment                       		VARCHAR2(300)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE c_comment is '상품댓글';
COMMENT ON COLUMN c_comment.commentno is '댓글번호';
COMMENT ON COLUMN c_comment.memberno is '회원번호';
COMMENT ON COLUMN c_comment.c_comment is '내용';
COMMENT ON COLUMN c_comment.rdate is '작성일';
COMMENT ON COLUMN c_comment.CONTENTSNO is '향수 번호';

DROP SEQUENCE c_comment_seq;
CREATE SEQUENCE c_comment_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
 
 
commit;