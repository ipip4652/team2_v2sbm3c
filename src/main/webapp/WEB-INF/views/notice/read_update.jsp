<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%-- <!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>카테고리 그룹 > ${categrpVO.name } 조회(수정)</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='categrpno' id='categrpno' value='${categrpVO.categrpno }'>
        
      <label>그룹 이름</label>
      <input type='text' name='name' value="${categrpVO.name }" required="required" 
                 autofocus="autofocus" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='seqno' value="${categrpVO.seqno }" required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' ${categrpVO.visible == 'Y' ? "selected='selected'":"" }>Y</option>
        <option value='N' ${categrpVO.visible == 'N' ? "selected='selected'":""}>N</option>
      </select>
       
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
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
      <TH class="th_bs">대분류명</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="categrpVO" items="${list}">
      <c:set var="categrpno" value="${categrpVO.categrpno }" />
      <c:set var="visible" value="${categrpVO.visible }" />
      
      <TR>
        <TD class="td_bs">${categrpVO.seqno }</TD>
        <TD class="td_bs_left">${categrpVO.name }</TD>
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
          <A href="./read_update.do?categrpno=${categrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?categrpno=${categrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_seqno_up.do?categrpno=${categrpno }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?categrpno=${categrpno }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>         
         </TD>   
  
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
 

</body>
 
</html>
 --%>
<c:set var="title" value="${noticeVO.title }" />
<c:set var="content" value="${categrpVO.content }" />

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        
        <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
        <title>공지사항 게시판 수정</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
       
    <script type="text/javascript">
 	        function boardDelete() {
	            let noticeno = '${noticeVO.noticeno}';
	            let answer = confirm('게시글을 삭제하시겠습니까?');
	            
	            if(answer) {
	                location.href="./delete.do?noticeno=" + noticeno;
	            }
	         }
	             
	           function formCheck() {
	                let title = document.getElementById("title");
	                let content  = document.getElementById("content");
	                
	                if(title.value.trim().length == 0 || content.value.trim().length == 0) {
	                    alert('제목과 글 내용을 입력해 주세요');
	                    return false;
	                }
	                return true;
	            }
     </script>
    </head>
    <body>
      <jsp:include page="../menu/top.jsp" />
        <div class="container">
            <hr/>

            <div class="row">
                <div class="col-md-10">
              <form action="./update.do" method="POST" enctype="multipart/form-data">
              <input type="hidden" id='noticeno' name="noticeno" value="${noticeVO.noticeno}">
              <input type="hidden" id='memberno' name="memberno" value="${noticeVO.memberno}">
                    <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="title" name="title" class="form-control col-lg-2" data-rule-required="true" value="${noticeVO.title }" maxlength="50">
                                        </div>
                                    </p>
                                        <textarea id="content" name="content" class="form-control col-lg-12" style="width:100%" rows="15">${noticeVO.content }</textarea>
                                </span>
                            </td>
                        </tr>
<%--                         </c:forEach> --%>
                        </tbody>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <input type="button" id="list" value="목록" class="btn btn-default" onclick="location.href='./list.do'" />
                                        <button type="submit" id="submit" class="btn btn-default" onclick="return formCheck();">수정</button>
                                        <button type="button" id="boardDelete" class="btn btn-default" onclick="boardDelete();">삭제</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
             </form>
</div>
            </div>
            <hr/>
        </div>   
        <jsp:include page="../menu/bottom.jsp" /> 
    </body>
</html>

