package dev.mvc.categrp;

import java.util.ArrayList;
import java.util.List;

public class TestCategrpDAO {

  public static void main(String[] args) {
    // ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
    // Interface 객체 생성 불가능
    // ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
    // Cannot instantiate the type List<CategrpVO>
    // List<CategrpVO> list_error = new List<CategrpVO>();  // 객체 생성 불가능
    // 인터페이스  <------ 구현 클래스
    List<CategrpVO> list = new ArrayList<CategrpVO>();
    // ArrayList<CategrpVO> list2 = new ArrayList<CategrpVO>();
    
    CategrpVO categrpVO = null;
    
    // new: 새로운 메모리를 할당
    categrpVO = new CategrpVO(1, "Spring", 1, "Y", "2021-03-01");
    System.out.println(categrpVO.hashCode());
    list.add(categrpVO);
    
    categrpVO = new CategrpVO(2, "Summer", 2, "N", "2021-03-02");
    System.out.println(categrpVO.hashCode());
    list.add(categrpVO);
    
    categrpVO = new CategrpVO(3, "Fall", 3, "Y", "2021-03-03");
    System.out.println(categrpVO.hashCode());
    list.add(categrpVO);
    
    System.out.println(list.size());
    
    for(int i=0; i < list.size(); i++) {
      categrpVO = list.get(i);
      System.out.println(categrpVO.toString());
      
    }
    
    System.out.println("---------------------------------------");
    for(CategrpVO categrpVO2: list) {
      System.out.println(categrpVO2.toString());
      
    }
    
  }

}

