package dev.mvc.categrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;

@Controller
public class CategrpCont {
    // CategrpProcInter를 [구현한 CategrpProc 클래스]의 객체를 자동으로 만들어 할당
    @Autowired
    @Qualifier("dev.mvc.categrp.CategrpProc") // @Component("dev.mvc.categrp.CategrpProc")
    private CategrpProcInter categrpProc;

    @Autowired
    @Qualifier("dev.mvc.cate.CateProc")  // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;
    
    public CategrpCont() {
        System.out.println("-> CategrpCont created.");
    }
    
    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/categrp/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward, msg.jsp

        return mav; // forward
    }

    // http://localhost:9091/categrp/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/categrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/categrp/create"); // webapp/WEB-INF/views/categrp/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/categrp/create.do
    /**
     * 등록 처리
     * CategrpVO categrpVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨. 
     * <form> 태그에 존재하는 값들은 CategrpVO categrpVO 객체안의 필드에 setter를 이용하여 자동 할당됨.  
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/categrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(CategrpVO categrpVO) { // categrpVO 자동 생성, Form -> VO
        // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("categrpVO", categrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.categrpProc.create(categrpVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);  // request.setAttribute("cnt", cnt); 
       
        if (cnt == 1) {
            // System.out.println("등록 성공");
            
//            mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
//            mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
            
            // response.sendRedirect("/categrp/list.do");
            mav.setViewName("redirect:/categrp/list.do");
        } else {
            // request에 저장, request.setAttribute("code", "create_fail")
            mav.addObject("code", "create_fail"); 
            mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
        }

        return mav; // forward
    }
    
    /**
     * 조회 + 수정폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
     * http://localhost:9091/categrp/read_ajax.do?categrpno=1
     * {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categrp/read_ajax.do", method=RequestMethod.GET )
    @ResponseBody
    public String read_ajax(int categrpno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    

        CategrpVO categrpVO = this.categrpProc.read(categrpno);
          
        JSONObject json = new JSONObject();
        json.put("categrpno", categrpVO.getCategrpno());
        json.put("name", categrpVO.getName());
        json.put("rdate", categrpVO.getRdate());
          
        return json.toString();
    }

    /**
     * 조회 + 삭제폼 + 카테고리 그룹에 속한 카테고리 레코드 갯수 
     * http://localhost:9091/categrp/read_ajax2.do?categrpno=1
     * {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2022-04-28 15:19:39","name":"푸드 코트","count_by_categrpno":3}
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categrp/read_ajax2.do", method=RequestMethod.GET )
    @ResponseBody
    public String read_ajax2(int categrpno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    

        CategrpVO categrpVO = this.categrpProc.read(categrpno);
          
        JSONObject json = new JSONObject();
        json.put("categrpno", categrpVO.getCategrpno());
        json.put("name", categrpVO.getName());
        json.put("rdate", categrpVO.getRdate());
        
        // 카테고리 그룹에 속한 카테고리수 파악
        int count_by_categrpno =  this.cateProc.count_by_categrpno(categrpno);
        json.put("count_by_categrpno", count_by_categrpno);
        
        return json.toString();
    }
    
    // http://localhost:9091/categrp/update.do
    /**
     * 수정 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/categrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(CategrpVO categrpVO) {
        // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("categrpVO", categrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.categrpProc.update(categrpVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
            // System.out.println("수정 성공");
            // response.sendRedirect("/categrp/list.do");
            mav.setViewName("redirect:/categrp/list.do");
        } else {
            mav.addObject("code", "update_fail"); // request에 저장, request.setAttribute("code", "update_fail")
            mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
        }

        return mav;
    }
 
    // http://localhost:9091/categrp/read_delete.do
    /**
     * 조회 + 삭제폼
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categrp/read_delete.do", method=RequestMethod.GET )
    public ModelAndView read_delete(int categrpno) {
      ModelAndView mav = new ModelAndView();
      
      CategrpVO categrpVO = this.categrpProc.read(categrpno); // 삭제할 자료 읽기
      mav.addObject("categrpVO", categrpVO);  // request 객체에 저장
      
      List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/categrp/read_delete"); // read_delete.jsp
      return mav;
    }
    
    // http://localhost:9091/categrp/delete.do
    /**
     * 삭제
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categrp/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int categrpno) {
      ModelAndView mav = new ModelAndView();
      
      CategrpVO categrpVO = this.categrpProc.read(categrpno); // 삭제 정보
      mav.addObject("categrpVO", categrpVO);  // request 객체에 저장
      
      int cnt = this.categrpProc.delete(categrpno); // 삭제 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      // mav.setViewName("/categrp/delete_msg"); // delete_msg.jsp
      mav.setViewName("redirect:/categrp/list.do");

      return mav;
    }
    
    // http://localhost:9091/categrp/list.do
    /**
     * 목록
     * @return
     */
    @RequestMapping(value="/categrp/list.do", method=RequestMethod.GET )
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();

      // 등록 순서별 출력    
      // List<CategrpVO> list = this.categrpProc.list_categrpno_asc();

      // 출력 순서별 출력
      List<CategrpVO> list = this.categrpProc.list_categrpno_asc();

      mav.addObject("list", list); // request.setAttribute("list", list);

//      mav.setViewName("/categrp/list"); // /webapp/WEB-INF/views/categrp/list.jsp
      mav.setViewName("/categrp/list_ajax"); // /webapp/WEB-INF/views/categrp/list_ajax.jsp
      return mav;
    }
    
    
}



 