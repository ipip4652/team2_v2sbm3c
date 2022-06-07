    /**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(60)		 NOT NULL,
		mname                         		VARCHAR2(30)		 NOT NULL,
		tel                           		VARCHAR2(14)		 NOT NULL,
		zipcode                       		NUMBER(10)		 NULL ,
		address1                      		VARCHAR2(80)		 NULL ,
		address2                      		VARCHAR2(50)		 NULL ,
		date                          		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL
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
COMMENT ON COLUMN member.date is '가입일';
COMMENT ON COLUMN member.GRADE is '등급';


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
		raddress12                    		VARCHAR2(50)		 NOT NULL,
		paytype                       		NUMBER(1)		 NOT NULL,
		amount                        		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

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


/**********************************/
/* Table Name: 주문상세 */
/**********************************/
CREATE TABLE order_item(
		order_itemno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		order_payno                   		INTEGER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(5)		 NOT NULL,
		tot                           		NUMBER(10)		 NOT NULL,
		stateno                       		NUMBER(1)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (order_payno) REFERENCES order_pay (order_payno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
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


