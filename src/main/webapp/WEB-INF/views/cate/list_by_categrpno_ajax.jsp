<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>카테고리 리스트</title>

<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>

<script type="text/javascript">
	$(function() {
	    $('#btn_create_cancel').on('click', cancel);    
	    $('#btn_update_cancel').on('click', cancel);
	    $('#btn_delete_cancel').on('click', cancel);
	});

    function read_update_ajax(cateno) { // 수정
        // console.log('update');
        $('#panel_create').css('display', 'none'); // 태그 감추기
        $('#panel_update').css('display', '');  // 태그 출력 

        // console.log('-> cateno:' + cateno);
        let params = "";
        // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
        params = 'cateno=' + cateno; // 공백이 값으로 있으면 안됨.

        $.ajax(
          {
            url: '/cate/read_ajax.do',
            type: 'get',  // get, post
            cache: false, // 응답 결과 임시 저장 취소
            async: true,  // true: 비동기 통신
            dataType: 'json', // 응답 형식: json, html, xml...
            data: params,      // 데이터
            success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
              // {"categrpno":1,"rdate":"2022-04-29 09:48:15","name":"분식","cnt":0,"cateno":1}
              let categrpno = rdata.categrpno;
              let rdate = rdata.rdate;
              let name = rdata.name;
              let cnt = rdata.cnt;
              let cateno = rdata.cateno;

              let frm_update = $('#frm_update'); // id가 frm_update인 태그
              $('#cateno', frm_update).val(cateno); // frm_update 폼에서 id가 cateno인 태그
              $('#cnt', frm_update).val(cnt);
              $('#name', frm_update).val(name);
              $('#rdate', frm_update).val(rdate);
              $('#categrpno', frm_update).val(categrpno);
              
              // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
              // console.log('-> btn_recom: ' + $('#btn_recom').html());
              // $('#btn_recom').html('♥('+rdata.recom+')');
              $('#span_animation').hide();
            },
            // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
            error: function(request, status, error) { // callback 함수
              console.log(error);
            }
          }
        );  //  $.ajax END

        $('#span_animation').css('text-align', 'center');
        $('#span_animation').html("<img src='/contents/images/ani03.gif' style='width: 3%;'>");
        $('#span_animation').show(); // 숨겨진 태그의 출력
        
    }

    function cancel() { // 초기 상태로 변경
        $('#panel_create').css('display', '');
        $('#panel_update').css('display', 'none');  // 태그 출력
        $('#panel_delete').css('display', 'none');  // 태그 출력 
    }

    // 삭제 폼(자식 레코드가 없는 경우의 삭제)
    function read_delete_ajax(cateno) {
      $('#msg_count_by_cateno').hide();
      $('#btn_submit').show();  // 삭제 버튼 출력
        
      $('#panel_create').css("display","none");  // 태그를 숨김
      $('#panel_update').css("display","none"); // 태그를 숨김  
      $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
      // return;
      
      // console.log('-> categrpno:' + categrpno);
      let params = "";
      // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      params = 'cateno=' + cateno; // 공백이 값으로 있으면 안됨.
      
      $.ajax(
        {
          url: '/cate/read_ajax.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
            // {"categrpno":1,"rdate":"2022-04-29 09:48:15","name":"분식","cnt":0,"cateno":1,"count_by_categrpno":1}
            let cateno = rdata.cateno;
            let name = rdata.name;
            let count_by_cateno = parseInt(rdata.count_by_cateno); // 카테고리 그룹에 속한 카테고리수
            console.log('count_by_cateno: ' + count_by_cateno);

            let frm_delete = $('#frm_delete');
            $('#cateno', frm_delete).val(cateno);
            
            $('#frm_delete_cateno').html(cateno);  // <label>그룹 이름</label><span id='frm_delete_name'></span>  
            $('#frm_delete_name').html(name);
            
            if (count_by_cateno > 0) {  // 자식 레코드가 있다면
                $('#msg_count_by_cateno').show();
                $('#btn_submit').hide();  // 삭제 버튼 숨기기
            } else {
                $('#msg_count_by_cateno').hide();
                $('#btn_submit').show();  // 삭제 버튼 출력
            }

            $('#span_animation_delete').hide();
          },
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );  //  $.ajax END

      $('#span_animation_delete').css('text-align', 'center');
      $('#span_animation_delete').html("<img src='/cate/images/ani03.gif' style='width: 3%;'>");
      $('#span_animation_delete').show(); // 숨겨진 태그의 출력
    }	
	  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../categrp/list.do" class='title_link'>카테고리 그룹</A> > ${categrpVO.name }</DIV>

<DIV class='content_body'>

  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>카테고리 그룹 번호</label>
      <input type='text' name='categrpno' value='${param.categrpno }' > 
    
      <label>카테고리 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;' autofocus="autofocus">
  
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  
  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
          text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type="hidden" name="cateno" id="cateno" value="">
      
      <label>카테고리 그룹 번호</label>
      <input type='number' name='categrpno' id='categrpno' value='' 
                 required="required" min="1" max="100" step="1" autofocus="autofocus">
      <label>카테고리 이름</label>
      <input type='text' name='name' id='name' value='' required="required" style='width: 25%;'>
      <label>등록 자료수</label>
      <input type='number' name='cnt' id='cnt' value='' 
                 required="required" min="0" max="10000000" step="1">    
  
      <button type="submit" id='submit'>저장</button>
      <button type="button" id="btn_update_cancel">취소</button>
      <span id='span_animation'></span>
    </FORM>
  </DIV>

  <%-- 삭제 --%>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; 
          width: 100%; text-align: center; display: none;'>
    <div class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='cateno' id='cateno' value=''>
        
      <label>카테고리 번호</label>: <span id='frm_delete_cateno'></span>  
      <label>카테고리 이름</label>: <span id='frm_delete_name'></span>
      
      <div id='msg_count_by_cateno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        『관련 자료가 존재합니다. 모두 삭제해주세요.』
      </div>
      <br>
      <button type="submit" id='btn_submit' class='btn btn-danger'>삭제</button>
      <button type="button" id='btn_delete_cancel' class='btn btn-info'>취소</button>
      
      <span id='span_animation_delete'></span>
            
    </FORM>
  </DIV>  

  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">카테고리<br> 번호</TH>
      <TH class="th_bs">카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">관련<br> 자료수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="cateVO" items="${list}">
      <c:set var="cateno" value="${cateVO.cateno }" />
      <c:set var="name" value="${cateVO.name }" />
      
      <TR>
        <TD class="td_bs">${cateVO.cateno }</TD>
        <TD class="td_bs">${cateVO.categrpno }</TD> 
        <!-- http://localhost:9091/contents/list_by_cateno.do?cateno=1 -->
        <TD class="td_bs_left"><A href="../contents/list_by_cateno_search_paging.do?cateno=${cateno }&now_page=1">${name }</A></TD>
        <TD class="td_bs">${cateVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">${cateVO.cnt }</TD>
        <TD class="td_bs">
          <A href="../contents/create.do?cateno=${cateno }" title="${name } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
          <A href="javascript: read_update_ajax(${cateno })" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
          <A href="javascript: read_delete_ajax(${cateno })" title="삭제"><i class="fa-solid fa-eraser"></i></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 