package dev.mvc.contentsReply;

public class cReplyMemberVO {
    /** 아이디 */
    private String id = "";
    
    /** 댓글 번호 */
    private int commentno;
    /** 관련 글 번호 */
    private int contentsno;
    /** 회원 번호 */
    private int memberno;
    /** 내용 */
    private String content;
    /** 등록일 */
    private String rdate;
    
    public cReplyMemberVO() {
        
    }

    public cReplyMemberVO(String id, int commentno, int contentsno, int memberno, String content, String rdate) {
        super();
        this.id = id;
        this.commentno = commentno;
        this.contentsno = contentsno;
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

    public int getContentsno() {
        return contentsno;
    }

    public void setContentsno(int contentsno) {
        this.contentsno = contentsno;
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


