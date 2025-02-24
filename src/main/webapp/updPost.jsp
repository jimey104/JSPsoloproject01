<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sno = request.getParameter("sno");
String alt = request.getParameter("alt");
String title = request.getParameter("title");
String loc = request.getParameter("loc");
String price = request.getParameter("price");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "update market set alt = ?, title = ?, loc = ?, price = ? where sno = ?";


Connection conn = null;
PreparedStatement psmt = null;


try{
	conn = DriverManager.getConnection(url, "root", "1234");
	psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, alt);
	psmt.setString(2, title);
	psmt.setString(3, loc);
	psmt.setString(4, price);
	psmt.setString(5, sno);
	
	psmt.executeUpdate();
	
	response.sendRedirect("main.jsp");
	
}catch(Exception e){ e.printStackTrace(); 
}finally{
	if(psmt!=null)try { psmt.close(); } catch(Exception e) {}
	if(conn!=null)try { conn.close(); } catch(Exception e) {}
}
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