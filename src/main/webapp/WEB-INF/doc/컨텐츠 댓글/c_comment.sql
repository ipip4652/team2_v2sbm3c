drop table c_comment;
DROP SEQUENCE c_comment_seq;

/**********************************/
/* Table Name: 컨텐츠 댓글 */
/**********************************/
CREATE TABLE c_comment(
		commentno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL ,
    contentsno                      		NUMBER(10)		 NOT NULL ,
		content                         		VARCHAR2(300)	 NOT NULL,
		rdate                         		DATE		 DEFAULT sysdate NOT NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno)
);

COMMENT ON TABLE c_comment is '컨텐츠 댓글';
COMMENT ON COLUMN c_commnet.commentno is '컨텐츠 댓글번호';
COMMENT ON COLUMN c_commnet.memberno is '회원번호';
COMMENT ON COLUMN c_commnet.contentsno is '컨텐츠 글번호';
COMMENT ON COLUMN c_commnet.content is '댓글내용';
COMMENT ON COLUMN c_commnet.rdate is '작성일';


CREATE SEQUENCE c_comment_seq     --noticeno 시퀀스
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

commit;