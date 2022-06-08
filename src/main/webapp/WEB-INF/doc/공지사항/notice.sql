DROP TABLE notice;
DROP SEQUENCE notice_seq;


/**********************************/
/* Table Name: 공지사항 게시판 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(1000)		 NOT NULL ,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10) default 0		 NOT NULL
);

COMMENT ON TABLE notice is '공지사항 게시판';
COMMENT ON COLUMN notice.noticeno is '게시판 번호';
COMMENT ON COLUMN notice.memberno is '회원번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.rdate is '작성일';
COMMENT ON COLUMN notice.cnt is '조회수';


CREATE SEQUENCE notice_seq     --noticeno 시퀀스
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (noticeno);
ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);

--공지 등록
insert into notice(noticeno, memberno, title, content, rdate)
values(notice_seq.nextval, 1 , '첫 번째 공지사항' ,'첫 번째 공지사항 테스트 team3', sysdate);

insert into notice(noticeno, memberno, title, content, rdate)
values(notice_seq.nextval, 1 , '두 번째 공지사항' ,'두 번째 공지사항 테스트 jh', sysdate);

insert into notice(noticeno, memberno, title, content, rdate)
values(notice_seq.nextval, 1 , '세 번째 공지사항' ,'세 번째 공지사항 테스트 jh', sysdate);

insert into notice(noticeno, memberno, title, content, rdate)
values(notice_seq.nextval, 1 , '네 번째 공지사항' ,'네 번째 공지사항 테스트 jh', sysdate);
commit;