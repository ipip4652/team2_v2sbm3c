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
        $(function() {
            send(); //Django ajax 호출
            $('#btn_previous').on('click', function() { history.back(); });   // 이전
            $('#btn_close').on('click', function() { window.open('/index.do') });      // 메인페이지(index.do)로 이동
        });


        function send() {
            var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
            // alert('params: ' + params);  // 수신 데이터 확인
            $.ajax({
              url: 'http://localhost:8000/recommend_perfume/end_ajax/',  // Spring Boot -> Django 호출
              type: 'get',  // get or post
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params,      // 데이터
              success: function(rdata) { // 응답이 온경우
                // alert(rdata.index);
                if (rdata.index == 0) {        // 과일 향 향수 추천 필요
                    $('#fruit').css('display','');
                } else if(rdata.index == 1) { // 꽃 향 향수 추천 필요
                    $('#flower').css('display','');
                } else if(rdata.index == 2) { // 머스크 향 향수 추천 필요
                    $('#musk').css('display','');
                } else if(rdata.index == 3) { // 바닐라 향 향수 추천 필요
                    $('#vanilla').css('display','');
                } else if(rdata.index == 4) { // 스파이시 향 향수 추천 필요
                    $('#spicy').css('display','');
                }else { // 우디 향 향수 추천 필요
                    $('#woody').css('display','');
                } 

                $('#panel').html("");  // animation gif 삭제
                $('#panel').css('display', 'none'); // 숨겨진 태그의 출력

                // --------------------------------------------------
                // 분류 정보에 따른 상품 이미지 SELECT
                //  --------------------------------------------------
              },
              // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
              error: function(request, status, error) { // callback 함수
                console.log(error);
              }
            });

            // $('#panel').html('처리중입니다....');  // 텍스트를 출력하는 경우
            $('#panel').html("<img src='/images/ani04.gif' style='width: 10%;'>");
            $('#panel').show(); // 숨겨진 태그의 출력
          }
    </script>
    <style>
        *{
            text-align: center;
        }
        .td_image{
            vertical-align: middle;
            padding: 5px;
            cursor: pointer;
        }
    </style>

</head>
<body>
<DIV style='display: none;'>
    <form name='frm' id='frm'>
        <input type='hidden' name='step1' value='${param.step1 }'>
        <input type='hidden' name='step2' value='${param.step2 }'>
        <input type='hidden' name='step3' value='${param.step3 }'>
        <input type='hidden' name='step4' value='${param.step4 }'>
        <input type='hidden' name='step5' value='${param.step5 }'>
        <input type='hidden' name='step6' value='${param.step6 }'>
    </form>
</DIV>

<DIV class="container">
    <H2> </H2>
    <H2>참여해주셔서 감사합니다.</H2>
    <DIV id='panel' style='margin: 30px auto; width: 90%;'></DIV>
    
    <DIV id='panel_img' style='margin: 0px auto; width: 90%;'>
        <DIV id='fruit' style='display: none;'>
            <H3>추천 향: 과일 향</H3>
            <img id='img1' src="/recommend_perfume/images/fruit_thumb.jpg" style='float:center; height: 400px'> <br>
            <br> <h4>원하는 성별을 선택해주세요!</h4> <br>
            <table style='width:60%; margin-left:20%; margin-right:20%;'>
                <tr>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=16&now_page=1" title="해당 페이지로 이동">
                        <img id='img1' src="/recommend_perfume/images/man.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=17&now_page=1" title="해당 페이지로 이동">
                        <img id='img2' src="/recommend_perfume/images/woman.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=18&now_page=1" title="해당 페이지로 이동">
                        <img id='img3' src="/recommend_perfume/images/couple.png" style='height: 150px'></a>
                    </td>
                </tr>
            </table>
        </DIV>
        <DIV id='flower' style='display: none;'>
            <H3>추천 향: 꽃 향</H3>
            <img id='img1' src="/recommend_perfume/images/flower_thumb.jpg" style='float:center; height: 400px'> <br>
            <br> <h4>원하는 성별을 선택해주세요!</h4> <br>
            <table style='width:60%; margin-left:20%; margin-right:20%;'>
                <tr>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=13&now_page=1" title="해당 페이지로 이동">
                        <img id='img1' src="/recommend_perfume/images/man.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=14&now_page=1" title="해당 페이지로 이동">
                        <img id='img2' src="/recommend_perfume/images/woman.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=15&now_page=1" title="해당 페이지로 이동">
                        <img id='img3' src="/recommend_perfume/images/couple.png" style='height: 150px'></a>
                    </td>
                </tr>
            </table>
        </DIV>
        <DIV id='musk' style='display: none;'>
            <H3>추천 향: 머스크 향</H3>
            <img id='img1' src="/recommend_perfume/images/musk_thumb.jpg" style='float:center; height: 400px'> <br>
            <br> <h4>원하는 성별을 선택해주세요!</h4> <br>
            <table style='width:60%; margin-left:20%; margin-right:20%;'>
                <tr>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=10&now_page=1" title="해당 페이지로 이동">
                        <img id='img1' src="/recommend_perfume/images/man.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=11&now_page=1" title="해당 페이지로 이동">
                        <img id='img2' src="/recommend_perfume/images/woman.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=12&now_page=1" title="해당 페이지로 이동">
                        <img id='img3' src="/recommend_perfume/images/couple.png" style='height: 150px'></a>
                    </td>
                </tr>
            </table>
        </DIV>
        <DIV id='vanilla' style='display: none;'>
            <H3>추천 향: 바닐라 향</H3>
            <img id='img1' src="/recommend_perfume/images/vanilla_thumb.jpg" style='float:center; height: 400px'> <br>
            <br> <h4>원하는 성별을 선택해주세요!</h4> <br>
            <table style='width:60%; margin-left:20%; margin-right:20%;'>
                <tr>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="/contents/list_by_cateno_search_paging.do?cateno=7&now_page=1" title="해당 페이지로 이동">
                        <img id='img1' src="/recommend_perfume/images/man.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="/contents/list_by_cateno_search_paging.do?cateno=8&now_page=1" title="해당 페이지로 이동">
                        <img id='img2' src="/recommend_perfume/images/woman.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="/contents/list_by_cateno_search_paging.do?cateno=9&now_page=1" title="해당 페이지로 이동">
                        <img id='img3' src="/recommend_perfume/images/couple.png" style='height: 150px'></a>
                    </td>
                </tr>
            </table>
        </DIV>
        <DIV id='spicy' style='display: none;'>
            <H3>추천 향: 스파이시 향</H3>
            <img id='img1' src="/recommend_perfume/images/spicy_thumb.jpg" style='float:center; height: 400px'> <br>
            <br> <h4>원하는 성별을 선택해주세요!</h4> <br>
            <table style='width:60%; margin-left:20%; margin-right:20%;'>
                <tr>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=4&now_page=1" title="해당 페이지로 이동">
                        <img id='img1' src="/recommend_perfume/images/man.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=5&now_page=1" title="해당 페이지로 이동">
                        <img id='img2' src="/recommend_perfume/images/woman.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=6&now_page=1" title="해당 페이지로 이동">
                        <img id='img3' src="/recommend_perfume/images/couple.png" style='height: 150px'></a>
                    </td>
                </tr>
            </table>
        </DIV>
        <DIV id='woody' style='display: none;'>
            <H3>추천 향: 우디 향</H3>
            <img id='img1' src="/recommend_perfume/images/wood_thumb.jpg" style='float:center; height: 450px'> <br>
            <br> <h4>원하는 성별을 선택해주세요!</h4> <br>
            <<table style='width:60%; margin-left:20%; margin-right:20%;'>
                <tr>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=1&now_page=1" title="해당 페이지로 이동">
                        <img id='img1' src="/recommend_perfume/images/man.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=2&now_page=1" title="해당 페이지로 이동">
                        <img id='img2' src="/recommend_perfume/images/woman.png" style='height: 150px'></a>
                    </td>
                    <td style='width:30px'>  </td>
                    <td style='box-shadow: 5px 5px 5px #000; '>
                    <a href="../contents/list_by_cateno_search_paging.do?cateno=3&now_page=1" title="해당 페이지로 이동">
                        <img id='img3' src="/recommend_perfume/images/couple.png" style='height: 150px'></a>
                    </td>
                </tr>
            </table>
        </DIV>
    </DIV>

    <form id='frm' name='frm' action='' method='GET'>
        <br>
        <DIV style="text-align:center; margin: 5px auto;">
            <button type='button' id='btn_previous' class="btn btn-primary">이전</button>
            <button type='button' id='btn_close' class="btn btn-primary">종료</button>
        </DIV>
    </form>
</DIV>
</body>
</html>