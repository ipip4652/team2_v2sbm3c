package dev.mvc.tensorflow;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TensorflowCont {
  public TensorflowCont() {
    //System.out.println("-> TensorflowCont created.");
  }
     //http://localhost:9091/tensorflow/recommend_perfume/start.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/start.do"}, method = RequestMethod.GET)
     public ModelAndView start() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/start");  // /WEB-INF/views/tensorflow/recommend_perfume/start.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/form1.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/form1.do"}, method = RequestMethod.GET)
     public ModelAndView form1() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/form1");  // /WEB-INF/views/tensorflow/recommend_perfume/form1.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/form2.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/form2.do"}, method = RequestMethod.GET)
     public ModelAndView form2() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/form2");  // /WEB-INF/views/tensorflow/recommend_perfume/form2.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/form3.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/form3.do"}, method = RequestMethod.GET)
     public ModelAndView form3() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/form3");  // /WEB-INF/views/tensorflow/recommend_perfume/form3.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/form4.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/form4.do"}, method = RequestMethod.GET)
     public ModelAndView form4() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/form4");  // /WEB-INF/views/tensorflow/recommend_perfume/form4.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/form5.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/form5.do"}, method = RequestMethod.GET)
     public ModelAndView form5() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/form5");  // /WEB-INF/views/tensorflow/recommend_perfume/form5.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/form6.do
     @RequestMapping(value = {"/tensorflow/recommend_perfume/form6.do"}, method = RequestMethod.GET)
     public ModelAndView form6() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("/tensorflow/recommend_perfume/form6");  // /WEB-INF/views/tensorflow/recommend_perfume/form6.jsp
       
       return mav;
     }
     
     //http://localhost:9091/tensorflow/recommend_perfume/end.do
      @RequestMapping(value = {"/tensorflow/recommend_perfume/end.do"}, method = RequestMethod.GET)
      public ModelAndView end() {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("/tensorflow/recommend_perfume/end");  // /WEB-INF/views/tensorflow/recommend_perfume/end.jsp
            
        return mav;
      }
   
}




