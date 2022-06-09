drop table CART;
/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE CART is '쇼핑카트';
COMMENT ON COLUMN CART.CARTNO is '쇼핑카트 번호';
COMMENT ON COLUMN CART.CONTENTSNO is '향수 번호';
COMMENT ON COLUMN CART.memberno is '회원번호';
COMMENT ON COLUMN CART.CNT is '수량';
COMMENT ON COLUMN CART.RDATE is '날짜';


DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  

commit;

