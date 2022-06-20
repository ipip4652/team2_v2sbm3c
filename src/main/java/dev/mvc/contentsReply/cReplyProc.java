package dev.mvc.contentsReply;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.contentsReply.cReplyVO;
import dev.mvc.tool.Tool;

// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.contentsReply.cReplyProc")
public class cReplyProc implements cReplyProcInter {
    /*
     * DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당 Autowired: DI 사용 선언 ① Spring이 자동으로
     * replyDAOInter를 구현(DAO class 생성) ② 객체 생성: private replyDAOInter replyDAO
     * = new replyDAO(); ③ replyDAO에 생성된 객체를 할당
     */
    @Autowired
    private cReplyDAOInter replyDAO;

    @Override
    public int create(cReplyVO replyVO) {
        int cnt = replyDAO.create(replyVO);

        return cnt;
    }

    @Override
    public List<cReplyVO> list() {
      List<cReplyVO> list = replyDAO.list();
      return list;
    }

    @Override
    public List<cReplyVO> list_by_contentsno(int contentsno) {
      List<cReplyVO> list = replyDAO.list_by_contentsno(contentsno);
      String content = "";
      
      // 특수 문자 변경
      
        for (cReplyVO replyVO:list) { content = replyVO.getContent(); content =
        Tool.convertChar(content); replyVO.setContent(content); }
       
      return list;
    }

    @Override
    public List<cReplyMemberVO> list_by_contentsno_join(int contentsno) {
      List<cReplyMemberVO> list = replyDAO.list_by_contentsno_join(contentsno);
      String content = "";
      
      // 특수 문자 변경
      
        for (cReplyMemberVO replyMemberVO:list) { content =
        replyMemberVO.getContent(); content = Tool.convertChar(content);
        replyMemberVO.setContent(content); }
       
      return list;
    }

    @Override
    public int delete(int commentno) {
      int count = replyDAO.delete(commentno);
      return count;
    }

}





