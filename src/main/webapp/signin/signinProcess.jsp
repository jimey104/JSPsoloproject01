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
		response.sendRedirect("../index.jsp");
	}else{
		out.println("<script>alert('로그인에 실패했습니다.'); location.href='../index.jsp';</script>");
	}
} catch(Exception e){ 
	e.printStackTrace(); 
	out.println("<script>alert('오류.'); location.href='../index.jsp';</script>");
} finally {
	if(rset==null){try{rset.close();}catch(Exception e){ } }
	if(psmt==null){try{psmt.close();}catch(Exception e){ } }
	if(conn==null){try{conn.close();}catch(Exception e){ } }
}
%>