
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<DIV class='container_main'>
    <!-- 헤더 -->
    <div class="header">

        <div class="left" style="display: block;">
            <!--메인로고메뉴-->
            <div class="logo">
                <a href="/index.do"><img
                    src="http://livelive.godohosting.com/%EB%8D%94%ED%8D%BC%ED%93%B8%20%EB%A6%AC%EB%89%B4%EC%96%BC/%EC%B9%B4%ED%8E%9824%20-%20%EA%B3%B5%EC%8B%9D%EB%AA%B0%20%ED%9A%8C%EC%82%AC%EB%A1%9C%EA%B3%A0(PC).png"
                    alt="" style="width: 120px; height: 91px;"></a>
            </div>

            <!-- cre.ma / 로그인 회원 정보 / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->

            <!--상단 탑 오른쪽 메뉴-->
            <div class="login_menu">
                <ul style="padding-left: 0px;">
                    <li class="login_li">
       	                <c:choose>
                           	<c:when test="${sessionScope.id == null}">
                               	<a href="/member/login.do" class="login_a">login</a>
                           	</c:when>
                           	<c:otherwise>
	                           	<a href="/member/logout.do" class="login_a">${sessionScope.id } logout</a>                               	
                           	</c:otherwise>
                       	</c:choose>
                        <c:choose>
                           	<c:when test="${sessionScope.id == null}">
                               	<a href="/member/create.do" class="login_a">/ join</a>
                           	</c:when>
                       	</c:choose>    
                       	
                            </li>

                    <li class="login_li">
                    	<c:choose>
                           	<c:when test="${sessionScope.id != null}">
                               	<a href="/member/read.do?memberno=${sessionScope.memberno}" class="login_a">my page</a> / <a href="/cart/list_by_memberno.do?memberno=${sessionScope.memberno}" class="login_a">basket</a></li>
                           	</c:when>
                       	</c:choose>
                    
                </ul>
            </div>

            <div class="left_menu">
                <nav class="navbar">
                    <!-- Links -->
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link"
                            style="font-size: 0.9em; font-weight: bold;"
                            href="#">ABOUT US</a></li>
                        <li class="nav-item"><a class="nav-link"
                            style="font-size: 0.9em; font-weight: bold;"
                            href="/notice/list_by_noticeno_search.do?noticeno=&word=">Notice</a></li>
                            
                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            id="navbardrop" data-toggle="dropdown"
                            style="font-size: 0.9em; font-weight: bold;">
                                MAN</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=1&now_page=1"
                                    style="font-size: 0.9em;">Woody</a> <a
                                    class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=4&now_page=1"
                                    style="font-size: 0.9em;">Spicy</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=7&now_page=1"
                                    style="font-size: 0.9em;">Vanila</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=10&now_page=1"
                                    style="font-size: 0.9em;">Musk </a> <a
                                    class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=13&now_page=1"
                                    style="font-size: 0.9em;">Flower</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=16&now_page=1"
                                    style="font-size: 0.9em;">Fruits</a>
                                
                            </div></li>
                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            id="navbardrop" data-toggle="dropdown"
                            style="font-size: 0.9em; font-weight: bold;">
                                WOMAN</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=2&now_page=1"
                                    style="font-size: 0.9em;">Woody</a> <a
                                    class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=5&now_page=1"
                                    style="font-size: 0.9em;">Spicy</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=8&now_page=1"
                                    style="font-size: 0.9em;">Vanila</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=11&now_page=1"
                                    style="font-size: 0.9em;">Musk </a> <a
                                    class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=14&now_page=1"
                                    style="font-size: 0.9em;">Flower</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=17&now_page=1"
                                    style="font-size: 0.9em;">Fruits</a>
                            </div></li>

                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            id="navbardrop" data-toggle="dropdown"
                            style="font-size: 0.9em; font-weight: bold;">
                                UNISEX</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=3&now_page=1"
                                    style="font-size: 0.9em;">Woody</a> <a
                                    class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=6&now_page=1"
                                    style="font-size: 0.9em;">Spicy</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=9&now_page=1"
                                    style="font-size: 0.9em;">Vanila</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=12&now_page=1"
                                    style="font-size: 0.9em;">Musk </a> <a
                                    class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=15&now_page=1"
                                    style="font-size: 0.9em;">Flower</a>
                                <a class="dropdown-item" href="/contents/list_by_cateno_search_paging.do?cateno=18&now_page=1"
                                    style="font-size: 0.9em;">Fruits</a>
                            </div></li>


                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            id="navbardrop" data-toggle="dropdown"
                            style="font-size: 0.8em; font-weight: bold;">
                                cs center</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item-text"
                                    style="font-size: 11px; letter-spacing: 0.5px; line-height: 14px; font-weight: bold; border-top: 0px solid #000; margin-bottom: 10px;">
                                    <!--아래의 내용중 검정글씨만 수정해주세요^^--> CALL
                                    CENTER <br>070-8631-4548 <br>
                                    <br>KAKAOTALK ID <br>theparfum
                                    <br> <br> 평일 10:00 - 17:00<br>
                                    점심시간 11:30 - 12:30<br> 토요일,
                                    일요일, 공휴일 off
                                </a>
                            </div></li>
                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#"
                            id="navbardrop" data-toggle="dropdown"
                            style="font-size: 0.8em; font-weight: bold;">
                                bank info</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item-text"
                                    style="font-size: 11px; letter-spacing: 0.2px; line-height: 14px; font-weight: bold; border-top: 0px solid #000; margin-bottom: 10px;">
                                    <!--아래의 내용중 검정글씨만 수정해주세요^^--> KB
                                    국민은행<br> 710437 - 00 - 000042<br>
                                    <br> NH 농협<br> 356 - 0855
                                    - 2997 - 03<br> <br> 예금주<br>
                                    신다윗(리브리브)
                                </a>
                            </div></li>



                    </ul>

                </nav>

            </div>
            

        </div>
        <div class ="right_menu">
                <a href="/tensorflow/recommend_perfume/start.do">관심 카테고리 추천</a>
        </div>

    </div>

    <%-- 내용 --%>
    <DIV class='content'>