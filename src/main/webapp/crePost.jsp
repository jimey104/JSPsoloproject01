<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sno = request.getParameter("sno");
String alt = request.getParameter("alt");
String title = request.getParameter("title");
String loc = request.getParameter("loc");
String price = request.getParameter("price");

String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "insert into market(sno, alt, title, loc, price) values (?,?,?,?,?)";

Connection conn = null;
PreparedStatement psmt = null;


try{     


	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, "root", "1234");
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, sno);
	psmt.setString(2, alt);
	psmt.setString(3, title);
	psmt.setString(4, loc);
	psmt.setString(5, price);
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