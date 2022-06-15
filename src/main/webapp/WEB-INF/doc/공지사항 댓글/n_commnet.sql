drop table n_comment;
/**********************************/
/* Table Name: 공지사항 댓글 */
/**********************************/
CREATE TABLE n_comment(
		commentno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL ,
    noticeno                      		NUMBER(10)		 NOT NULL ,
		content                         		VARCHAR2(300)	 NOT NULL,
		rdate                         		DATE		 DEFAULT sysdate NOT NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
);

COMMENT ON TABLE n_comment is '공지사항댓글';
COMMENT ON COLUMN notice.commentno is '공지사항 댓글번호';
COMMENT ON COLUMN notice.memberno is '회원번호';
COMMENT ON COLUMN notice.noticeno is '공지사항 글번호';
COMMENT ON COLUMN notice.content is '댓글내용';
COMMENT ON COLUMN notice.rdate is '작성일';

DROP SEQUENCE n_comment_seq;

CREATE SEQUENCE n_comment_seq     --noticeno 시퀀스
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

commit;