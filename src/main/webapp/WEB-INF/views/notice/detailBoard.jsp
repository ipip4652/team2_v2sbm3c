<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

 <c:set var="noticeno" value="${noticeVO.noticeno }" />
 <c:set var="memberno" value="${noticeVO.memberno }" />
 <c:set var="title" value="${noticeVO.title }" />
 <c:set var="rdate" value="${noticeVO.rdate }" />
 <c:set var="cnt" value="${noticeVO.cnt }" />
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    
    
    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
function boardList() {
    let targetPlace = "./list_by_noticeno_search_paging.do?noticeno=&now_page=&word=";
    location.href = targetPlace;
}

function boardDelete() {

	if(('${sessionScope.memberno}'==${noticeVO.memberno })&&('${sessionScope.memberno}'!=null)){
	    let noticeno = '${noticeVO.noticeno}';
	    let answer = confirm('게시글을 삭제하시겠습니까?');
	    
	    if(answer) {
	        location.href="delete.do?noticeno=" + noticeno;
	    }
	}
	else{
		let answer = alert('본인의 게시글만 삭제할 수 있습니다.');
		}
}

function boardUpdate() {
	if(('${sessionScope.memberno}'==${noticeVO.memberno })&&('${sessionScope.memberno}'!=null)){
	    let noticeno = '${noticeVO.noticeno}';
	    
	    location.href="read_update.do?noticeno=" + noticeno;
		}

	else{
		let answer = alert('본인의 게시글만 수정할 수 있습니다.');
		}
}

$(function(){
  //  $('#btn_recom').on("click", function() { update_recom_ajax(${contentsno}); });
  $('#btn_login').on('click', login_ajax);
  $('#btn_loadDefault').on('click', loadDefault);

  // ---------------------------------------- 댓글 관련 시작 ----------------------------------------
  var frm_reply = $('#frm_reply');
  $('#content', frm_reply).on('click', check_login);  // 댓글 작성시 로그인 여부 확인
  $('#btn_create', frm_reply).on('click', reply_create);  // 댓글 작성시 로그인 여부 확인
  list_by_noticeno_join();
  // ---------------------------------------- 댓글 관련 종료 ----------------------------------------
  
});

 
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
            //  insert 처리 Ajax 호출
            $('#div_login').hide();
            // alert('로그인 성공');
            $('#login_yn').val('YES'); // 로그인 성공 기록
            
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

  // 댓글 작성시 로그인 여부 확인
  function check_login() {
    var frm_reply = $('#frm_reply');
    if ($('#memberno', frm_reply).val().length == 0 ) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      /* $('#div_login').show(); */
      location.href = '/member/login.do';
      return false;  // 실행 종료
    }
  }

  // 댓글 등록
  function reply_create() {
/*       var f = $('#frm_login'); */      
  
    var frm_reply = $('#frm_reply');

    if (check_login() !=false) { // 로그인 한 경우만 처리
      var params = frm_reply.serialize(); // 직렬화: 키=값&키=값&...
      // alert(params);
      // return;

      // 자바스크립트: 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식
      // 오라클: 한글 1자가 3바이트임으로 300자로 제한
      // alert('내용 길이: ' + $('#content', frm_reply).val().length);
      // return;
      
      if ($('#content', frm_reply).val().length > 300) {
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
        $('#modal_panel').modal();           // 다이얼로그 출력
        return;  // 실행 종료
      }

      $.ajax({
        url: "../noticeReply/create.do", // action 대상 주소
        type: "post",          // get, post
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   // 응답 형식: json, xml, html...
        data: params,        // 서버로 전달하는 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          // alert(rdata);
          var msg = ""; // 메시지 출력
          var tag = ""; // 글목록 생성 태그
          
          if (rdata.cnt > 0) {
            $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
            msg = "댓글을 등록했습니다.";
            $('#content', frm_reply).val('');
            $('#passwd', frm_reply).val('');

            list_by_noticeno_join(); // 댓글 목록을 새로 읽어옴
            
            $('#reply_list').html(''); // 댓글 목록 패널 초기화, val(''): 안됨
            $("#reply_list").attr("data-replypage", 1);  // 댓글이 새로 등록됨으로 1로 초기화
            
            // list_by_noticeno_join_add(); // 페이징 댓글, 페이징 문제 있음.
            // alert('댓글 목록 읽기 시작');
            // global_rdata = new Array(); // 댓글을 새로 등록했음으로 배열 초기화
            // global_rdata_cnt = 0; // 목록 출력 글수
            
            // list_by_noticeno_join(); // 페이징 댓글
          } else {
            $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
            msg = "댓글 등록에 실패했습니다.";
          }
          
          $('#modal_title').html('댓글 등록'); // 제목 
          $('#modal_content').html(msg);     // 내용
          $('#modal_panel').modal();           // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      });
    }
  }

  // noticeno 별 소속된 댓글 목록
  function list_by_noticeno_join() {
    var params = 'noticeno=' + ${noticeVO.noticeno };

    $.ajax({
      url: "../noticeReply/list_by_noticeno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#reply_list').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          console.log(row);
          msg += "<DIV id='"+row.commentno+"' style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "  " + row.rdate;
          
          if (($('#memberno', frm_reply).val().length != 0) && ('${sessionScope.memberno}' == row.memberno || '${sessionScope.grade}' < 10)) { // 글쓴이 일치여부 확인, 본인의 글만 삭제 가능함 ★
            msg += " <A href='javascript:reply_delete("+row.commentno+")'><IMG src='/notice/images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.content;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#reply_list').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
      
    });
  }
  
    // 댓글 삭제 레이어 출력
    function reply_delete(commentno) {
       //alert('commentnossss: ' + commentno);
      var frm_reply_delete = $('#frm_reply_delete');
      $('#commentno', frm_reply_delete).val(commentno); // 삭제할 댓글 번호 저장
      $('#modal_panel_delete').modal();             // 삭제폼 다이얼로그 출력
      
      reply_delete_proc(commentno);
    }

    // 댓글 삭제 처리
    function reply_delete_proc(commentno) {
      var params = $('#frm_reply_delete').serialize();
    //  alert(params);
      $.ajax({
        url: "../noticeReply/delete.do", // action 대상 주소
        type: "post",           // get, post
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   // 응답 형식: json, xml, html...
        data: params,        // 서버로 전달하는 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          // alert(rdata);
              $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
              $('#' + commentno).remove(); // 태그 삭제
              return; // 함수 실행 종료
            
           // $('#modal_panel_delete_msg').html(msg);

            // $('#passwd', '#frm_reply_delete').focus();  // frm_reply_delete 폼의 passwd 태그로 focus 설정
            
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      });
  }

</script>

 <style>

 
 </style>
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='title_line'>공지사항</DIV>
<!-- Modal 알림창 시작 -->
<div class="modal fade" id="modal_panel" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
      </div>
      <div class="modal-body">
        <p id='modal_content'></p>  <!-- 내용 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> <!-- Modal 알림창 종료 -->
   
<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <c:if test="${sessionScope.grade < 10 }">
        <span class='menu_divide' >│</span>
        <A href="./create.do?noticeno=${noticeVO.noticeno }">등록</A>
    </c:if>  
  </ASIDE> 
  <DIV class='menu_line'></DIV>
<div class="wrapper">
    <div class="form-group">
    <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%">${noticeVO.title }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성일
                                </td>
                                <td>
                                ${noticeVO.rdate }
                                </td>
                            </tr>
                            <tr>
                                <td>글쓴이
                                </td>
                                <td>
                                ${memberVO.id } <span style='float:right'>조회 : ${noticeVO.cnt }</span>
                                </td>
                            </tr>
                             <tr>
                                <td colspan="2">
                                    <p>${noticeVO.content }</p>
                       
                                </td>
                            </tr>
                            </tbody>
                            </table>
   </div>
   <table style="float: right; width:33%;">     
        <tr >
        <th class="btn" colspan="2">
            <input type="button" value="글목록" onclick="boardList();">
            <c:if test="${sessionScope.grade < 10 }">
            <!-- 글삭제와 수정은 로그인한 사람과 해당글을 쓴 사람과 같아야 할 수 있다. -->
            <input type="button" value="글수정" onclick="boardUpdate();" >
            <input type="button" value="글삭제" onclick="boardDelete();" >
            </c:if>
            </th>
        </tr>
    </table>    
  </div>
  </DIV>
<br>
  <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
  <DIV id='div_login' style='display:none; float:left;'>
    <div style='width: 70%; margin: 0px 0px 0px 30%; '>
        <FORM name='frm_login' id='frm_login' method='POST' action='/member/login_ajax.do' class="form-horizontal">
          <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
          <input type="hidden" name="contentsno" id="contentsno" value="contentsno">
    
          <div class="form-group">
            <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
            <div class="col-md-8">
              <input type='text' class="form-control" name='id' id='id' 
                         value='${ck_id }' required="required" 
                         style='width: 100%;' placeholder="아이디" autofocus="autofocus">
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
                        value='${ck_passwd }' required="required" style='width: 100%;' placeholder="패스워드">
              <Label>
                <input type='checkbox' name='passwd_save' value='Y' 
                          ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
              </Label>
            </div>
          </div>   
        </FORM>
    </div>
 
      <div style='text-align: center; margin: 10px auto;'>
        <button type="button" id='btn_login' class="btn btn-primary btn-md">로그인</button>
        <button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-md">회원가입</button>
        <button type='button' id='btn_loadDefault' class="btn btn-primary btn-md">테스트 계정</button>
        <button type='button' id='btn_cancel' class="btn btn-primary btn-md"
                    onclick="$('#div_login').hide();">취소</button>
      </div>
    </div>   

  </DIV>
  <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>
  <!-- ------------------------------ 댓글 영역 시작 ------------------------------ -->
<DIV style='width: 70%; margin: 0px auto; float:left;'>
    <HR>
    <FORM name='frm_reply' id='frm_reply' style='padding-left: 100px;'> <%-- 댓글 등록 폼 --%>
        <input type='hidden' name='noticeno' id='noticeno' value='${noticeno}'>
        <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
        
        <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
        <button type='button' id='btn_create'>등록</button>
    </FORM>
    <HR>
     <DIV id='reply_list' data-replyPage='1'>  댓글 목록
    
   </DIV>
<%--    <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
        <button id='btn_add' style='width: 100%;'>더보기 ▽</button>
    </DIV>   
   --%>

<!-- ------------------------------ 댓글 영역 종료 ------------------------------  -->
<!-- -------------------- 댓글 삭제폼 시작 -------------------- -->
<div class="modal fade" id="modal_panel_delete" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
      </div>
      <div class="modal-body">
        <form name='frm_reply_delete' id='frm_reply_delete'>
          <input type='hidden' name='commentno' id='commentno' value=''>
          <input type='hidden' name='noticeno' id='noticeno' value='${noticeno }'>
          
<!--           <label>패스워드</label>
          <input type='password' name='passwd' id='passwd' class='form-control'>
          <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'></DIV>
  -->       </form>
      </div>
      <div class="modal-footer">
        <button type='button' class='btn btn-danger' 
                     onclick="reply_delete_proc(frm_reply_delete.commentno.value);">삭제</button>

        <button type="button" class="btn btn-default" data-dismiss="modal" 
                     id='btn_frm_reply_delete_close'>Close</button>
      </div>
    </div>
  </div>
</div>
<!-- -------------------- 댓글 삭제폼 종료 -------------------------------------------->

</DIV>  
<jsp:include page="../menu/bottom.jsp" flush='false' />
 
</body>
</html>

