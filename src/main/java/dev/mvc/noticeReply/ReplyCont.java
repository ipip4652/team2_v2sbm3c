package dev.mvc.noticeReply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.noticeReply.ReplyVO;
import dev.mvc.notice.NoticeVO;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProc;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.noticeReply.ReplyProc") // 이름 지정
  private ReplyProcInter replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") // 이름 지정
  private MemberProc memberProc;
  
  public ReplyCont(){
    System.out.println("-> ReplyCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/noticeReply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReplyVO replyVO) {
    int cnt = replyProc.create(replyVO);
    
    JSONObject obj = new JSONObject();
    obj.put("cnt",cnt);
 
    return obj.toString(); // {"cnt":1}

  }
  
  @RequestMapping(value="/noticeReply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (memberProc.isAdmin(session)) {
      List<ReplyVO> list = replyProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/noticeReply/list"); // /webapp/noticeReply/list.jsp

    } else {
      mav.addObject("return_url", "/notice/list.do"); // 로그인 후 이동할 주소 ★
      
      mav.setViewName("redirect:/member/login.do"); // /WEB-INF/views/member/login_ck_form.jsp
    }
    
    return mav;
  }

  /**
   <xmp>
   http://localhost:9090/ojt/noticeReply/list_by_noticeno.do?noticeno=1
   글이 없는 경우: {"list":[]}
   글이 있는 경우
   {"list":[
            {"memberno":1,"rdate":"2019-12-18 16:46:43","passwd":"123","replyno":3,"content":"댓글 3","noticeno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:39","passwd":"123","replyno":2,"content":"댓글 2","noticeno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:35","passwd":"123","replyno":1,"content":"댓글 1","noticeno":1}
            ] 
   }
   </xmp>  
   * @param noticeno
   * @return
   */
  
  
  @ResponseBody
  @RequestMapping(value = "/noticeReply/list_by_noticeno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_noticeno(int noticeno) {
    List<ReplyVO> list = replyProc.list_by_noticeno(noticeno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   * {"list":[
          {"memberno":1,
        "rdate":"2019-12-18 16:46:35",
      "passwd":"123",
      "replyno":1,
      "id":"user1",
      "content":"댓글 1",
      "noticeno":1}
    ,
        {"memberno":1,
       "rdate":"2019-12-18 16:46:35",
       "passwd":"123",
       "replyno":1,
       "id":"user1",
       "content":"댓글 1",
       "noticeno":1}
    ]
}
   * http://localhost:9090/ojt/noticeReply/list_by_noticeno_join.do?noticeno=1
   * @param noticeno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/noticeReply/list_by_noticeno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_noticeno_join(int noticeno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<ReplyMemberVO> list = replyProc.list_by_noticeno_join(noticeno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
}