<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from user where id = ? and pw = ? ";

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rset = null;
try{
	conn = DriverManager.getConnection(url, "root", "1234");
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pw);
	
	rset = psmt.executeQuery();
	if(rset.next()){
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	}else{
		response.sendRedirect("main.jsp");
	}
}catch(Exception e){ e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>