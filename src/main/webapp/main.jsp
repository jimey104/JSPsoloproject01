<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
if(id==null){
	out.print("<script>alert('로그인이 필요합니다.'); location.href='signin/signIn.jsp';</script>");
}

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from market";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>싸게팜요</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        padding: 0;
        text-align: center;
        align-items: right;
        background-color: #f5f5f5;
    }
    .slider {
    width: 100%;    
    height: 120px;                             
    overflow: hidden;
    position: relative;
   
	}
	.slider .slide {
		float: center;	
	    width: 100%;
	    position: relative;
	}
	.slider .slide img {
	    width: 85%;
	    height: auto;                                                        
	}
    h2 ,h1{
     	color: #B6A083;
        margin-bottom: 20px;
        text-align: left;
    }
    
    .container {
    	
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        max-width: 1200px;
        margin: auto;
    }
    .item {
        background: white;
        padding: 10px;
        border-radius: 3px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .item img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 3px;
    }
    .title, .location, .price {
        margin-top: 10px;
        font-size: 14px;
    }
    .buttons a {
        display: inline-block;
        margin-top: 10px;
        padding: 5px 10px;
        text-decoration: none;
        color: white;
        border-radius: 5px;
    }
    .edit { background: #A79277; }
    .delete { background: #D1BB9E; }
    .write, .signout{
        display: block;
        margin: 20px auto;
        padding: 10px 15px;
        background: #A79277;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        width: 100px;
    }
    .vanner{
    	 width: 100%;    
	    height: 120px;                             
	    overflow: hidden;
	    position: relative;
    }
    .vanner img {
    	top: 10px;
	    float: center;
	    width: 85%;
	    position: relative;
	}
    
</style>
</head>
<body>
	<div>
		<h1>웹페이지명</h1>
		<a href="signin/signOut.jsp" class="signout">로그아웃</a>
	</div>
	
	<!-- 슬라이드 배너 html   애매한디???-->
	<div class="slider" >
	    <div class="slide" onclick="nextSlide()">
	        <img src="./images/img001.jpg" alt="이미지 1">
	    </div>
	    <div class="slide" onclick="nextSlide()">
	        <img src="./images/img002.jpg" alt="이미지 2">
	    </div>
	    <div class="slide" onclick="nextSlide()">
	        <img src="./images/img003.jpg" alt="이미지 3">
	    </div>
	</div>
	
	<!-- 슬라이디 베너 js --> 
	<script>
	    let currentSlide = 0;
	    const slides = document.querySelectorAll('.slide');
	    const slideCount = slides.length;
	
	    function showSlide(n) {
	        slides.forEach(slide => slide.style.display = 'none');
	        slides[n].style.display = 'block';
	    }
	
	    function nextSlide() {
	        currentSlide = (currentSlide + 1) % slideCount;
	        showSlide(currentSlide);
	    }
	
	    function prevSlide() {
	        currentSlide = (currentSlide - 1 + slideCount) % slideCount;
	        showSlide(currentSlide);
	    }
	
	    document.addEventListener('DOMContentLoaded', () => {
	        showSlide(currentSlide);
	        setInterval(nextSlide, 3000); // 3초마다 자동 슬라이드
	    });
	</script>
	
	<div class="vanner">
		<img src="./images/img001.jpg" alt="이미지 1">
	</div>
	<div>
		<h2 >서울시 중고거래</h2>
		<a href="board/create.jsp" class="write" >글쓰기</a>
	</div>
	<div class="container">
	<%
	try(Connection conn = DriverManager.getConnection(url, "root", "1234");
	        Statement stmt = conn.createStatement();
	        ResultSet rset = stmt.executeQuery(sql);){
	    while(rset.next()){
	%>
	   <div class="item" onclick="location.href='${pageContext.request.contextPath}/view?mId=<%=rset.getString("id")%>';">
	        <img alt="이미지" src=".<%=rset.getString("alt") %>">
	        <div class="title"><%=rset.getString("title") %></div>
	        <div class="location"><%=rset.getString("loc") %></div>
	        <div class="price"><%=rset.getString("price") %>원</div>

	    </div>
	<%}} catch(Exception e){ e.printStackTrace(); } %>
	</div>
</body>
</html>
