package dev.mvc.contentsReply;

public class cReplyVO {
    
    /** 공지사항 댓글 번호 */
    private int commentno;
    /** 회원 번호*/
    private int memberno;
    /** 컨텐츠 글 번호 */
    private int contentsno;
    /** 댓글 내용 */
    private String content;
    /** 등록일 */
    private String rdate;
    
    public cReplyVO() {
        
    }

    public cReplyVO(int commentno, int memberno, int contentsno, String content, String rdate) {
        super();
        this.commentno = commentno;
        this.memberno = memberno;
        this.contentsno = contentsno;
        this.content = content;
        this.rdate = rdate;
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

    public int getContentsno() {
        return contentsno;
    }

    public void setContentsno(int contentsno) {
        this.contentsno = contentsno;
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


