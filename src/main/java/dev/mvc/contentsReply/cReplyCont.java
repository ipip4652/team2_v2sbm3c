package dev.mvc.contentsReply;

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

import dev.mvc.contentsReply.cReplyVO;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.contents.ContentsProc;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProc;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class cReplyCont {
  @Autowired
  @Qualifier("dev.mvc.contentsReply.cReplyProc") // 이름 지정
  private cReplyProcInter replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") // 이름 지정
  private MemberProc memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc") // 이름 지정
  private ContentsProc contentsProc;
  
  public cReplyCont(){
    System.out.println("-> ReplyCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/contentsReply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(cReplyVO replyVO) {
    int cnt = replyProc.create(replyVO);
    
    JSONObject obj = new JSONObject();
    obj.put("cnt",cnt);
 
    return obj.toString(); // {"cnt":1}

  }
  
  @RequestMapping(value="/contentsReply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (memberProc.isAdmin(session)) {
      List<cReplyVO> list = replyProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/contentsReply/list"); // /webapp/contentsReply/list.jsp

    } else {
      mav.addObject("return_url", "/contents/read.do"); // 로그인 후 이동할 주소 ★
      
      mav.setViewName("redirect:/member/login.do"); // /WEB-INF/views/member/login_ck_form.jsp
    }
    
    return mav;
  }

  /**
   <xmp>
   http://localhost:9090/ojt/contentsReply/list_by_contentsno.do?contentsno=1
   글이 없는 경우: {"list":[]}
   글이 있는 경우
   {"list":[
            {"memberno":1,"rdate":"2019-12-18 16:46:43","passwd":"123","commentno":3,"content":"댓글 3","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:39","passwd":"123","commentno":2,"content":"댓글 2","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:35","passwd":"123","commentno":1,"content":"댓글 1","contentsno":1}
            ] 
   }
   </xmp>  
   * @param contentsno
   * @return
   */
  
  
  @ResponseBody
  @RequestMapping(value = "/contentsReply/list_by_contentsno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno(int contentsno) {
    List<cReplyVO> list = replyProc.list_by_contentsno(contentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   * {"list":[
          {"memberno":1,
        "rdate":"2019-12-18 16:46:35",
      "passwd":"123",
      "commentno":1,
      "id":"user1",
      "content":"댓글 1",
      "contentsno":1}
    ,
        {"memberno":1,
       "rdate":"2019-12-18 16:46:35",
       "passwd":"123",
       "commentno":1,
       "id":"user1",
       "content":"댓글 1",
       "contentsno":1}
    ]
}
   * http://localhost:9090/ojt/contentsReply/list_by_contentsno_join.do?contentsno=1
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/contentsReply/list_by_contentsno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno_join(int contentsno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<cReplyMemberVO> list = replyProc.list_by_contentsno_join(contentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    return obj.toString();     
  }
  
  
  /**
   * 패스워드를 검사한 후 삭제 
   * http://localhost:9090/resort/reply/delete.do?commentno=1&passwd=1234
   * {"delete_cnt":0,"passwd_cnt":0}
   * {"delete_cnt":1,"passwd_cnt":1}
   * @param commentno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/contentsReply/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int commentno) {
      ModelAndView mav = new ModelAndView();
      this.replyProc.delete(commentno);
      /*
       * map.put("commentno", commentno); map.put("passwd", passwd);
       * 
       * int passwd_cnt = replyProc.checkPasswd(map); // 패스워드 일치 여부, 1: 일치, 0: 불일치 int
       * delete_cnt = 0; // 삭제된 댓글 if (passwd_cnt == 1) { // 패스워드가 일치할 경우 delete_cnt =
       * replyProc.delete(commentno); // 댓글 삭제 }
       */
    
    JSONObject obj = new JSONObject();
//    obj.put("passwd_cnt", passwd_cnt); // 패스워드 일치 여부, 1: 일치, 0: 불일치
//    obj.put("delete_cnt", delete_cnt); // 삭제된 댓글
    
    return obj.toString();
  }
  
}