<%@page import="util.DatabaseUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String comment = request.getParameter("vComment");
String writer = (String)session.getAttribute("username");
if(writer==null){writer = "익명";}
String mId = request.getParameter("mId");

Connection conn = null;
PreparedStatement psmt = null;


try {
    conn = DatabaseUtil.getConnection();
    
 	// 댓글 작성
    String sql = "INSERT INTO comment (vWriter, vComment, mId) VALUES (?,?,?)";
    psmt = conn.prepareStatement(sql);
   
   	psmt.setString(1, writer);  
   			
    psmt.setString(2, comment);   
    psmt.setString(3, mId);  
    int result = psmt.executeUpdate();

	if(result > 0) {
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
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