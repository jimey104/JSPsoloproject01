<%@page import="util.DatabaseUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String vId = request.getParameter("vId");

Connection conn = null;
PreparedStatement psmt = null;

try {
	String sql = "delete from comment where vId = ?";
    conn = DatabaseUtil.getConnection();
    psmt = conn.prepareStatement(sql); 
    psmt.setString(1, vId);
    int result = psmt.executeUpdate();
    
    if(result > 0) {
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	} else {
	    out.println("<script>alert('글 삭제에 실패했습니다.'); history.back();</script>");
	}
}catch(Exception e){ 
	e.printStackTrace(); 
	out.println("<script>alert('오류.'); history.back();</script>");
}finally{
	if(psmt!=null)try { psmt.close(); } catch(Exception e) {}
	if(conn!=null)try { conn.close(); } catch(Exception e) {}
}
%>