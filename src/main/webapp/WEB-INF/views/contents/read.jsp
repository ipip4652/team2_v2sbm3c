<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="memberno" value="${contentsVO.memberno }" /> 
<c:set var="cateno" value="${contentsVO.cateno }" />
<c:set var="pcompany" value="${contentsVO.pcompany }" /> 
<c:set var="pname" value="${contentsVO.pname }" />        
<c:set var="pcontent" value="${contentsVO.pcontent }" /> 
<c:set var="price" value="${contentsVO.price }" />
<c:set var="word" value="${contentsVO.word }" />
<c:set var="file1" value="${contentsVO.file1 }" />
<c:set var="file1saved" value="${contentsVO.file1saved }" />
<c:set var="thumb1" value="${contentsVO.thumb1 }" />
<c:set var="size1" value="${contentsVO.size1 }" />
<c:set var="rdate" value="${contentsVO.rdate }" />
<c:set var="salecnt" value="${contentsVO.salecnt }" />
<c:set var="cnt" value="${contentsVO.cnt }" />


 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>향수</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  function check_order(){
      let ordercnt = document.getElementById("ordercnt").value;
      if(ordercnt == null || ordercnt == ''){
          alert("수량을 입력해주세요");
          return ordercnt.focus();
      }
      if(ordercnt > ${salecnt}) {
          alert("현재 보유수량보다 많습니다."); 
          return ordercnt.focus();
      } 
  }

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
	    params += '&${ _csrf.parameterName }=${ _csrf.token }';
	    //console.log(params);
	    //return;
	    
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
	            // alert('로그인 성공');
	            $('#login_yn').val('YES'); // 로그인 성공 기록
	            cart_ajax_post(); // 쇼핑카트에 insert 처리 Ajax 호출     
	            
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
		check_order();
	    var f = $('#frm_login');
	    $('#contentsno', f).val(contentsno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
	    
	    console.log('-> contentsno: ' + $('#contentsno', f).val()); 
	    
	    // console.log('-> id:' + '${sessionScope.id}');
	    if ('${sessionScope.id}' != '' || $('#login_yn').val() == 'YES') {  // 로그인이 되어 있다면
	        cart_ajax_post();
	    } else { // 로그인 안된 경우
	        $('#div_login').show();
	    }

	  }

	  <%-- 쇼핑카트 상품 등록 --%>
	  function cart_ajax_post() {
        check_order();
	    var f = $('#frm_login');
	    var contentsno = $('#contentsno', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
        let ordercnt = $('#ordercnt').val();
	    
	    var params = "";
	    // params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
	    params += 'contentsno=' + contentsno;
        params += '&ordercnt=' + ordercnt;
	    params += '&${ _csrf.parameterName }=${ _csrf.token }';
	    console.log('-> cart_ajax_post: ' + params);
	    // return;
	    
	    $.ajax(
	      {
	        url: '/cart/create.do',
	        type: 'post',  // get, post
	        cache: false, // 응답 결과 임시 저장 취소
	        async: true,  // true: 비동기 통신
	        dataType: 'json', // 응답 형식: json, html, xml...
	        data: params,      // 데이터
	        success: function(rdata) { // 응답이 온경우
	          var str = '';
	          console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 쇼핑카트 등록 성공
	          
	          if (rdata.cnt == 1) {
	            var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
	            if (sw == true) {
	              // 쇼핑카트로 이동
	              location.href='/cart/list_by_memberno.do';
	            }           
	          } else {
	            alert('선택한 상품을 장바구니에 담지못했습니다.<br>잠시후 다시 시도해주세요.');
	          }
	        },
	        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	        error: function(request, status, error) { // callback 함수
	          console.log(error);
	        }
	      }
	    );  //  $.ajax END

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
    <c:if test="${sessionScope.grade <= 10 }">
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

  <div style='float: left; width: 79%'>
  <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
  <DIV id='div_login' style='display:none;'>
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
          <span style="font-size: 1.2em; ">${pcompany }</span><br>
          <span style="font-size: 1.5em; font-weight: bold; color:green;">${pname }</span><br>
          <span style="font-size: 1.0em; float:left;">${pcontent }</span><br>
          <span style="font-size: 1.2em; font-weight: bold; color:blue;"><fmt:formatNumber value="${price}" pattern="#,###" /> 원</span><br>
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
           <button type='button' onclick="cart_ajax(${contentsno })" class="btn btn-info">바로 구매</button>
          <button type='button' onclick="cart_ajax(${contentsno })" class="btn btn-info">장바구니</button><br><br>
          
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
           
    </ul>
  </fieldset>
  </div>
    <DIV style=" width: 20%; float: right; text-align:center; line-height:150px;">
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
   <div style='clear:both;'></div>
</DIV>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

