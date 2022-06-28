<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
    #starform fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        border: 0; /* 필드셋 테두리 제거 */
    }
    #starform input[type=radio]{
        display: none; /* 라디오박스 감춤 */
    }
    #starform label{
        font-size: 0.8em; /* 이모지 크기 */
        color: transparent; /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
    }
    #starform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
    }
    #starform label:hover ~ label{
        text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
    }
    #starform fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl; /* 이모지 순서 반전 */
        border: 0; /* 필드셋 테두리 제거 */
    }
    #starform input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
    }   
</style>
 
<script type="text/javascript">
  $(function(){
      <c:forEach items="${list}" var="item">

         $('input[name="'+${item.order_payno}+'_rating"][type="radio"]').change(function(){ // set
              console.log(${item.order_payno}+', ' +this.value);
              let params = 'order_payno=' + ${item.order_payno};
              params += '&rating=' + this.value;
              $.ajax({
                  url: '/order_pay/update_rating.do', // spring execute
                  type: 'get',  // post
                  async: true,  // true: 비동기 통신
                  data: params      // 데이터
              }); // 반환이 불필요함. 별점 업데이트만 수행
         });

         $('input[name="'+${item.order_payno}+'_rating"][type="radio"][value='+${item.rating}+']').prop('checked',true);
      </c:forEach>

  });
</script>
</head> 
 
<body>

<c:choose>
	<c:when test="${sessionScope.grade < 10}">
		<jsp:include page="../menu/top_ckup.jsp" flush='false' />
	</c:when>
	<c:otherwise>
		<jsp:include page="../menu/top.jsp" flush='false' />                               	
	</c:otherwise>
</c:choose>
 
  <DIV class='title_line'>
    ${sessionScope.id }님 주문결재 내역
  </DIV>

  <DIV class='content_body' style='width: 100%;'>

    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
   
   
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <%-- <col style='width: 5%;'/>
      <col style='width: 5%;'/> --%>
      <col style='width: 7%;'/>
      <col style='width: 15%;'/>
      <col style='width: 25%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 13%;'/>
      <col style='width: 15%;'/>
      <col style='width: 5%;'/>
    </colgroup>
    <TR>
      <!-- <TH class='th_bs'>주문<br>번호</TH>
      <TH class='th_bs'>회원<br>번호</TH> -->
      <TH class='th_bs'>수취인<br>성명</TH>
      <TH class='th_bs'>수취인<br>전화번호</TH>
      <TH class='th_bs'>수취인<br>주소</TH>
      <TH class='th_bs'>결재 타입</TH>
      <TH class='th_bs'>결재 금액</TH>
      <TH class='th_bs'>주문일</TH>
      <TH class='th_bs'>별점</TH>
      <TH class='th_bs'>조회</TH>
    </TR>
   
    <c:forEach var="order_payVO" items="${list }">
      <c:set var="order_payno" value ="${order_payVO.order_payno}" />
      <c:set var="memberno" value ="${order_payVO.memberno}" />
      <c:set var="rname" value ="${order_payVO.rname}" />
      <c:set var="rtel" value ="${order_payVO.rtel}" />
      <c:set var="address" value ="(${order_payVO.rzipcode}) ${order_payVO.raddress1} ${order_payVO.raddress1}" />
      <c:set var="paytype" value ="${order_payVO.paytype}" />
      <c:set var="amount" value ="${order_payVO.amount}" />
      <c:set var="rdate" value ="${order_payVO.rdate}" />
      
       
    <TR>
      <%-- <TD class=td_basic>${order_payno}</TD>
      <TD class=td_basic><A href="/member/read.do?memberno=${memberno}">${memberno}</A></TD> --%>
      <TD class='td_basic'>${rname}</TD>
      <TD class='td_left'>${rtel}</TD>
      <TD class='td_basic'>${address}</TD>
      <TD class='td_basic'>
        <c:choose>
          <c:when test="${paytype == 1}">신용 카드</c:when>
          <c:when test="${paytype == 2}">모바일</c:when>
          <%-- <c:when test="${paytype == 3}">포인트</c:when> --%>
          <c:when test="${paytype == 4}">계좌 이체</c:when>
          <c:when test="${paytype == 5}">직접 입금</c:when>
        </c:choose>
      </TD>
      <TD class='td_basic'><fmt:formatNumber value="${amount }" pattern="#,###" /></TD>
      <TD class='td_basic'>${rdate.substring(1,16) }</TD>
      <TD class='td_basic'>
        <form name="starform" id="starform" method="post" action="./save">
            <fieldset>
                <input type="radio" name="${order_payno }_rating" value="5" id="${order_payno }_rate1"><label for="${order_payno }_rate1">⭐</label>
                <input type="radio" name="${order_payno }_rating" value="4" id="${order_payno }_rate2"><label for="${order_payno }_rate2">⭐</label>
                <input type="radio" name="${order_payno }_rating" value="3" id="${order_payno }_rate3"><label for="${order_payno }_rate3">⭐</label>
                <input type="radio" name="${order_payno }_rating" value="2" id="${order_payno }_rate4"><label for="${order_payno }_rate4">⭐</label>
                <input type="radio" name="${order_payno }_rating" value="1" id="${order_payno }_rate5"><label for="${order_payno }_rate5">⭐</label>
            </fieldset>
        </form>
      </TD>
      <TD class='td_basic'>
        <A href="/order_item/list_by_memberno.do?order_payno=${order_payno}"><img src="/order_pay/images/bu6.png" title="주문 내역 상세 조회"></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.reload();" class="btn btn-primary">새로 고침</button>
  </DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>