<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="cateno" value="${contentsVO.cateno }" />
<c:set var="title" value="${contentsVO.title }" />        
<c:set var="price" value="${contentsVO.price }" />
<c:set var="dc" value="${contentsVO.dc }" />
<c:set var="saleprice" value="${contentsVO.saleprice }" />
<c:set var="point" value="${contentsVO.point }" />
<c:set var="salecnt" value="${contentsVO.salecnt }" />
<c:set var="file1" value="${contentsVO.file1 }" />
<c:set var="file1saved" value="${contentsVO.file1saved }" />
<c:set var="thumb1" value="${contentsVO.thumb1 }" />
<c:set var="content" value="${contentsVO.content }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="size1_label" value="${contentsVO.size1_label }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  function check_order(){
      let ordercnt = document.getElementById("ordercnt").value;
      if(ordercnt > ${salecnt}) {
          alert("현재 보유수량보다 많습니다."); 
          return ordercnt.focus();
      } 
  }

</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../categrp/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../cate/list_by_categrpno.do?categrpno=${categrpVO.categrpno }" class='title_link'>${categrpVO.name }</A> >
  <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">

    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
    <c:if test="${param.id == 'admin' }">
        <span class='menu_divide' >│</span>
        <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
        <span class='menu_divide' >│</span>
        <A href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page}&word=${param.word }">수정</A>
        <span class='menu_divide' >│</span>
        <A href="./update_file.do?contentsno=${contentsno}&now_page=${param.now_page}&word=${param.word }">파일 수정</A>  
        <span class='menu_divide' >│</span>
        <A href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page}&cateno=${cateno}&word=${param.word }">삭제</A>
    </c:if>  
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search_paging.do'>
      <input type='hidden' name='cateno' value='${cateVO.cateno }'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 40%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <IMG src="/contents/storage/${file1saved }" style="width: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>

        <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px; margin-bottom: 30px;">
          <span style="font-size: 1.5em; font-weight: bold;">${title }</span><br>
          <!-- <span style="color: #FF0000; font-size: 2.0em;">${dc} %</span>
          <span style="font-size: 1.5em; font-weight: bold;"><fmt:formatNumber value="${saleprice}" pattern="#,###" /> 원</span>
          <del><fmt:formatNumber value="${price}" pattern="#,###" /> 원</del><br> -->
          <span style="font-size: 1.2em; font-weight: bold; color:blue;"><fmt:formatNumber value="${saleprice}" pattern="#,###" /> 원</span><br>
          <c:if test="${salecnt > 0}">
          <span style="font-size: 1.0em; color:green;">구매가능</span>
          </c:if>
          <c:if test="${salecnt < 1}">
          <span style="font-size: 1.0em; color:red;">현재상품 구매 불가능합니다.</span>
          </c:if>

          <span style="font-size: 1.0em;">(보유 수량: <fmt:formatNumber value="${salecnt}" pattern="#,###" /> 개)</span><br>
          <span style="font-size: 1.0em;">구매 수량</span><br>
          <form>
          <input type="text" name='ordercnt' id ='ordercnt' placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" 
                       class="form-control" style='width: 30%;'/><br>
<!--           <button type='button' onclick="" class="btn btn-info">장바 구니</button>            -->          
           <button type='button' onclick="return check_order()" class="btn btn-info">바로 구매</button>
          <button type='button' onclick="return check_order()" class="btn btn-info">관심 상품</button><br><br>
          
          </form>
        </DIV> 


      </li>
<%--       <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${word }
        </DIV>
      </li> --%>
      <li class="li_none">
        <DIV>
        
          <c:if test="${file1.trim().length() > 0 }">
            <span style="text-decoration: none; float: left;">
                첨부 파일: <A href='/download?dir=/contents/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
            </span>
          </c:if>
        </DIV>
      </li>  
           <DIV style="  position: absolute; top: 250px; right: 160px; width: 200px; height:195px; float: right; text-align:center; line-height:150px;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <IMG src="/contents/storage/${file1saved }" style="width: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
            추천상품 영역
           </DIV> 
    </ul>
  </fieldset>

</DIV>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

