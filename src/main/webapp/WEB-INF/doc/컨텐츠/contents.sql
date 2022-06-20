drop table contents;

/**********************************/
/* Table Name: 향수상품 */
/**********************************/
CREATE TABLE CONTENTS(
        CONTENTSNO                          NUMBER(10)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)       NULL ,
        cateno                              NUMBER(10)       NULL ,
        pcompany                            VARCHAR2(300)        NULL ,
        pname                               VARCHAR2(300)        NULL ,
        pcontent                            VARCHAR2(4000)       NULL ,
        PRICE                               NUMBER(10)       NULL ,
        WORD                                VARCHAR2(300)        NULL ,
        FILE1                               VARCHAR2(100)        NULL ,
        FILE1SAVED                          VARCHAR2(100)        NULL ,
        THUMB1                              VARCHAR2(100)        NULL ,
        SIZE1                               NUMBER(10)       NULL ,
        RDATE                               DATE         NOT NULL,
        SALECNT                             NUMBER(10)       NULL ,
        cnt                             NUMBER(7)       NULL ,
  FOREIGN KEY (cateno) REFERENCES cate (cateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE CONTENTS is '향수상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '향수 번호';
COMMENT ON COLUMN CONTENTS.memberno is '회원번호';
COMMENT ON COLUMN CONTENTS.cateno is '카테고리 번호';
COMMENT ON COLUMN CONTENTS.pcompany is '향수회사명';
COMMENT ON COLUMN CONTENTS.pname is '향수이름';
COMMENT ON COLUMN CONTENTS.pcontent is '향수내용';
COMMENT ON COLUMN CONTENTS.PRICE is '판매가';
COMMENT ON COLUMN CONTENTS.WORD is '검색어';
COMMENT ON COLUMN CONTENTS.FILE1 is '메인 이미지';
COMMENT ON COLUMN CONTENTS.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN CONTENTS.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN CONTENTS.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN CONTENTS.RDATE is '등록일';
COMMENT ON COLUMN CONTENTS.SALECNT is '수량';
COMMENT ON COLUMN CONTENTS.cnt is '조회수';

DROP SEQUENCE contents_seq;
CREATE SEQUENCE contents_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;


insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 2,'Jo Loves','골든 가드니아 EDT','가드니아','woody8.jpg','클래식한 그레이 우드 향이 화사한 가드니아꽃을 만났다. 스웨이드 카르다몸에 약간의 스파이시함을 더해 질리지 않는 향.',239000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 15,'Kilian','굿 걸 곤 배드 바이 킬리안 오 프레쉬','바이킬리안','flower7.jpg','순수한 화이트 플라워들의 향연에 지중해의 아쿠아틱한 향을 가미해 상쾌한 분위기가 배가됐다. ',275000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 5,'BDK Parfums','그리 샤르넬 edp','그리샤르넬','spicy2.jpg','파리의 열정을 담은 스파이시한 카르다몸과 블랙티, 밀키한 통카빈이 조화를 이룬다.',181148,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 8,'Chloe ','노마드 EDP','노마드','vanilla1.jpg','이집트 재스민 앱솔루트 아래로 잔잔한 바닐라와 샌들우드의 잔향이 지나가며 부드러움이 겹겹이 쌓인다.',183000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 10,'100Bon','뉘아주 드 코튼 ','뉘아주','musk1.jpg','방금 세탁을 마친 이불을 덮은 듯 개운하고 깨끗한 향. 가벼운 허브 머스크 향이 더해져 오랫동안 맡고 있어도 시원하다.',78000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 17,'LouisVuitton','덩 라 포 EDP','덩라포','fruit9.jpg','향긋한 살구와 차분한 레더 향이 어우러져 잔잔한 기분을 선사한다.',400000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 17,'Marc Jacobs ','데이지 마크 제이콥스 오 쏘 프레쉬','제이콥스','fruit10.jpg','자몽과 구스베리에 깔끔한 허브 향이 블렌딩되어 청명한 봄 하늘이 펼쳐지는 듯하다.',109000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 17,'Dior Beauty','라 콜렉션 프리베 쟈스망 데 쟝주 EDP','프리베쟈스망','fruit3.jpg','햇살을 가득 머금은 풍성한 재스민 노트 위로 달콤한 살구 노트가 피어난다. ',325000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 1,'Dolce and Gabbana ','라이트 블루 이탈리안 러브 뿌르 옴므 오 드 뚜왈렛 ','러브뿌르','woody7.jpg','베티베르와 파촐리가 제비꽃 잎사귀의 그린 노트를 만나 카프리의 깊은 숲속에 온 듯하다. ',101000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 14,'Aerin','라일락 패스 EDP ','라일락패스','flower1.jpg','플로럴 향과 싱그러운 그린 노트를 자랑한다.',230000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 11,'Lanvin','레 플레르 드 랑방 블루 오키드','랑방블루','musk5.jpg','싱그러운 사과와 레몬 향이 블루 오키드 노트를 감싼 시트러스 우디 계열. 머스크 잔향이 은은하게 남아 파우더리하게 마무리된다.',82000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 5,'Acqua di Parma','레더 EDP','레더Acqua','spicy1.jpg','묵직한 가죽 향 너머로 흐르는 신선한 오렌지와 레몬 오일의 향이 경쾌하다.',340000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 6,'Malin+Goetz','레더 EDP','레더Malin','spicy4.jpg','익숙한 정향과 후추 향 사이로 빈티지 가죽 향이 가볍게 흐른다.',140000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 16,'Kenzo','로 겐조 뿌르 옴므','겐조뿌르','fruit6.jpg','아쿠아틱 시트러스 향으로, 상쾌한 유주와 프로스티드 민트, 시더우드가 만나 투명한 물을 향으로 표현했다.',100000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 17,'Lolita Lempicka','롤리타 렘피카 몽 EDP','렘피카몽','fruit8.jpg','상큼한 아마레나 체리와 통카빈의 하모니로 구현한 달달한 향. ',187000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 13,'Ormaie','르 파상','르파상','flower9.jpg','그윽한 바닐라, 통카빈, 아미리스 향과 라벤더의 조화로 아버지에 대한 그리움을 담았다.',308000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 14,'YSL Beauty ','리브르 EDT','리브르','flower10.jpg',' 라벤더 향으로 밝고 상쾌하게 시작해 오렌지 블로섬과 화이트티의 순수함이 어우러진다. ',190000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 14,'Dior Beauty','미스 디올 로즈 에쌍스 EDP','디올로즈','flower3.jpg','싱그러운 그린 노트는 천진난만한 웃음을, 우아한 로즈 향은 반짝이는 존재감을 돋보이게 만든다. ',275000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 8,'Valentino Beauty','보체 비바 EDP','보체비바','vanilla3.jpg','바닐라와 따뜻한 플로럴 부케, 베르가모트의 레이어링을 통해 소신 있는 여성의 목소리를 표현한다.',225000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 14,'Atelier Cologne','보헤미안 오렌지 블로썸 ','보헤미안','flower2.jpg','오렌지 블로섬의 싱그러운 첫 향으로 시작해 우아한 네롤리 향으로 마무리된다.',291000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 18,'Jo Malone London','비터 만다린 코롱','만다린','fruit5.jpg','활기찬 만다린에 앰버를 더해 더욱 강해진 향. 평화로운 지중해의 오후, 오렌지 음료를 한 잔 들이켜는 모습을 담았다.',204000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 12,'Nicolai','뿌드르 드 머스크 인텐스 EDP ','인텐스','musk7.jpg','장미와 오렌지꽃 향이 실크처럼 포근하게 감싸는 파우더리한 플로럴 머스크 향.',254000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 2,'Loewe by Sephora','솔로 엘라 EDP','솔로엘라','woody9.jpg',' 오렌지, 애플, 피치의 과육향이 화이트 플라워와 우디 향으로 이어진다.',200000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 5,'The Different Company','쉬블림 발키스 EDP','쉬블림발키스','spicy6.jpg',' 시원하고 스파이시한 첫 향 + 플로럴한 향',170000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 18,'Loewe by Sephora','아구아 마이애미 오 드 뚜왈렛 ','마이애미','fruit7.jpg','로에베의 헤스페리데스 오 드 뚜왈렛을 아쿠아틱하게 재해석해 산뜻하고 가벼운 향. ',149000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 6,'Penhaligon’s','아서 EDP','아서','spicy5.jpg','용이 내뿜는 불길과 같은 인센스 향에 레진과 가죽의 향이 관능미를 자아낸다. 베이스 노트의 바닐라와 통카빈이 발사믹한 향을 증폭시킨다.',370000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 12,'Le Labo','어나더 13','어나더','musk6.jpg','진한 암브록산과 이끼가 블렌딩된 우디 머스크 계열 향수. 시간이 지날수록 살냄새에 가까운 향을 드러낸다. ',235000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 2,'Tom Ford Beauty','에벤 퓨메 EDP ','에벤퓨메','woody11.jpg','모키한 팔로 산토 향 위로, 마른 나무에 맺힌 송진 향과 에보니 우드 향이 따뜻함을 자아낸다.',339000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 15,'OFFICINE UNIVERSELLE BULY','오 트리쁠-발팽송의 목욕하는 여인','오트리쁠','flower8.jpg','라벤더, 오렌지 블라썸, 네롤리, 씨트로넬라 부테의 깊은 향기에 파출리와 인센스 향이 더해진 퓨어한 플로럴 계열의 향기',230000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 3,'Diptyque','오데썽 EDT','오데썽','woody6.jpg',' 향기로운 오렌지블라섬, 달콤한 비터오렌지, 싱그러운 우디 노트 등 다채롭고 화려한 향을 담아 오감을 자극한다. ',174000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 1,'Tom Ford Beauty','오드 우드 EDP','오드우드','woody12.jpg','무게감이 느껴지는 우디 향조에 크리미한 바닐라와 로즈 향이 더해져 깊고 풍성한 향을 완성한다.',233000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 18,'Acqua di Parma','오스만투스 EDP','오스만투스','fruit1.jpg','발랄한 시트러스의 등장이 자칫 차가워 보일 수 있는 인상을 부드럽게 풀어주며, 오스만투스는 담백함과 신뢰감을 더한다.',297000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 18,'Byredo','오픈 스카이 EDP','오픈스카이','fruit2.jpg','강렬한 자몽 향에 블랙 페퍼와 우디 향이 섞여 독특한 향을 완성한다. 은은하게 감도는 시트러스의 잔향까지 매력적.',340000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 13,'Jo Malone London','와일드 블루벨 코롱','블루벨코롱','flower6.jpg','낭만적인 꽃향기를 더했으나 쿨내 나는 특별한 향으로 털털한 성격에 어울린다. ',132900,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 3,'Maison Francis Kurkdjian','우드 실크 무드 엑스트레 드 퍼퓸','우드실크','woody10.jpg','관능적인 우드에 이국적인 엘레미와 사프란이 더해져 아라비안나이트의 신비한 느낌을 선사한다. ',437400,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 15,'Hermes','운 자르뎅 수르 라 라군 EDT','운자르뎅','flower5.jpg','백합과 목련 향이 베니스의 비밀 정원을 연상시킨다. 신비롭고 몽상적인 향이 특징.',168000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 11,'Editions de Parfums Frederic Malle','이리스 뿌드르 EDP','뿌드르','musk3.jpg','클래식한 분위기의 화이트 머스크 향. 아이리스와 일랑일랑으로 세련미를 더했다.',414000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 12,'EX NIHILO','이리스 포셀라나 edp','포셀라나','musk4.jpg','바이올렛 잎, 아이리스, 머스크의 섬세한 향기와 샌들우드의 묵직함이 조화를 이룬다.',239000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 2,'Byredo','집시워터 EDP','집시워터','woody5.jpg','생기발랄한 시트러스 향이 은은한 샌들우드 향으로 이어지며, 향의 중심엔 소나무가 위치해 전체적인 균형을 이끌어낸다.',190000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 3,'Astier de Villatte','투손 퍼퓸','투손퍼퓸','woody3.jpg','은은한 야생 타임과 록로즈의 송진에서 나오는 달콤한 앰버 향을 맡으면 미국 서부 사막이 눈 앞으로 펼쳐진다. ',260000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 6,'Le Couvent','퍼퓸 리마커블 포트 로얄 EDP','포트로얄','spicy3.jpg','벤조인 앱솔루트와 달콤한 와일드 베리가 만나 강렬하지만 부드러운 카리스마를 선사한다.',150000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 14,'Editions de Parfums Frederic Malle','포트레이트 오브 어 레이디 EDP','포트레이트','flower4.jpg','스파이시한 향과 장미가 어우러진 정장 차림에 또각또각 구두 소리가 어울리는 카리스마 넘치는 향이다.',302400,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 1,'ARMANI Beauty','프리베 테 울롱 EDT','프리베테울롱','woody2.jpg','안개가 은은하게 깔린 녹차밭을 거니는 듯한 개운한 기분이 든다. ',300000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 12,'Diptyque','플레르 드 뽀 EDP ','플레르드뽀','musk2.jpg','‘피부의 꽃’이라는 뜻으로 본연의 체취 같은 은은한 머스크 향이 매력적. 히든 노트인 달콤한 핑크 페퍼콘이 황홀함을 더한다.',255000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 8,'Memo Paris','플롬 EDP','플롬','vanilla2.jpg','베이스 노트의 통카빈과 바닐라 팟이 포근하고 행복한 기분을 자아낸다. ',315000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 18,'Fresh','헤스페리데스 EDP','헤스페리데스','fruit4.jpg','레몬, 만다린 등 다채로운 시트러스 과일을 그대로 짜낸 듯 상큼하고 청량한 향의 향수. ',165000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 3,'aesop','휠 EDP','휠','woody1.jpg','스모키한 우디 향은 심신을 가라앉히고 리프레시를 도와 일의 집중도를 높이는 데 도움을 준다. ',268000,100,sysdate);										
insert into contents(contentsno, memberno, cateno, pcompany, pname, word, FILE1, pcontent, price, salecnt, rdate) values (content_seq.nextval, 1, 1,'Burberry','히어로 EDT','히어로','woody4.jpg','강임함과 섬세함, 파워와 감성, 스포츠 스피릿과 창조적 에너지의 매혹적인 조화를 선보입니다.',182000,100,sysdate);										
