<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from users where id = ? and pw = ? ";

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
		session.setAttribute("username", rset.getString("username"));
		response.sendRedirect("../main.jsp");
	}else{
		response.sendRedirect("../main.jsp");
	}
} catch(Exception e){ e.printStackTrace(); 
} finally {
	if(rset==null){try{rset.close();}catch(Exception e){ } }
	if(psmt==null){try{psmt.close();}catch(Exception e){ } }
	if(conn==null){try{conn.close();}catch(Exception e){ } }
}
%>