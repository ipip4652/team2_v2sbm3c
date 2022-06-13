package dev.mvc.notice;

import java.util.List;

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

import dev.mvc.notice.NoticeVO;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class NoticeCont {
    // noticeProcInter를 [구현한 noticeProc 클래스]의 객체를 자동으로 만들어 할당
    @Autowired
    @Qualifier("dev.mvc.notice.NoticeProc") // @Component("dev.mvc.notice.noticeProc")
    private NoticeProcInter noticeProc;

    @Autowired
    @Qualifier("dev.mvc.member.MemberProc") // @Component("dev.mvc.cate.CateProc")
    private MemberProcInter memberProc;

    public NoticeCont() {
        System.out.println("-> NoticeCont created.");
    }

    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/notice/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward, msg.jsp

        return mav; // forward
    }

    // http://localhost:9091/notice/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
    public ModelAndView create(int memberno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/notice/create"); // webapp/WEB-INF/views/notice/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/notice/create.do
    /**
     * 등록 처리 noticeVO noticeVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨. <form> 태그에
     * 존재하는 값들은 noticeVO noticeVO 객체안의 필드에 setter를 이용하여 자동 할당됨.
     * 
     * @param noticeVO
     * @return
     */
    @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
    public ModelAndView create(NoticeVO noticeVO) { // noticeVO 자동 생성, Form -> VO
        // noticeVO noticeVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("noticeVO", noticeVO); 자동 실행
        System.out.println("-> memberno: " + noticeVO.getMemberno());
        ModelAndView mav = new ModelAndView();

        int cnt = this.noticeProc.create(noticeVO); // 등록 처리
        // cnt = 0; // error test
        
        // request.setAttribute("code", "create_success");
        mav.addObject("code", "create_success");
        mav.addObject("cnt", cnt);
        mav.addObject("memberno", noticeVO.getMemberno()); // 회원 번호

        mav.setViewName("/cate/msg"); // /WEB-INF/views/cate/msg.jsp
        mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);

        if (cnt == 1) {
            // System.out.println("등록 성공");

//            mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
//            mav.setViewName("/notice/msg"); // /WEB-INF/views/notice/msg.jsp

            // response.sendRedirect("/notice/list.do");
            mav.setViewName("redirect:/notice/list.do");
        } else {
            // request에 저장, request.setAttribute("code", "create_fail")
            mav.addObject("code", "create_fail");
            mav.setViewName("/notice/msg"); // /WEB-INF/views/notice/msg.jsp
        }

        return mav; // forward
    }
    
    
    /**
     * 게시판 상세 조회
     * @param noticeno
     * @param model
     * @return
     */
    @RequestMapping("/notice/detailBoard.do")
    public String detailboard(int noticeno, Model model) {
        ModelAndView mav = new ModelAndView();
        NoticeVO noticeVO = this.noticeProc.read(noticeno);

        model.addAttribute("noticeVO", noticeVO);

        int cnt = this.noticeProc.updatecnt(noticeno); // 조회수 증가 처리
        System.out.println("조회수"+cnt);
        mav.addObject("cnt", cnt);

        List<NoticeVO> list = this.noticeProc.list_noticeno_asc();
        mav.addObject("list", list); // request 객체에 저장

        return "notice/detailBoard";
    }

    /**
     * 조회 + 수정폼
     * 
     * @param noticeno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value = "/notice/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int noticeno) {
        // request.setAttribute("noticeno", int noticeno) 작동 안됨.

        ModelAndView mav = new ModelAndView();

        NoticeVO noticeVO = this.noticeProc.read(noticeno);
        mav.addObject("noticeVO", noticeVO); // request 객체에 저장

        this.noticeProc.updatecnt(noticeno);

        List<NoticeVO> list = this.noticeProc.list_noticeno_asc();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/notice/read_update"); // /WEB-INF/views/notice/read_update.jsp
        return mav; // forward
    }

    
      // http://localhost:9091/notice/read_delete.do
      /**
        * 조회 + 삭제폼
        * 
        * @param noticeno 조회할 카테고리 번호
        * @return
        */
    @RequestMapping(value = "/notice/delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int noticeno) {
        System.out.println("삭제할 글번호 : " + noticeno);
        ModelAndView mav = new ModelAndView();

        NoticeVO noticeVO = this.noticeProc.read(noticeno); // 삭제할 자료 읽기
        // MemberVO memberVO = this.memberProc.read(noticeVO.getMemberno());

        mav.addObject("noticeVO", noticeVO); // request 객체에 저장
        // mav.addObject("memberVO", memberVO);
        int cnt = this.noticeProc.delete(noticeno); // 삭제 처리
        mav.addObject("cnt", cnt); // request 객체에 저장

        mav.setViewName("redirect:/notice/list.do"); // read_delete.jsp

        return mav;

    }
    
    
    // http://localhost:9091/notice/update.do
    /**
     * 수정 처리
     * 
     * @param noticeVO
     * @return
     */
    @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
    public ModelAndView read_update(NoticeVO noticeVO) {
        // noticeVO noticeVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("noticeVO", noticeVO); 자동 실행
        ModelAndView mav = new ModelAndView();
        System.out.println("불러오기 성공");
        int cnt = this.noticeProc.update(noticeVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
             System.out.println("수정 성공");
            // response.sendRedirect("/notice/list.do");
            mav.setViewName("redirect:/notice/list.do");
        } else {
            System.out.println("수정 실패");
            mav.addObject("code", "update_fail"); // request에 저장, request.setAttribute("code", "update_fail")
            mav.setViewName("/notice/msg"); // /WEB-INF/views/notice/msg.jsp
        }

        return mav;
    }


    /**
     * 목록
     * 
     * @return
     */
    @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        List<NoticeVO> list = this.noticeProc.list_noticeno_asc();

        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/notice/list"); // /webapp/WEB-INF/views/notice/list.jsp
        return mav;
    }



}
