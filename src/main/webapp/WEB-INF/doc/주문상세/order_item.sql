drop table order_item;
/**********************************/
/* Table Name: 주문상세 */
/**********************************/
CREATE TABLE order_item(
		order_itemno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		order_payno                   		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(5)		 NOT NULL,
		tot                           		NUMBER(10)		 NOT NULL,
		stateno                       		NUMBER(1)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (order_payno) REFERENCES order_pay (order_payno),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE order_item is '주문상세';
COMMENT ON COLUMN order_item.order_itemno is '주문상세번호';
COMMENT ON COLUMN order_item.order_payno is '주문번호';
COMMENT ON COLUMN order_item.memberno is '회원번호';
COMMENT ON COLUMN order_item.CONTENTSNO is '향수 번호';
COMMENT ON COLUMN order_item.cnt is '수량';
COMMENT ON COLUMN order_item.tot is '합계';
COMMENT ON COLUMN order_item.stateno is '주문상태';
COMMENT ON COLUMN order_item.rdate is '주문날짜';

DROP SEQUENCE order_item_seq;

CREATE SEQUENCE order_item_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

commit;
  
  
