<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

  $(function() {
    // var contentsno = 0;
    // $('#btn_cart').on('click', function() { cart_ajax(contentsno)});
    $('#btn_login').on('click', login_ajax);
    $('#btn_loadDefault').on('click', loadDefault);
  });
  
  function recom_ajax(contentsno, status_count) {
    console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body      
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'contentsno=' + contentsno; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/contents/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          if (rdata.cnt == 1) {
            // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
            $('#recom_' + status_count).html('♥('+rdata.recom+')');     // A 태그에 animation 출력
          } else {
            // $('#span_animation_' + status_count).html("X");
            $('#recom_' + status_count).html('♥(X)');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    $('#recom_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).css('text-align', 'center');
    // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
      
  }  

  function loadDefault() {
    $('#id').val('user1');
    $('#passwd').val('1234');
  } 
  
  <%-- 로그인 --%>
  function login_ajax() {
    var params = "";
    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // params += '&${ _csrf.parameterName }=${ _csrf.token }';
    // console.log(params);
    // return;
    
    $.ajax(
      {
        url: '/member/login_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
          
          if (rdata.cnt == 1) {
            // 쇼핑카트에 insert 처리 Ajax 호출
            $('#div_login').hide();
            alert('로그인 성공');
            
          } else {
            alert('로그인에 실패했습니다.<br>잠시후 다시 시도해주세요.');
            
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }

  <%-- 쇼핑 카트에 상품 추가 --%>
  function cart_ajax(contentsno) {
    var f = $('#frm_login');
    $('#contentsno', f).val(contentsno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
    
    console.log('-> contentsno: ' + $('#contentsno', f).val()); 
    
    // console.log('-> id:' + '${sessionScope.id}');
    if ('${sessionScope.id}' == '') {  // 로그인이 안되어 있다면
      $('#div_login').show();      
    } else {  // 로그인 한 경우
      // cart_ajax_post();   // 쇼핑카트에 insert 처리 Ajax 호출 
    }

  }

</script>
 
</head> 
  
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../categrp/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../cate/list_by_categrpno.do?categrpno=${categrpVO.categrpno }" class='title_link'>${categrpVO.name }</A> >
  <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
  </ASIDE> 

  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search_paging.do'>
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
  
  <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
  <DIV id='div_login' style='display: none;'>
    <div style='width: 80%; margin: 0px 0px 0px 40%;'>
	    <FORM name='frm_login' id='frm_login' method='POST' action='/member/login_ajax.do' class="form-horizontal">
	      <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
	      <input type="hidden" name="contentsno" id="contentsno" value="contentsno">
	
	      <div class="form-group">
	        <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
	        <div class="col-md-8">
	          <input type='text' class="form-control" name='id' id='id' 
	                     value='${ck_id }' required="required" 
	                     style='width: 40%;' placeholder="아이디" autofocus="autofocus">
	          <Label>   
	            <input type='checkbox' name='id_save' value='Y' 
	                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
	          </Label>                   
	        </div>
	   
	      </div>   
	   
	      <div class="form-group">
	        <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
	        <div class="col-md-8">
	          <input type='password' class="form-control" name='passwd' id='passwd' 
	                    value='${ck_passwd }' required="required" style='width: 40%;' placeholder="패스워드">
	          <Label>
	            <input type='checkbox' name='passwd_save' value='Y' 
	                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
	          </Label>
	        </div>
	      </div>   
	    </FORM>
    </div>
   
    <div style='text-align: center; margin: 10px auto;'>
      <button type="button" id='btn_login' class="btn btn-info">로그인</button>
      <button type='button' onclick="location.href='./create.do'" class="btn btn-info">회원가입</button>
      <button type='button' id='btn_loadDefault' class="btn btn-info">테스트 계정</button>
      <button type='button' id='btn_cancel' class="btn btn-info" onclick="$('#div_login').hide();">취소</button>
    </div>
  
  </DIV>
  <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>
  
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 20%;"></col>
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
      <c:forEach var="contentsVO" items="${list }" varStatus="status">
        <c:set var="contentsno" value="${contentsVO.contentsno }" />
        <c:set var="cateno" value="${contentsVO.cateno }" />
        <c:set var="title" value="${contentsVO.title }" />
        <c:set var="content" value="${contentsVO.content }" />
        <c:set var="recom" value="${contentsVO.recom }" />
        
        <c:set var="file1" value="${contentsVO.file1 }" />
        <c:set var="thumb1" value="${contentsVO.thumb1 }" />
        
        <c:set var="price" value="${contentsVO.price }" />
        <c:set var="dc" value="${contentsVO.dc }" />
        <c:set var="saleprice" value="${contentsVO.saleprice }" />
        <c:set var="point" value="${contentsVO.point }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <a href="./read.do?contentsno=${contentsno}&now_page=${param.now_page }"><IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <a href="./read.do?contentsno=${contentsno}&now_page=${param.now_page }&word=${param.word}"><strong>${title}</strong> ${content}</a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            <del><fmt:formatNumber value="${price}" pattern="#,###" /></del><br>
            <span style="color: #FF0000; font-size: 1.2em;">${dc} %</span>
            <strong><fmt:formatNumber value="${saleprice}" pattern="#,###" /></strong><br>
            <span style="font-size: 0.8em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /></span>
            <span><A id="recom_${status.count }" href="javascript:recom_ajax(${contentsno }, ${status.count })" class="recom_link">♥(${recom })</A></span>

            <%-- <span id="span_animation_${status.count }"></span> --%>
            <br>
            <button type='button' id='btn_cart' class="btn btn-info" style='margin-bottom: 2px;'
                        onclick="cart_ajax(${contentsno })">장바 구니</button><br>
            <button type='button' id='btn_ordering' class="btn btn-info" 
                        onclick="cart_ajax(${contentsno })">바로 구매</button>  
                                    
          </td>
          <td style='vertical-align: middle; text-align: center;'>
            <A href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page }"><img src='/contents/images/update.png'></A>
            <A href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page }&cateno=${cateno}"><img src='/contents/images/delete.png'></A>
          </td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
