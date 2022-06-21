package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsDAOInter {
    /**
     * 등록
     * @param contentsVO 등록할 내용
     * @return 등록된 레코드 갯수
     */
    public int create(ContentsVO contentsVO);
    
    /**
     * 조회
     * select id="read" resultType="dev.mvc.contents.ContentsVO" parameterType="int"
     * @param contentsno
     * @return
     */
    public ContentsVO read(int contentsno);
    
    /**
     * 상품 정보 변경
     * @param contentsVO
     * @return
     */
    public int product_update(ContentsVO contentsVO);
    
    /**
     * 특정 카테고리의 등록된 글목록
     * @param cateno
     * @return
     */
    public List<ContentsVO> list_by_cateno(int cateno);
    
    /**
     * 카테고리별 검색 목록
     * @param hashMap
     * @return
     */
    public List<ContentsVO> list_by_cateno_search(HashMap<String, Object> hashMap);

    /**
     * 카테고리별 검색 레코드 갯수
     * @param hashMap
     * @return
     */
    public int search_count(HashMap<String, Object> hashMap);
    
    /**
     * 검색 + 페이징 목록
     * select id="list_by_cateno_search_paging" 
             resultType="dev.mvc.contents.ContentsVO" parameterType="HashMap"
     * @param map
     * @return
     */
    public List<ContentsVO> list_by_cateno_search_paging(HashMap<String, Object> map);
    
    /**
     * 텍스트 정보 수정
     * @param contentsVO
     * @return 처리된 레코드 갯수
     */
    public int update_text(ContentsVO contentsVO);
    
    /**
     * 파일 정보 수정
     * @param contentsVO
     * @return 처리된 레코드 갯수
     */
    public int update_file(ContentsVO contentsVO);
    
    /**
     * 삭제
     * @param contentsno
     * @return 삭제된 레코드 개수
     */
    public int delete(int contentsno);
    
    /**
     * 카테고리 번호에 의한 카운트 
     * @param cateno 카테고리 번호
     * @return 갯수
     */
    public int count_by_cateno(int cateno);
    
    /**
     * 키워드로 검색 (챗봇)
     * @param word
     * @return
     */
    public ContentsVO search_by_word(String word);
}










