<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    if(session.getAttribute("username") == null) {
    	response.sendRedirect("../main.jsp");
        return;
    }
    
    String idStr = request.getParameter("id");
    
    Connection conn = null;
    PreparedStatement psmt = null;
    
    try {
        conn = DatabaseUtil.getConnection();
        String sql = "DELETE FROM market WHERE id = ? AND writer = ?";
        psmt = conn.prepareStatement(sql);
        psmt.setInt(1, Integer.parseInt(idStr));
        psmt.setString(2, (String)session.getAttribute("username"));
        
        int result = psmt.executeUpdate();
        
        if(result > 0) {
        	response.sendRedirect("../main.jsp");
        } else {
            out.println("<script>alert('삭제에 실패했습니다.'); history.back();</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다.'); history.back();</script>");
    } finally {
        if(psmt != null) try { psmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 