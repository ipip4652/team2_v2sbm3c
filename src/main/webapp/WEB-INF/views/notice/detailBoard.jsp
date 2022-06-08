<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="noticeno" value="${noticeVO.noticeno }" />
<c:set var="title" value="${noticeVO.title }" />
<c:set var="content" value="${noticeVO.content }" />
<c:set var="rdate" value="${noticeVO.rdate }" />
<c:set var="cnt" value="${noticeVO.cnt }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 자세히 보기</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">
function boardList() {
	let targetPlace = "./list.do";
	location.href = targetPlace;
}
function boardDelete() {
	let noticeno = '${noticeVO.noticeno}';
	let answer = confirm('게시글을 삭제하시겠습니까?');
	
	if(answer) {
		location.href="delete.do?noticeno=" + noticeno;
	}
	
}
function boardUpdate() {
	let noticeno = '${noticeVO.noticeno}';
	
	location.href="read_update?noticeno=" + noticeno;
}
</script>
</head>
<body>

<DIV class='title_line'>공지사항</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">

    <A href="javascript:location.reload();">새로고침</A>
    <c:if test="${param.memberno == 1 }">
        <span class='menu_divide' >│</span>
        <A href="./create.do?noticeno=${noticeVO.noticeno }">등록</A>
        <span class='menu_divide' >│</span>
        <A href="./read_update.do?noticeno=${noticeno}">수정</A>
        <span class='menu_divide' >│</span>
        <A href="./delete.do?noticeno=${noticeno}">삭제</A>
    </c:if>  
  </ASIDE> 
<div class="wrapper">
	<h2>[ 게시판 글보기 ]</h2>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${noticeVO.noticeno}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${noticeVO.title}</td>
		</tr>		
		<tr>
			<th>내용</th>
			<td>${noticeVO.content}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				<pre>${noticeVO.rdate}</pre>
			</td>
		</tr>
		<tr>
            <th>조회수</th>
            <td>
                <pre>${noticeVO.cnt}</pre>
            </td>
        </tr>
		<tr>
			<th class="btn" colspan="2">
				<input type="button" value="글목록" onclick="boardList();">

				<!-- 글삭제와 수정은 로그인한 사람과 해당글을 쓴 사람과 같아야 할 수 있다. -->
					<input type="button" value="글수정" onclick="boardUpdate();">
					<input type="button" value="글삭제" onclick="boardDelete();">
				
			</th>
		</tr>
	</table>	
</div>
</body>
</html>











