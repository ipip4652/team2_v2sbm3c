
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
