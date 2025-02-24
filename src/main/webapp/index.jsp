<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
if(id!=null){
	response.sendRedirect("main.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>싸게팜요</title>
<style type="text/css">
	.container{
		align-items: left;
	}
	.signin, .signup{
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
	<div class="container">
		<div><a href="signIn.jsp" class="signin">로그인</a></div>
		<div><a href="signUp.jsp" class="signup">회원가입</a></div>
	</div>
</body>
</html>	