<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String nickname = request.getParameter("nickname");
String address = request.getParameter("address");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "insert into user(id, pw, address, nickname) values (?,?,?,?)";

Connection conn = null;
PreparedStatement psmt = null;


try{
	conn = DriverManager.getConnection(url, "root", "1234");
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pw);
	psmt.setString(3, nickname);
	psmt.setString(4, address);
	
	psmt.executeUpdate();
	response.sendRedirect("main.jsp");
}catch( Exception e){ e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>