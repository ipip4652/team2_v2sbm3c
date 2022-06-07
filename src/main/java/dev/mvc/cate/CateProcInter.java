package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
    /**
     * 등록
     * 
     * @param cateVO
     * @return 등록된 갯수
     */
    public int create(CateVO cateVO);

    /**
     * 전체 목록
     * 
     * @return
     */
    public List<CateVO> list_all();

    /**
     * categrpno별 목록
     * 
     * @return
     */
    public List<CateVO> list_by_categrpno(int categrpno);

    /**
     * Categrp + Cate join, 연결 목록
     * 
     * @return
     */
    public List<Categrp_CateVO> list_all_join();

    /**
     * 조회, 수정
     * @param cateno 카테고리 번호, PK
     * @return 
     */
    public CateVO read(int cateno);
    
    /**
     * 수정 처리
     * @param cateVO
     * @return 수정된 레코드 갯수
     */
    public int update(CateVO cateVO);
    
    /**
     * 삭제 처리 
     * @param cateno
     * @return 삭제된 레코드 갯수
     */
    public int delete(int cateno);
    
    /**
     * 특정 그룹에 속한 레코드 갯수 산출
     * @param categrpno
     * @return
     */
    public int count_by_categrpno(int categrpno);
    
}


