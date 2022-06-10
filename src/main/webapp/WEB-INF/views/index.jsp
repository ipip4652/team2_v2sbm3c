<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>The FARFUM </title>
<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
</head>

</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.memberno < 10}">
			<jsp:include page="./menu/top_ckup.jsp" flush='false' />
		</c:when>
		<c:otherwise>
			<jsp:include page="./menu/top.jsp" flush='false' />                               	
		</c:otherwise>
	</c:choose>
    
    
<% 
String filenames[] = {"//theparfum.co.kr/web/product/medium/202109/0e344e9ba5d1989510c7b17d2b770721.png", "//theparfum.co.kr/web/product/medium/202010/ac4e481bbd087b49187a678397f6889a.jpg", "http://theparfum.co.kr/web/product/medium/202010/e7b5f940f9068e482123dcefe6fd99c9.jpg","http://theparfum.co.kr/web/product/medium/20200518/ab7ffcbfdf58c7f3b08a043483828985.jpg","http://theparfum.co.kr/web/product/medium/20200518/f68bc44b406436020a957f8b79490d37.jpg","http://theparfum.co.kr/web/product/medium/20200518/86ad159603a5b986eddef2c0a3023838.jpg","//theparfum.co.kr/web/product/medium/202109/0e344e9ba5d1989510c7b17d2b770721.png","//theparfum.co.kr/web/product/medium/202109/0e344e9ba5d1989510c7b17d2b770721.png","//theparfum.co.kr/web/product/medium/202109/0e344e9ba5d1989510c7b17d2b770721.png"};
String filelinks[]={"http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=13&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=15&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word=","http://localhost:9091/contents/read.do?contentsno=27&now_page=1&word="};
request.setAttribute("list1",filenames);
request.setAttribute("list2",filelinks);


%>
    <DIV style='width: 100%; margin: 10px auto; text-align: center;'>
        

        <c:forEach var="filename" items="${list1}" varStatus="status">           
            <%-- 하나의 행에 이미지를 3개씩 출력후 행 변경, index는 0부터 시작 --%>
            <c:if test="${status.index % 3 == 0 && status.index != 0 }">
                <br>
            </c:if>
            <!-- 하나의 이미지, 33 * 3 = 99% -->
            <DIV style='width: 30%; float: left; margin: 0.5%; padding: 0.5%; background-color: #FFFFFF; text-align: center;'> 
                <a href="${list2[status.index]}"> <img src="${filename}"  alt="" class="thumb"> </a>
            </DIV>
        </c:forEach>
        <!-- 갤러리 Layout 종료 -->
        <br> <br>
    </DIV>

    <DIV style='margin: 0px auto; width: 90%;'>
        <DIV style='float: left; width: 50%;'></DIV>
        <DIV style='float: left; width: 50%;'></DIV>
    </DIV>

    <DIV style='width: 94.8%; margin: 0px auto;'></DIV>

    <jsp:include page="./menu/bottom.jsp" flush='false' />

</body>
</html>

