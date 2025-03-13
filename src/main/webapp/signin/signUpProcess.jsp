<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String username = request.getParameter("username");
String address = request.getParameter("address");
String name = request.getParameter("name");
String email = request.getParameter("email");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "insert into users (id, pw, username, address, name, email) values (?,?,?,?,?,?)";

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rset = null;

try{
	conn = DriverManager.getConnection(url, "root", "1234");
	psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, id);
	psmt.setString(2, pw);
	psmt.setString(3, username);
	psmt.setString(4, address);
	psmt.setString(5, name);
	psmt.setString(6, email);
	
	psmt.executeUpdate();
	
	response.sendRedirect("./signIn.jsp");
	
} catch( Exception e){ 
	e.printStackTrace(); 
	out.println("<script>alert('오류.'); history.back();</script>");
} finally {
	
	if(rset==null){try{rset.close();}catch(Exception e){ } }
	if(psmt==null){try{psmt.close();}catch(Exception e){ } }
	if(conn==null){try{conn.close();}catch(Exception e){ } }
}
%>