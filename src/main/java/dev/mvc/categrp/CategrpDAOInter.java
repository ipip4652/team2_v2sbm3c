package dev.mvc.categrp;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
// CategrpDAOInter를 Spring이 구현함.
// DBMS 연결 해제 자동 구현
// JAVA + SQL 결합 코드 자동 구현
// getter, setter 자동 호출
// 개발자는 메소드의 입출력을 정의함.
public interface CategrpDAOInter {
  /**
   * 등록
   * insert id="create" parameterType="dev.mvc.categrp.CategrpVO"
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(CategrpVO categrpVO);
 
  /**
   * 등록 순서별 목록
   * select id="list_categrpno_asc" resultType="dev.mvc.categrp.CategrpVO"
   * @return
   */
  public List<CategrpVO> list_categrpno_asc();
  
  /**
   * 조회, 수정폼
   * select id="read" resultType="dev.mvc.categrp.CategrpVO" parameterType="int"
   * @param categrpno 카테고리 그룹 번호, PK
   * @return
   */
  public CategrpVO read(int categrpno);
  
  /**
   * 수정 처리
   * update id="update" parameterType="dev.mvc.categrp.CategrpVO"
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(CategrpVO categrpVO);

  /**
   * 삭제 처리
   * delete id="delete" parameterType="int"
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int categrpno);
  
}







