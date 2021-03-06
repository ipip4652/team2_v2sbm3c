<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pcompany" value="${contentsVO.pcompany }" />
<c:set var="pname" value="${contentsVO.pname }" />
<c:set var="pcontent" value="${contentsVO.pcontent }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="price" value="${contentsVO.price }" />
<c:set var="salecnt" value="${contentsVO.salecnt }" />
<c:set var="contentsno" value="${contentsVO.contentsno }" />
         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>향수 사이트</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(function(){
 
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
  <A href="../categrp/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../cate/list_by_categrpno.do?categrpno=${categrpVO.categrpno }" class='title_link'>${categrpVO.name }</A> >
  <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A> >
  ${pname } 수정
</DIV>

<DIV class='content_body'>
   <ASIDE class="aside_right">
      <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
      <span class='menu_divide' >│</span>
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span>
      <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }">기본 목록형</A>    
      <span class='menu_divide' >│</span>
     <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
    </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search.do'>
      <input type='hidden' name='cateno' value='${cateVO.cateno }'>
      <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='contentsno' value='${contentsno }'>
    <input type="hidden" name="cateno" value="${cateVO.cateno }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    <input type="hidden" name="now_page" value="${param.now_page }">
    <input type="hidden" name="word_search" value="${param.word }"> <%-- 2중 전송 ERROR 처리됨--%>
    <div class="form-group">
       <label class="control-label col-md-2">향수회사명</label>
       <div class="col-md-10">
         <input type='text' name='pcompany' value='${pcompany }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>    
    <div class="form-group">
       <label class="control-label col-md-2">향수명</label>
       <div class="col-md-10">
         <input type='text' name='pname' value='${pname }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">상품 설명</label>
       <div class="col-md-10">
         <textarea name='pcontent' required="required" class="form-control" rows="20" style='width: 100%;'>${pcontent }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">검색어</label>
       <div class="col-md-10">
         <input type='text' name='word' value='${word }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-2">판매가</label>
       <div class="col-md-10">
         <input type='number' name='price' value='${price }' required="required" autofocus="autofocus"
                    min="0" max="10000000" step="100" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>          
      
    <div class="form-group">
       <label class="control-label col-md-2">보유 수량</label>
       <div class="col-md-10">
         <input type='number' name='salecnt' value='${salecnt }' required="required" 
                    min="0" max="99999" step="1" class="form-control" style='width: 100%;'>
       </div>
    </div>

    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


