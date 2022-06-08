
drop table categrp;
/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE categrp(
        categrpno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
        sex                                  CHAR(1)         NOT NULL,
        rdate                               DATE         NOT NULL
);

DROP SEQUENCE categrp_seq;
CREATE SEQUENCE categrp_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;

insert into categrp(categrpno  , sex, rdate)
values(categrp_seq.nextval, 'M' , sysdate);

insert into categrp(categrpno  , sex, rdate)
values(categrp_seq.nextval, 'W' , sysdate);

insert into categrp(categrpno  , sex, rdate)
values(categrp_seq.nextval, 'N' , sysdate);