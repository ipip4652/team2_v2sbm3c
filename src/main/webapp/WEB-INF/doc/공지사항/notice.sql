drop table notice;
/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(30)		 NOT NULL,
		content                       		VARCHAR2(300)		 NULL ,
		rdate                         		DATE		 NULL ,
		cnt                           		NUMBER(7)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '게시판번호';
COMMENT ON COLUMN notice.memberno is '회원번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.rdate is '작성일';
COMMENT ON COLUMN notice.cnt is '조회수';

DROP SEQUENCE notice_seq;

CREATE SEQUENCE notice_seq     --noticeno 시퀀스
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

commit;