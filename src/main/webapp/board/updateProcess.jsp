<%@page import="util.DatabaseUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

if(session.getAttribute("username") == null) {
    response.sendRedirect("signin/signIn.jsp");
    return;
}

String idStr = request.getParameter("id");
String title = request.getParameter("title");
String price = request.getParameter("price");
String category = request.getParameter("category");
String loc = request.getParameter("loc");
String content = request.getParameter("content");
String alt = request.getParameter("alt");


String sql = "update market set title = ?, price = ?, category = ?, loc = ?, content = ?, alt = ? where id = ? and writer = ?";


Connection conn = null;
PreparedStatement psmt = null;


try{
    conn = DatabaseUtil.getConnection();
	psmt = conn.prepareStatement(sql);

	psmt.setString(1, title);
	psmt.setString(2, price);
	psmt.setString(3, category);
	psmt.setString(4, loc);
	psmt.setString(5, content);
	psmt.setString(6, alt);
	psmt.setInt(7, Integer.parseInt(idStr));
	psmt.setString(8, (String)session.getAttribute("username"));

	int result = psmt.executeUpdate();
	
	if(result > 0) {
        response.sendRedirect("view.jsp?id=" + idStr);
    } else {
        out.println("<script>alert('수정에 실패했습니다.'); history.back();</script>");
    }
} catch(Exception e) {
    e.printStackTrace();
    out.println("<script>alert('오류가 발생했습니다.'); history.back();</script>");
}finally{
	if(psmt!=null)try { psmt.close(); } catch(Exception e) {}
	if(conn!=null)try { conn.close(); } catch(Exception e) {}
}
%>