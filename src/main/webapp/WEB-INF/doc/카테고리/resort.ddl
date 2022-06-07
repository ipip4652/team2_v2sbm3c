/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN categrp.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN categrp.name is '�̸�';
COMMENT ON COLUMN categrp.seqno is '��� ����';
COMMENT ON COLUMN categrp.visible is '��� ���';
COMMENT ON COLUMN categrp.rdate is '�׷� ������';


/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL,
		categrpno                     		NUMBER(10)		 NULL ,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE cate is 'ī�װ�';
COMMENT ON COLUMN cate.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN cate.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN cate.name is 'ī�װ� �̸�';
COMMENT ON COLUMN cate.rdate is '�����';
COMMENT ON COLUMN cate.cnt is '���� �ڷ��';


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE member is 'ȸ��';
COMMENT ON COLUMN member.memberno is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL,
		cateno                        		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE contents is '������';
COMMENT ON COLUMN contents.contentsno is '������ ��ȣ';
COMMENT ON COLUMN contents.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN contents.memberno is 'ȸ�� ��ȣ';



ALTER TABLE categrp ADD CONSTRAINT IDX_categrp_PK PRIMARY KEY (categrpno);

ALTER TABLE cate ADD CONSTRAINT IDX_cate_PK PRIMARY KEY (cateno);
ALTER TABLE cate ADD CONSTRAINT IDX_cate_FK0 FOREIGN KEY (categrpno) REFERENCES categrp (categrpno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (memberno);

ALTER TABLE contents ADD CONSTRAINT IDX_contents_PK PRIMARY KEY (contentsno);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK0 FOREIGN KEY (cateno) REFERENCES cate (cateno);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);

