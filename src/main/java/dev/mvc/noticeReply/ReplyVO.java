package dev.mvc.noticeReply;

public class ReplyVO {
    
    /** 공지사항 댓글 번호 */
    private int commentno;
    /** 회원 번호*/
    private int memberno;
    /** 공지사항 글 번호 */
    private int noticeno;
    /** 댓글 내용 */
    private String content;
    /** 등록일 */
    private String rdate;
    /** 댓글수 */
    private int cnt;
    
    public ReplyVO() {
        
    }

    public ReplyVO(int commentno, int memberno, int noticeno, String content, String rdate, int cnt) {
        super();
        this.commentno = commentno;
        this.memberno = memberno;
        this.noticeno = noticeno;
        this.content = content;
        this.rdate = rdate;
        this.cnt = cnt;
    }

    public int getCommentno() {
        return commentno;
    }

    public void setCommentno(int commentno) {
        this.commentno = commentno;
    }

    public int getMemberno() {
        return memberno;
    }

    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }

    public int getNoticeno() {
        return noticeno;
    }

    public void setNoticeno(int noticeno) {
        this.noticeno = noticeno;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    
    
    
}


