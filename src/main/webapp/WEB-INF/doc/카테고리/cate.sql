
drop table cate;
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