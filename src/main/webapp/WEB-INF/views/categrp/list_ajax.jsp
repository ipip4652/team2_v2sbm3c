<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.categrp.CategrpVO" %>
 
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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>

<script type="text/javascript">
    $(function() {
        $('#btn_create_cancel').on('click', cancel);    
        $('#btn_update_cancel').on('click', cancel);
        $('#btn_delete_cancel').on('click', cancel);
    });
    
    function read_update_ajax(categrpno) { // 수정
        // console.log('update');
        $('#panel_create').css('display', 'none'); // 태그 감추기
        $('#panel_update').css('display', '');  // 태그 출력 

        // console.log('-> categrpno:' + categrpno);
        let params = "";
        // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
        params = 'categrpno=' + categrpno; // 공백이 값으로 있으면 안됨.

        $.ajax(
          {
            url: '/categrp/read_ajax.do',
            type: 'get',  // get, post
            cache: false, // 응답 결과 임시 저장 취소
            async: true,  // true: 비동기 통신
            dataType: 'json', // 응답 형식: json, html, xml...
            data: params,      // 데이터
            success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
              // {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
              let categrpno = rdata.categrpno;
              let name = rdata.name;
              let seqno = rdata.seqno;
              let visible = rdata.visible;
              let rdate = rdata.rdate;

              let frm_update = $('#frm_update'); // id가 frm_update인 태그
              $('#categrpno', frm_update).val(categrpno); // frm_update 폼에서 id가 categrpno인 태그
              $('#name', frm_update).val(name);
              $('#seqno', frm_update).val(seqno);
              $('#visible', frm_update).val(visible);
              $('#rdate', frm_update).val(rdate);
              
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
    function read_delete_ajax(categrpno) {
      $('#msg_count_by_categrpno').hide();
      $('#btn_submit').show();  // 삭제 버튼 출력
        
      $('#panel_create').css("display","none");  // 태그를 숨김
      $('#panel_update').css("display","none"); // 태그를 숨김  
      $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
      // return;
      
      // console.log('-> categrpno:' + categrpno);
      let params = "";
      // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      params = 'categrpno=' + categrpno; // 공백이 값으로 있으면 안됨.
      
      $.ajax(
        {
          url: '/categrp/read_ajax2.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
            // {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
            let categrpno = rdata.categrpno;
            let name = rdata.name;
            let seqno = rdata.seqno;
            let visible = rdata.visible;
            // var rdate = rdata.rdate;
            let count_by_categrpno = parseInt(rdata.count_by_categrpno); // 카테고리 그룹에 속한 카테고리수
            console.log('count_by_categrpno: ' + count_by_categrpno);

            let frm_delete = $('#frm_delete');
            $('#categrpno', frm_delete).val(categrpno);
            
            $('#frm_delete_name').html(name);  // <label>그룹 이름</label><span id='frm_delete_name'></span>  
            $('#frm_delete_seqno').html(seqno);
            $('#frm_delete_visible').html(visible);
            
            if (count_by_categrpno > 0) {  // 자식 레코드가 있다면
                $('#msg_count_by_categrpno').show();
                $('#btn_submit').hide();  // 삭제 버튼 숨기기
            } else {
                $('#msg_count_by_categrpno').hide();
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
      $('#span_animation_delete').html("<img src='/categrp/images/ani03.gif' style='width: 3%;'>");
      $('#span_animation_delete').show(); // 숨겨진 태그의 출력
    }
        
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>카테고리 그룹</DIV>

<DIV class='content_body'>
  <%-- 신규 등록 --%>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                                              text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>그룹 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit' class='btn'>등록</button>
      <button type="button" id='btn_create_cancel' class='btn'>취소</button>
    </FORM>
  </DIV>
  
  <!-- 수정 -->
  <DIV id='panel_update' 
          style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                    text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='categrpno' id='categrpno' value=''>

      <label>그룹 이름</label>
      <input type='text' name='name' id='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <label>순서</label>
      <input type='number' name='seqno' id='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible' id='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit' class='btn'>저장</button>
      <button type="button" id='btn_update_cancel' class='btn'>취소</button>
      
      <span id='span_animation'></span>
      
    </FORM>
  </DIV>
  
  <%-- 삭제 --%>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; 
          width: 100%; text-align: center; display: none;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='categrpno' id='categrpno' value=''>
        
      <label>그룹 이름</label>: <span id='frm_delete_name'></span>  
      <label>순서</label>: <span id='frm_delete_seqno'></span>
      <label>출력 형식</label>: <span id='frm_delete_visible'></span>
      
      <div id='msg_count_by_categrpno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        『관련 카테고리가 존재합니다. 모두 삭제해주세요.』
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
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    // Scriptlet
    // List<CategrpVO> list = (List<CategrpVO>)(request.getAttribute("list"));
    // for (CategrpVO categrpVO: list) {
    //    out.println(categrpVO.getName() + "<br>");
    // }
    %>
    <c:forEach var="categrpVO" items="${list}">
      <c:set var="categrpno" value="${categrpVO.categrpno }" />
      <c:set var="name" value="${categrpVO.name }" />
      <c:set var="visible" value="${categrpVO.visible }" />
      
      <TR>
        <TD class="td_bs">${categrpVO.seqno }</TD>
        <TD class="td_bs_left"><A href="../cate/list_by_categrpno.do?categrpno=${categrpno }">${name }</A></TD>
        <TD class="td_bs">${categrpVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${visible == 'Y'}">  <!-- /categrp/images/open.png: /static/categrp/images/open.png -->
              <A href="./update_visible.do?categrpno=${categrpno }&visible=${visible }"><IMG src="/categrp/images/open.png" style='width: 18px;'></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?categrpno=${categrpno }&visible=${visible }"><IMG src="/categrp/images/close.png" style='width: 18px;'></A>
            </c:otherwise>
          </c:choose>
        </TD>   
        
        <TD class="td_bs">
          <A href="../cate/create.do?categrpno=${categrpno }" title="${name } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
          <A href="javascript: read_update_ajax(${categrpno })" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
          <A href="javascript: read_delete_ajax(${categrpno })" title="삭제"><i class="fa-solid fa-eraser"></i></A>
          <A href="./update_seqno_up.do?categrpno=${categrpno }" title="우선순위 상향"><i class="fa-solid fa-angle-up"></i></A>
          <A href="./update_seqno_down.do?categrpno=${categrpno }" title="우선순위 하향"><i class="fa-solid fa-angle-down"></i></A>         
          ${categrpno }
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


