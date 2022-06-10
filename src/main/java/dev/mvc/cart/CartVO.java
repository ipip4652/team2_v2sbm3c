package dev.mvc.cart;

/*
  cartno                        NUMBER(10) NOT NULL PRIMARY KEY,
  contentsno                 NUMBER(10) NULL ,
  memberno                 NUMBER(10) NOT NULL,
  cnt                            NUMBER(10) DEFAULT 0 NOT NULL,
  tot                            NUMBER(10) DEFAULT 0 NOT NULL,
  rdate                          DATE NOT NULL,
  
  SELECT t.cartno, c.contentsno, c.title, c.thumb1, c.price, c.dc, c.saleprice, c.point, t.memberno, t.cnt, t.tot, t.rdate 
 */
public class CartVO {
    /** 쇼핑 카트 번호 */
    private int cartno;
    /** 컨텐츠 번호 */
    private int contentsno;
    /** 제목 */
    private String pname = "";
    /** 메인 이미지 preview */
    private String thumb1 = "";
    /** 판매가 */
    private int price;
    /** 회원 번호 */
    private int memberno;
    /** 수량 */
    private int cnt;
    /** 금액 = 판매가 x 수량 */
    private int tot;
    /** 등록일 */
    private String rdate;
    
    public int getCartno() {
        return cartno;
    }
    public void setCartno(int cartno) {
        this.cartno = cartno;
    }
    public int getContentsno() {
        return contentsno;
    }
    public void setContentsno(int contentsno) {
        this.contentsno = contentsno;
    }
    public String getPname() {
        return pname;
    }
    public void setPname(String pname) {
        this.pname = pname;
    }
    public String getThumb1() {
        return thumb1;
    }
    public void setThumb1(String thumb1) {
        this.thumb1 = thumb1;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public int getMemberno() {
        return memberno;
    }
    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }
    public int getCnt() {
        return cnt;
    }
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
    public int getTot() {
        return tot;
    }
    public void setTot(int tot) {
        this.tot = tot;
    }
    public String getRdate() {
        return rdate;
    }
    public void setRdate(String rdate) {
        this.rdate = rdate;
    }


}
