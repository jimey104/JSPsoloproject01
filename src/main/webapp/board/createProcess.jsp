<%@page import="util.DatabaseUtil"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

if(session.getAttribute("id") == null) {
    response.sendRedirect("signin/signIn.jsp");
    return;
}

String title = request.getParameter("title");
String price = request.getParameter("price");
String category = request.getParameter("category");
String loc = request.getParameter("loc");
String content = request.getParameter("content");
String writer = (String)session.getAttribute("username");
String alt = request.getParameter("alt");



String sql = "insert into market(title, price, category, loc, content, writer, alt) values (?,?,?,?,?,?,?)";

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
	psmt.setString(6, writer);
	psmt.setString(7, alt);
	
	int result = psmt.executeUpdate();
	
	if(result > 0) {
		response.sendRedirect("../main.jsp");
    } else {
        out.println("<script>alert('글 작성에 실패했습니다.'); history.back();</script>");
    }
}catch(Exception e){ 
	e.printStackTrace(); 
	out.println("<script>alert('오류.'); history.back();</script>");
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