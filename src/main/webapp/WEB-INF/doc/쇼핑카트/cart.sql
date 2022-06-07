/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
DROP TABLE cart CASCADE CONSTRAINTS;
CREATE TABLE cart (
  cartno                        NUMBER(10) NOT NULL PRIMARY KEY,
  contentsno                 NUMBER(10) NULL ,
  memberno                 NUMBER(10) NOT NULL,
  cnt                            NUMBER(10) DEFAULT 0 NOT NULL,
  rdate                          DATE NOT NULL,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);
 
COMMENT ON TABLE cart is '쇼핑카트';
COMMENT ON COLUMN cart.cartno is '쇼핑카트 번호';
COMMENT ON COLUMN cart.contentsno is '컨텐츠 번호(상품 번호)';
COMMENT ON COLUMN cart.memberno is '회원 번호';
COMMENT ON COLUMN cart.cnt is '수량';
COMMENT ON COLUMN cart.rdate is '날짜';

DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
-- INSERT
SELECT contentsno, title, price FROM contents;  -- 9번 사용 확인
CONTENTSNO  TITLE                                                                                                                                                                                                                                                                                                             PRICE
-----------------  ----------
         6           튜울립                                                                                                                                                                                                                                                                                                                0
         5           안개꽃   
         
SELECT memberno, mname FROM member;  -- 1번 사용 확인
  MEMBERNO MNAME                         
---------- ------------------------------
         3 회원1                         

INSERT INTO cart(cartno, contentsno, memberno, cnt, rdate)
VALUES(cart_seq.nextval, 20, 20, 1, sysdate);

INSERT INTO cart(cartno, contentsno, memberno, cnt, rdate)
VALUES(cart_seq.nextval, 20, 20, 1, sysdate);
commit;

-- ERROR
-- ORA-02291: integrity constraint (KD.SYS_C007449) violated - parent key not found
INSERT INTO cart(cartno, contentsno, memberno, cnt, rdate)
VALUES(cart_seq.nextval, 50000, -3000, 1, sysdate);

-- LIST
SELECT cartno, contentsno, memberno, cnt, rdate FROM cart ORDER BY cartno ASC;

    CARTNO CONTENTSNO   MEMBERNO        CNT RDATE              
---------------------------------------------------------------------------------------------
         1          6                  3                       1     2022-05-17 11:57:42
         2          5                  3                       1     2022-05-17 11:58:08
         
-- LIST contents join
SELECT t.cartno, c.contentsno, c.title, c.thumb1, c.price, c.dc, c.saleprice, c.point, t.memberno, t.cnt, t.rdate 
FROM contents c, cart t
WHERE c.contentsno = t.contentsno
ORDER BY cartno ASC;

         
-- READ
SELECT t.cartno, c.contentsno, c.title, c.price, t.memberno, t.cnt, t.rdate 
FROM contents c, cart t
WHERE (c.contentsno = t.contentsno) AND t.cartno=1;


-- UPDATE
UPDATE cart
SET cnt=2
WHERE cartno=1;
commit;

-- DELETE
DELETE FROM cart WHERE cartno=6;
commit;

