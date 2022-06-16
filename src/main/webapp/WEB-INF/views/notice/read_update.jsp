<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
                                        <button type="button" id="" class="btn btn-default" onclick="boardDelete();">삭제</button>
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

