drop table order_pay;
/**********************************/
/* Table Name: 주문_결제 */
/**********************************/
CREATE TABLE order_pay(
		order_payno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		rname                         		VARCHAR2(30)		 NOT NULL,
		rtel                          		VARCHAR2(14)		 NOT NULL,
		rzipcode                      		VARCHAR2(5)		 NOT NULL,
		raddress1                     		VARCHAR2(80)		 NOT NULL,
		raddress2                    		VARCHAR2(50)		 NOT NULL,
		paytype                       		NUMBER(1)		 NOT NULL,
		amount                        		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

alter table order_pay add rating number;
COMMENT ON COLUMN order_pay.rating is '평점';

COMMENT ON TABLE order_pay is '주문_결제';
COMMENT ON COLUMN order_pay.order_payno is '주문번호';
COMMENT ON COLUMN order_pay.memberno is '회원번호';
COMMENT ON COLUMN order_pay.rname is '수취인성명';
COMMENT ON COLUMN order_pay.rtel is '수취인 전화번호';
COMMENT ON COLUMN order_pay.rzipcode is '수취인 우편번호';
COMMENT ON COLUMN order_pay.raddress1 is '수취인 주소1';
COMMENT ON COLUMN order_pay.raddress12 is '수취인 주소2';
COMMENT ON COLUMN order_pay.paytype is '결제 종류';
COMMENT ON COLUMN order_pay.amount is '결제금액';
COMMENT ON COLUMN order_pay.rdate is '주문날짜';

DROP SEQUENCE order_pay_seq;

CREATE SEQUENCE order_pay_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

commit;
  
  
