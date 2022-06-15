package dev.mvc.notice;

import java.util.ArrayList;
import java.util.List;

import dev.mvc.cart.CartVO;

public interface NoticeProcInter {
    /**
     * 등록
     * 
     * @param noticeVO
     * @return 등록된 레코드 갯수
     */
    public int create(NoticeVO noticeVO);

    /**
     * 등록 순서별 목록
     * 
     * @return
     */
    public List<NoticeVO> list_noticeno_asc();

    /**
     * 조회, 수정폼 select id="read" resultType="dev.mvc.notice.noticeVO"
     * parameterType="int"
     * 
     * @param noticeno 카테고리 그룹 번호, PK
     * @return
     */
    public NoticeVO read(int noticeno);

    /**
     * 수정 처리 update id="update" parameterType="dev.mvc.notice.noticeVO"
     * 
     * @param noticeVO
     * @return 처리된 레코드 갯수
     */
    public int update(NoticeVO noticeVO);

    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param noticeno
     * @return 처리된 레코드 갯수
     */
    public int delete(int noticeno);

    /**
     * 조회수 증가
     * @param noticeno
     * @return
     */
    public int updatecnt(int noticeno);

    /**
     * 댓글 수 증가
     * @param 
     * @return
     */ 
    public int increaseReplycnt(int noticeno);
   
    /**
     * 댓글 수 감소
     * @param 
     * @return
     */   
    public int decreaseReplycnt(int noticeno);
   
   
}






