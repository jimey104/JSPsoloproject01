<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
if(id==null){
	response.sendRedirect("index.jsp");
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
        background-color: #f5f5f5;
    }
    h2 {
        margin-bottom: 20px;
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
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .item img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 10px;
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
    .edit { background: #4CAF50; }
    .delete { background: #F44336; }
    .write, .signout{
        display: block;
        margin: 20px auto;
        padding: 10px 15px;
        background: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        width: 100px;
    }
</style>
</head>
<body>
<a href="signOut.jsp" class="signout">로그아웃</a>
<h2>서울특별시 중고거래</h2>
<a href="creForm.jsp" class="write">글쓰기</a>
<div class="container">
<%
try(Connection conn = DriverManager.getConnection(url, "root", "1234");
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery(sql);){
    while(rset.next()){
%>
    <div class="item">
        <img alt="이미지" src="<%=rset.getString("alt") %>">
        <div class="title"><%=rset.getString("title") %></div>
        <div class="location"><%=rset.getString("loc") %></div>
        <div class="price"><%=rset.getString("price") %>원</div>
        <div class="buttons">
            <a href="updFrom.jsp?sno=<%=rset.getString("sno")%>" class="edit">수정</a>
            <a href="delPost.jsp?sno=<%=rset.getString("sno")%>" class="delete">삭제</a>
        </div>
    </div>
<%}} catch(Exception e){ e.printStackTrace(); } %>
</div>
</body>
</html>
