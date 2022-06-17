<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  function delete_func(cartno) {  // GET -> POST 전송, 상품 삭제
    var frm = $('#frm_post');
    frm.attr('action', './delete.do');
    $('#cartno',  frm).val(cartno);
    
    frm.submit();
  }   

  function update_cnt(cartno) {  // 수량 변경
    var frm = $('#frm_post');
    frm.attr('action', './update_cnt.do');
    $('#cartno',  frm).val(cartno);
    
    var new_cnt = $('#' + cartno + '_cnt').val();  // $('#1_cnt').val()로 변환됨.
    $('#cnt',  frm).val(new_cnt);

    // alert('cnt: ' + $('#cnt',  frm).val());
    // alert('cartno: ' + $('#cartno',  frm).val());
    // return;
    
    frm.submit();
    
  }
</script>

<style type="text/css">

    
</style>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
<%-- GET -> POST: 상품 삭제, 수량 변경용 폼 --%>
<form name='frm_post' id='frm_post' action='' method='post'>
  <input type='hidden' name='cartno' id='cartno'>
  <input type='hidden' name='cnt' id='cnt'>
  <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
</form>
 
<DIV class='title_line'>
  쇼핑 카트
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
  <%--<A href="/contents/list_shipping_main.do">쇼핑 계속하기</A> <span class='menu_divide' >│</span>  
   --%>    
    <%--<A href="javascript:location.reload();">새로고침</A>
     <DIV class='menu_line'></DIV> --%>
  </ASIDE> 

  <div style="background-color: #DDDDDD; padding: 17PX 17PX 5PX 17px;">
  <table class="table table-condensed" style='width: 100%; background-color: #FFFFFF;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 35%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 15%;"></col> <%-- 수량 --%>
      <col style="width: 15%;"></col> <%-- 합계 --%>
      <col style="width: 10%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
<!--     <thead>
      <tr>
        <th style='text-align: center;'>파일</th>
        <th style='text-align: center;'>상품명</th>
        <th style='text-align: center;'>정가, 할인률, 판매가, 포인트</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    
    </thead> -->
    
    <%-- table 내용 --%>
    <tbody>
      <c:choose>
        <c:when test="${list.size() > 0 }"> <%-- 상품이 있는지 확인 --%>
          <c:forEach var="cartVO" items="${list }"> <%-- 상품목록 출력 --%>
            <c:set var="cartno" value="${cartVO.cartno }" />
            <c:set var="contentsno" value="${cartVO.contentsno }" />
            <c:set var="pname" value="${cartVO.pname }" />
            <c:set var="thumb1" value="${cartVO.thumb1 }" />
            <c:set var="price" value="${cartVO.price }" />
            <c:set var="memberno" value="${cartVO.memberno }" />
            <c:set var="cnt" value="${cartVO.cnt }" />
            <c:set var="tot" value="${cartVO.tot }" />
            <c:set var="rdate" value="${cartVO.rdate }" />
            
            <tr> 
              <td style='vertical-align: middle; text-align: center;'>
                <c:choose>
                  <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                    <%-- /static/contents/storage/ --%>
                    <a href="/contents/read.do?contentsno=${contentsno}"><IMG src="/contents/storage/${thumb1 }" style="width: 100%;"></a> 
                  </c:when>
                  <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                    ${contentsVO.file1}
                  </c:otherwise>
                </c:choose>
              </td>  
              <td style='vertical-align: middle;'>
                <a href="/contents/read.do?contentsno=${contentsno}"><strong>${pname}</strong></a> 
              </td> 
              <td style='vertical-align: middle; text-align: center;'>
              <strong><fmt:formatNumber value="${price}" pattern="\\ #,###" /></strong><br>
              </td>
              <td style='vertical-align: middle; text-align: center;'>
                <input type='number' id='${cartno }_cnt' min='1' max='100' step='1' value="${cnt }" 
                  style='width: 52px;'><br>
                <button type='button' onclick="update_cnt(${cartno})" class='btn btn-secondary' style='margin-top: 5px;'>변경</button>
              </td>
              <td style='vertical-align: middle; text-align: center; font-size:1.1em;'>
                <fmt:formatNumber value="${tot}" pattern="#,### 원" />
              </td>
              <td style='vertical-align: middle; text-align: center;'>
                <button type='button' onclick="javascript: delete_func(${cartno })" class='btn btn-secondary' style='margin-top: 5px;'>삭제</button>
              </td>
            </tr>
          </c:forEach>
        
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="6" style="text-align: center; font-size: 1.3em;">쇼핑 카트에 상품이 없습니다.</td>
          </tr>
        </c:otherwise>
      </c:choose>
      
      
    </tbody>
    
  </table>
  </div>
 <div style="float: right;">
	 <pre style='display:inline; font-size: 0.8em; '>
	 상품 금액 <fmt:formatNumber value="${tot_sum }" pattern="#,###" /> 원 + 배송비 <fmt:formatNumber value="${baesong_tot }" pattern="#,###" /> 원 = 총액: </pre>
	 
	 <pre style='display:inline; font-size: 1.5em; font:bold; color: #FF0000;'><fmt:formatNumber value="${total_ordering }" pattern="#,###" /> 원</pre>
	 
 </div>
 
  
  <div style='margin-top: 50px; margin-bottom: 50px;  margin-right: 100px; width: 100%;'>
    <tbody>
          <br style='clear:both;'>
          <form name='frm' id='frm' style='margin-top: 0px; float: right;' action="/order_pay/create.do" method='get'>
            <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">  
            <button type='button' class='btn btn-dark' style='font-size: 0.9em;' onclick="location.href='/index.do'">쇼핑 계속하기</button>
            <button type='submit' id='btn_order' class='btn btn-dark' style='font-size: 0.9em;'>주문하기</button>      
          </form>
    </tbody>
  </div>   
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>