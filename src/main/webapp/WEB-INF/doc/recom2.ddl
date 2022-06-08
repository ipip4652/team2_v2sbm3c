drop table contents;
drop table cate;
drop table member;
/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
        memberno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
        ID                                  VARCHAR2(20)         NOT NULL,
        passwd                              VARCHAR2(150)        NOT NULL,
        mname                               VARCHAR2(30)         NOT NULL,
        tel                                 VARCHAR2(14)         NOT NULL,
        zipcode                             VARCHAR2(5)      NULL ,
        address1                            VARCHAR2(80)         NULL ,
        address2                            VARCHAR2(50)         NULL ,
        mdate                               DATE         NOT NULL,
        GRADE                               NUMBER(2)        NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';
COMMENT ON COLUMN member.ID is '아이디';
COMMENT ON COLUMN member.passwd is '패스워드';
COMMENT ON COLUMN member.mname is '성명';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.zipcode is '우편번호';
COMMENT ON COLUMN member.address1 is '주소';
COMMENT ON COLUMN member.address2 is '상세주소';
COMMENT ON COLUMN member.mdate is '가입일';
COMMENT ON COLUMN member.GRADE is '등급';

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;
    
--관리자 추가 (grade = '1')
insert into member(memberno, id, passwd,mname,tel,zipcode, address1, address2, mdate, grade)
values(member_seq.nextval, 'admin' ,'1234', 'admin', '123-4567-8912', '123-1', '서울시', '종로구', sysdate, 0);

--회원 추가 (grade = '11')
insert into member(memberno, id, passwd,mname,tel,zipcode, address1, address2, mdate, grade)
values(member_seq.nextval, 'test1' ,'1234', 'test2', '123-4567-8912', '123-1', '평택시', '비전동', sysdate, 11);


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
        cateno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        name                                VARCHAR2(50)         NOT NULL,
        rdate                               DATE         NOT NULL,
        cnt                                 NUMBER(10)       NULL 
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.rdate is '등록일';
COMMENT ON COLUMN cate.cnt is '관련 자료수';

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;
    
--카테고리 추가 (grade = '1')
insert into cate(cateno, name, rdate, cnt)
values(cate_seq.nextval, '우디' , sysdate, 0);
insert into cate(cateno, name, rdate, cnt)
values(cate_seq.nextval, '스파이시' , sysdate, 0);
insert into cate(cateno, name, rdate, cnt)
values(cate_seq.nextval, '바닐라' , sysdate, 0);
insert into cate(cateno, name, rdate, cnt)
values(cate_seq.nextval, '머스크' , sysdate, 0);
insert into cate(cateno, name, rdate, cnt)
values(cate_seq.nextval, '꽃' , sysdate, 0);
insert into cate(cateno, name, rdate, cnt)
values(cate_seq.nextval, '과일' , sysdate, 0);

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

