<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관심 향 등록</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css"> <%--static 기준 --%>
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    

    <script type="text/javascript">
      $(function() { // 자동 실행
        $('#btn_forward').on('click', function() { location.href='/tensorflow/recommend_perfume/form1.do';});
        $('#btn_close').on('click', function() {location.href='/index.do';});     // 메인페이지(index.do)로 이동
      });
    </script>
</head>
<body>
<DIV class="container">
    <H1 style="text-align: center;">관심 향수 등록</H1>

    <DIV style="text-align:center; margin: 50px auto;">
        관심 향을 등록하시면 최적의 향수 추천 서비스를 이용하실수 있습니다.<br><br>
        등록은 관심이 가는 사진들을 선택하며 몇 번의 클릭만으로 바로 종료됩니다.
    </DIV>

    <DIV style="text-align:center; margin: 50px auto;">
        <button type='button' id='btn_forward'>관심 향수 등록하기</button>
        <button type='button' id='btn_close'>취소</button>
    </DIV>
    <DIV style="text-align:center; margin: 50px auto;">
    <img src="/recommend_perfume/images/intro.jpg" style='float:center; height: 200px'>
    </DIV>

</DIV>
</body>
</html>