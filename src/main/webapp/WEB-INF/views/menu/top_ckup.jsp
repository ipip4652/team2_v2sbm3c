<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
    <!-- 헤더 -->
    <div class="header">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="/">Resort</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle Navigation">
                <span class="navbar-toggler-icon"></span>
            </button>    
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">상품</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/categrp/list.do">카테고리 그룹</a>
                            <a class="dropdown-item" href="/cate/list_all.do">카테고리 전체 목록</a>
                            <a class="dropdown-item" href="/cate/list_all_join.do">카테고리 전체 목록 Join</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/cart/list_by_memberno.do">쇼핑카트</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/order_pay/list_by_memberno.do">주문 결재</a>
                    </li>                    
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${sessionScope.id == null}">
                                <a class="nav-link" href="/member/login.do">로그인</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href='/member/logout.do'>${sessionScope.id } 로그아웃</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">회원</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/member/create.do">회원 가입</a>
                            <a class="dropdown-item" href="#">아이디 찾기</a>
                            <a class="dropdown-item" href="#">비밀번호 찾기</a>
                            <a class="dropdown-item" href="/member/passwd_update.do">비밀번호 변경</a>
                            <a class="dropdown-item" href="#">회원 정보 수정</a>
                            <a class="dropdown-item" href="#">회원 탈퇴</a>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${sessionScope.grade < 10}"> <%-- 로그인 한 경우 --%>                   
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">관리자</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/categrp/list.do">카테고리 그룹</a>
                                    <a class="dropdown-item" href="/cate/list_all.do">카테고리 전체 목록</a>
                                    <a class="dropdown-item" href="/cate/list_all_join.do">카테고리 전체 목록 Join</a>
                                    <a class="dropdown-item" href="/member/list.do">회원 목록</a>
                                    <a class="dropdown-item" href="/notice/list_by_noticeno_search.do?noticeno=&word=">공지사항</a>
                                </div>
                            </li>
                        </c:when>
                    </c:choose>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">추천시스템</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/tensorflow/recommend_perfume/start.do">관심 카테고리 추천</a>
                        </div>
                    </li>                    
                </ul>
            </div>    
        </nav>

    </div>
  
  <%-- 내용 --%> 
  <DIV class='content'>
  
  