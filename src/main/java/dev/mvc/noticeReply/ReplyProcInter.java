package dev.mvc.noticeReply;

import java.util.ArrayList;
import java.util.List;


public interface ReplyProcInter {
    /**
     * 등록
     * 
     * @param replyVO
     * @return 등록된 레코드 갯수
     */
    public int create(ReplyVO replyVO);

    /**
     * 조회, 수정폼 select id="read" resultType="dev.mvc.notice.replyVO"
     * parameterType="int"
     * 
     * @param commentno 카테고리 그룹 번호, PK
     * @return
     */
    public List<ReplyVO> list();
    
    public List<ReplyVO> list_by_noticeno(int noticeno);
    
    public List<ReplyMemberVO> list_by_noticeno_join(int noticeno);

    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param commentno
     * @return 처리된 레코드 갯수
     */
    public int delete(int commentno);
   
}






