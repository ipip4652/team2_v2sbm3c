package dev.mvc.notice;

public class NoticeVO {
    /** 공지사항 그룹 번호 */
    private int noticeno;
    /** 회원 번호*/
    private int memberno;
    /** 공지사항 제목 */
    private String title;
    /** 내용 */
    private String content;
    /** 검색어 */
    private String word = "";
    /** 등록일 */
    private String rdate;
    /** 조회수 */
    private int cnt;
    /** 댓글수 */
    private int replycnt;
    
    public NoticeVO() {
        
    }

    public NoticeVO(int noticeno, int memberno, String title, String content, String word, String rdate, int cnt,
            int replycnt) {
        super();
        this.noticeno = noticeno;
        this.memberno = memberno;
        this.title = title;
        this.content = content;
        this.word = word;
        this.rdate = rdate;
        this.cnt = cnt;
        this.replycnt = replycnt;
    }

    public int getNoticeno() {
        return noticeno;
    }

    public void setNoticeno(int noticeno) {
        this.noticeno = noticeno;
    }

    public int getMemberno() {
        return memberno;
    }

    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public int getReplycnt() {
        return replycnt;
    }

    public void setReplycnt(int replycnt) {
        this.replycnt = replycnt;
    }
    
}


