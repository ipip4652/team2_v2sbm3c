package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import dev.mvc.contents.ContentsVO;

// MyBATIS의 <mapper namespace="dev.mvc.notice.noticeDAOInter">에 선언
// 스프링이 자동으로 구현
// noticeDAOInter를 Spring이 구현함.
// DBMS 연결 해제 자동 구현
// JAVA + SQL 결합 코드 자동 구현
// getter, setter 자동 호출
// 개발자는 메소드의 입출력을 정의함.
public interface NoticeDAOInter {
    /**
     * 등록 insert id="create" parameterType="dev.mvc.notice.noticeVO"
     * 
     * @param noticeVO
     * @return 등록된 레코드 갯수
     */
    public int create(NoticeVO noticeVO);

    /**
     * 등록 순서별 목록 select id="list_noticeno_asc" resultType="dev.mvc.notice.noticeVO"
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
     * 삭제 처리 delete id="delete" parameterType="int"
     * 
     * @param noticeno
     * @return 처리된 레코드 갯수
     */
    public int delete(int noticeno);

    /**
     * 카테고리별 검색 목록
     * 
     * @param hashMap
     * @return
     */
    public List<NoticeVO> list_by_noticeno_search(HashMap<String, Object> hashMap);

    
    /**
     * 카테고리별 검색 레코드 갯수
     * @param hashMap
     * @return
     */
    public int search_count(HashMap<String, Object> hashMap);
    
    /**
     * 검색 + 페이징 목록
     * select id="list_by_noticeno_search_paging" 
             resultType="dev.mvc.contents.ContentsVO" parameterType="HashMap"
     * @param map
     * @return
     */
    public List<NoticeVO> list_by_noticeno_search_paging(HashMap<String, Object> map);
    
    
    /** 
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     *
     * @param list_file 목록 파일명 
     * @param noticeno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param now_page     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    public String pagingBox(int noticeno, int search_count, int now_page, String word);
  
    
    /**
     * 조회수 증가
     * 
     * @param noticeno
     * @return
     */
    public int updatecnt(int noticeno);

    /**
     * 댓글 수 증가
     * 
     * @param
     * @return
     */
    public int increaseReplycnt(int noticeno);

    /**
     * 댓글 수 감소
     * 
     * @param
     * @return
     */
    public int decreaseReplycnt(int noticeno);

    
    
    
}
