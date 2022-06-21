<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.notice.NoticeVO" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>공지사항 게시판</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>


<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>공지사항</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <c:if test="${sessionScope.grade < 10}">
        <span class='menu_divide' >│</span>
        <A href="./create.do">등록</A>
        <span class='menu_divide' >│</span>
        <A href="./read_update.do?noticeno=${noticeno}">수정</A>
    </c:if>  
  </ASIDE> 

  <%-- *********************************** 검색 시작 *********************************** --%>
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_by_noticeno_search.do'>
      <input type='hidden' name='noticeno' value='${noticeVO.noticeno }'>
      <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_noticeno_search.do?noticeno=${noticeVO.noticeno}&word='">검색 취소</button>  
      </c:if> 
      &nbsp;   
    </form>
  </DIV>
  <%-- *********************************** 검색 종료 *********************************** --%>
  
    
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>    
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">글번호</TH>
      <TH class="th_bs">제목</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">조회수</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    // Scriptlet
    // List<noticeVO> list = (List<noticeVO>)(request.getAttribute("list"));
    // for (noticeVO noticeVO: list) {
    //    out.println(noticeVO.getName() + "<br>");
    // }
    %>
      <c:forEach var="noticeVO" items="${list }">
      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="memberno" value="${noticeVO.memberno }" />
      <c:set var="title" value="${noticeVO.title } (${noticeVO.replycnt })" />
      <c:set var="rdate" value="${noticeVO.rdate }" />
      <c:set var="cnt" value="${noticeVO.cnt }" />
      <TR>
        <TD class="td_bs">${noticeVO.noticeno }</TD>
        <TD class="td_bs"><A href="./detailBoard.do?noticeno=${noticeno }">${title }</A></TD>
        <TD class="td_bs">${noticeVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">${noticeVO.cnt } </TD>   
      </TR>
        </c:forEach>   
    </tbody>
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


