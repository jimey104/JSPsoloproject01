<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sno = request.getParameter("sno");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "delete from market where sno ="+ sno;

try(Connection conn = DriverManager.getConnection(url, "root","1234");
		Statement  stmt = conn.createStatement(); ){
	stmt.executeUpdate(sql);
}catch(Exception e){ e.printStackTrace(); }

response.sendRedirect("main.jsp");
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