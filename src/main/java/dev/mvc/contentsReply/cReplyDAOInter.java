package dev.mvc.contentsReply;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.notice.noticeDAOInter">에 선언
// 스프링이 자동으로 구현
// noticeDAOInter를 Spring이 구현함.
// DBMS 연결 해제 자동 구현
// JAVA + SQL 결합 코드 자동 구현
// getter, setter 자동 호출
// 개발자는 메소드의 입출력을 정의함.
public interface cReplyDAOInter {
 
    
    /**
   * 등록
   * insert id="create" parameterType="dev.mvc.notice.replyVO"
   * @param replyVO
   * @return 등록된 레코드 갯수
   */
  public int create(cReplyVO replyVO);
 
  /**
   * 목록
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







