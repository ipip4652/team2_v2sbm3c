package dev.mvc.noticeReply;

public class ReplyMemberVO {
    /** 아이디 */
    private String id = "";
    
    /** 댓글 번호 */
    private int commentno;
    /** 관련 글 번호 */
    private int noticeno;
    /** 회원 번호 */
    private int memberno;
    /** 내용 */
    private String content;
    /** 등록일 */
    private String rdate;
    
    public ReplyMemberVO() {
        
    }

    public ReplyMemberVO(String id, int commentno, int noticeno, int memberno, String content, String rdate) {
        super();
        this.id = id;
        this.commentno = commentno;
        this.noticeno = noticeno;
        this.memberno = memberno;
        this.content = content;
        this.rdate = rdate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCommentno() {
        return commentno;
    }

    public void setCommentno(int commentno) {
        this.commentno = commentno;
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
    
    
}


