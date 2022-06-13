<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>cosmetic</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static/css/style.css -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>공지사항</DIV>
 
<DIV class='content_body' >
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <input type="hidden" id='memberno' name="memberno" value="${param.memberno}">
    <div class="form-group">
       <label class="control-label col-md-4">제목</label>
       <div class="col-md-8">
         <input type='text' id="title" name='title' value='' required="required" placeholder="제목 입력"
                    autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
        <div class="form-group">
       <label class="control-label col-md-4">내용</label>
       <div class="col-md-8">
       <textarea id="content" name="content" required="required" class="form-control" placeholder="내용 입력"
          autofocus="autofocus" rows="10" cols="88"></textarea>
       </div>
    </div>
  
  
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
 