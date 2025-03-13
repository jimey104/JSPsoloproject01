<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = (String) session.getAttribute("id");
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹사이트이름</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/ie.js"></script>
</head>

<body>

    <header>
        <div class="inner">
            <h1><a href="#">웹사이트이름</a></h1> 	
            
            <div class="search">
			  <input type="text" placeholder="검색어 입력">
			  <img src="images/search.png">
			</div>


            <ul class="util">
                <li><a href="./contact.jsp">Contact</a></li>
                <li><a href="./main.jsp">Main</a></li>            
<% 				
				if((String)session.getAttribute("id") != null) { 				
%>
					<li><a href="signin/signUp.jsp">회원정보수정</a></li>   
                  	<li><a href="signin/signOut.jsp"><%=session.getAttribute("username") %>님 Logout</a></li>   
<%				      	
				} else{ 
%>				
                   <li><a href="signin/signIn.jsp">Login</a></li>  
<%				
				} 															 
%>    
                <li><a href="signin/signUp.jsp">Join</a></li>
                
            </ul>
        </div>
    </header>


    <figure>
        <img src="images/main_img.jpg"/>
        <div class="inner">
            <h1>웹사이트</h1>
            <p>안쓰는 물건 집안에 굴러다니게만 하지마세요!! <br>
                &nbsp;쓸모없을 줄 알았던 물건이 남들에겐 가치있을겁니다!</p>
            <a id="goMain">거래하러 가기</a>
            <script>
			    document.getElementById("goMain").addEventListener("click", function(event) {
			        var userId = "<%= id %>";
			        if (!userId || userId === "null") {
			            event.preventDefault(); // 기본 이동 동작 막기
			            alert("로그인이 필요합니다!");
			            window.location.href = "signin/signIn.jsp";
			        } else {
			            window.location.href = "main.jsp";
			        }
			    });
			</script>
        </div>
    </figure>

    <section>
        <div class="inner">
            <h1>이용하시기 전!</h1>
            <div class="wrap">
                <article>
                    <div class="pic">
                        <img src="images/info1.jpg" alt="1번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">상품 직거래 가능 위치를 검색</a></h2>
                    <p>지역을 검색해서 원하는 곳에서 거래해 봐요!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="images/info2.jpg" alt="2번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">카테고리 설정으로 간편한 검색!</a></h2>
                    <p>원하시는 카테고리를 설정해 빠른 검색!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="images/info3.jpg" alt="3번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="#">● 게시물 댓글을 통한 간편한 소통</a></h2>
                    <p>사고 싶은 상품을 판매자와 직접 흥정하세요!</p>
                </article>


            </div>
        </div>
    </section>

    <footer>
        <div class="inner">
            <div class="upper">
                <h1>웹사이트</h1>
                <ul>
                    <li><a href="#">Policy</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Family Site</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    TEL : 02-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2025 SOLOPROJECT &copy; copyright all right reserved.
                </p>
            </div>
        </div>
    </footer>




</body>

</html>