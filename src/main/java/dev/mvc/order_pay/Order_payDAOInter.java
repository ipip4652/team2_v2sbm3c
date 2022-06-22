package dev.mvc.order_pay;

import java.util.HashMap;
import java.util.List;

public interface Order_payDAOInter {
  /**
   * 
   * @param order_payVO
   * @return
   */
  public int create(Order_payVO order_payVO);
  
  /**
   * 회원별 주문 결재 목록
   * @param memberno
   * @return
   */
  public List<Order_payVO> list_by_memberno(int memberno);
  
  /**
   * 평점 업데이트
   * @param map
   * @return
   */
  public void update_rating(HashMap<Object, Object> map);
}
