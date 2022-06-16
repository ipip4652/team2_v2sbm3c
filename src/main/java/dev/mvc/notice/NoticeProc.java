package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.contents.ContentsVO;
import dev.mvc.notice.NoticeVO;

// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
    /*
     * DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당 Autowired: DI 사용 선언 ① Spring이 자동으로
     * noticeDAOInter를 구현(DAO class 생성) ② 객체 생성: private noticeDAOInter noticeDAO
     * = new noticeDAO(); ③ noticeDAO에 생성된 객체를 할당
     */
    @Autowired
    private NoticeDAOInter noticeDAO;

    @Override
    public int create(NoticeVO noticeVO) {
        int cnt = noticeDAO.create(noticeVO);

        return cnt;
    }

    @Override
    public List<NoticeVO> list_noticeno_asc() {
        List<NoticeVO> list = this.noticeDAO.list_noticeno_asc();
        return list;
    }

    @Override
    public NoticeVO read(int noticeno) {
        NoticeVO noticeVO = this.noticeDAO.read(noticeno);
        return noticeVO;
    }

    @Override
    public int update(NoticeVO noticeVO) {
        int cnt = 0;
        cnt = this.noticeDAO.update(noticeVO);
        
        return cnt;
    }

    @Override
    public int delete(int noticeno) {
        int cnt = this.noticeDAO.delete(noticeno);
        
        return cnt;
    }

    @Override
    public int updatecnt(int noticeno) {
        
        int cnt =0;
        cnt = this.noticeDAO.updatecnt(noticeno);
        
        return cnt;
    }
    
    @Override
    public int increaseReplycnt(int noticeno) {
      int count = noticeDAO.increaseReplycnt(noticeno);
      return count;
    }

    @Override
    public int decreaseReplycnt(int noticeno) {
      int count = noticeDAO.decreaseReplycnt(noticeno);
      return count;
    }

    @Override
    public List<NoticeVO> list_by_noticeno_search(HashMap<String, Object> hashMap) {
        List<NoticeVO> list = noticeDAO.list_by_noticeno_search(hashMap);
        
        for (NoticeVO noticeVO : list) { // 내용이 160자 이상이면 160자만 선택
          String content = noticeVO.getContent();
          if (content.length() > 150) {
            content = content.substring(0, 150) + "...";
            noticeVO.setContent(content);
          }
        }
        return list;
    }   
    
    /*
     * @Override public int search_count(HashMap<String, Object> hashMap) { int
     * count = noticeDAO.search_count(hashMap); return count; }
     */
    

}





