package dev.mvc.contentsReply;

import java.util.ArrayList;
import java.util.List;


public interface cReplyProcInter {
    /**
     * 등록
     * 
     * @param replyVO
     * @return 등록된 레코드 갯수
     */
    public int create(cReplyVO replyVO);

    /**
     * 조회, 수정폼 select id="read" resultType="dev.mvc.notice.replyVO"
     * parameterType="int"
     * 
     * @param commentno 카테고리 그룹 번호, PK
     * @return
     */
    public List<cReplyVO> list();
    
    public List<cReplyVO> list_by_contentsno(int contentsno);
    
    public List<cReplyMemberVO> list_by_contentsno_join(int contentsno);

    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param commentno
     * @return 처리된 레코드 갯수
     */
    public int delete(int commentno);
   
}






