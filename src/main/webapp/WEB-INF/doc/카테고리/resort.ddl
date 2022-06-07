/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL,
		categrpno                     		NUMBER(10)		 NULL ,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.rdate is '등록일';
COMMENT ON COLUMN cate.cnt is '관련 자료수';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원 번호';


/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL,
		cateno                        		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.cateno is '카테고리 번호';
COMMENT ON COLUMN contents.memberno is '회원 번호';



ALTER TABLE categrp ADD CONSTRAINT IDX_categrp_PK PRIMARY KEY (categrpno);

ALTER TABLE cate ADD CONSTRAINT IDX_cate_PK PRIMARY KEY (cateno);
ALTER TABLE cate ADD CONSTRAINT IDX_cate_FK0 FOREIGN KEY (categrpno) REFERENCES categrp (categrpno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (memberno);

ALTER TABLE contents ADD CONSTRAINT IDX_contents_PK PRIMARY KEY (contentsno);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK0 FOREIGN KEY (cateno) REFERENCES cate (cateno);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);

