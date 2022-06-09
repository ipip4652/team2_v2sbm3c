
drop table categrp;
/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE categrp(
        categrpno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
        name                                VARCHAR2(50)         NOT NULL,
        rdate                               DATE         NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN categrp.name is '성별';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';

DROP SEQUENCE categrp_seq;
CREATE SEQUENCE categrp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;

insert into categrp(categrpno  , name, rdate)
values(categrp_seq.nextval, 'M' , sysdate);

insert into categrp(categrpno  , name, rdate)
values(categrp_seq.nextval, 'W' , sysdate);

insert into categrp(categrpno  , name, rdate)
values(categrp_seq.nextval, 'N' , sysdate);