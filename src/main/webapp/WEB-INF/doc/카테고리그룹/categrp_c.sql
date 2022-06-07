/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
DROP TABLE categrp;
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';


DROP SEQUENCE categrp_seq;

CREATE SEQUENCE categrp_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- Create, 등록
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '영화', 1, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '여행', 2, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '음악', 3, 'Y', sysdate);

commit;

-- List, 목록
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2022-02-24 12:07:36
         2 여행                                                        2 Y 2022-02-24 12:07:36
         3 음악                                                        3 Y 2022-02-24 12:07:36

-- Read, 조회
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
WHERE categrpno = 1;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2022-02-24 12:07:36

DELETE FROM categrp;
COMMIT;

-- 수정
UPDATE categrp
SET name='업무 양식', seqno = 3, visible='Y'
WHERE categrpno = 3;

-- X
UPDATE categrp
SET name='업무 양식', seqno = 3, visible='Y'
WHERE visible = 'Y';

commit;
 
-- 조회 + 수정폼 + 삭제폼
SELECT categrpno, name, seqno, visible, rdate 
FROM categrp
WHERE categrpno = 1;
 
 CATEGRPNO NAME  SEQNO VISIBLE RDATE
 --------- ----- ----- ------- ---------------------
         1 국내 여행     1 Y       2019-05-13 13:07:50.0

-- 삭제 처리
DELETE FROM categrp
WHERE categrpno = 1;

DELETE FROM categrp
WHERE seqno = 2;  -- X

SELECT * FROM categrp;

rollback;

SELECT * FROM categrp;

commit;
 
-- seqno 정렬, ASC: 오름차순
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;

 CATEGRPNO NAME SEQNO VISIBLE RDATE
 --------- ---- ----- ------- ---------------------
         1 영화       1 Y       2017-04-14 10:43:18.0
         2 여행       2 Y       2017-04-14 10:43:19.0
         3 캠핑       3 Y       2017-04-14 10:43:20.0
         
-- 출력 순서에따른 전체 목록
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;
 
-- 출력 순서 올림(상향), 10 ─▷ 1
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 
-- 출력순서 내림(하향), 1 ─▷ 10
UPDATE categrp
SET seqno = seqno + 1
WHERE categrpno=1;

commit;

-- 출력 모드의 변경
UPDATE categrp
SET visible='Y'
WHERE categrpno=1;

SELECT * FROM categrp;

UPDATE categrp
SET visible='N'
WHERE categrpno=1;

commit;




