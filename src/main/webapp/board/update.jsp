<%@page import="util.DatabaseUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("username") == null) {
    response.sendRedirect("signin/signIn.jsp");
    return;
}

String idStr = request.getParameter("id");
if(idStr == null) {
    response.sendRedirect("..main.jsp");
    return;
}

String sql = "select * from market where id = ? and writer = ?";

int id = Integer.parseInt(idStr);
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rset = null;

try{
	conn = DatabaseUtil.getConnection();
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, id);
	psmt.setString(2, (String)session.getAttribute("username"));
	rset = psmt.executeQuery();
	if(rset.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<style>
     body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        text-align: center;
        padding: 20px;
    }
    .container {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        max-width: 350px;
        margin: 0 auto;
    }
    .container input {
        width: calc(100% - 20px);
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
    }
    
    .btn-primary {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px;
        width: calc(100% - 20px);
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
    
        <h2>게시물 수정</h2>
        
        <form action="updateProcess.jsp?id=<%=rset.getString("id") %>" method="post">
        
			<div class="form-group">
                <input type="text" name="title" value="<%=rset.getString("title") %>" required/> </div>
                
            <div class="form-group">
                <input type="text" name="price" value="<%=rset.getString("price") %>" required/> </div>
                
            <div class="form-group">
                <input type="text" name="category" value="<%=rset.getString("category") %>" required/> </div>
            
            <div class="form-group">
                <input type="text" name="loc" value="<%=rset.getString("loc") %>" required/> </div>

			<div class="form-group">
                <input name="text" name="alt" value="<%=rset.getString("alt") %>" required/> </div>
                
            <div class="form-group">
                <textarea name="content" value="<%=rset.getString("content") %>" required></textarea> </div>
            
            <div class="board-buttons">
                <button type="submit">수정</button>
                <a href="..main.jsp" class="btn">취소</a>
            </div>
            
        </form>
    </div>
</body>
</html>
<%
}else{   out.println("<script>alert('권한이 없습니다.'); history.back();</script>"); }
}catch(Exception e){ e.printStackTrace(); 
}finally{
if(rset!=null)try { rset.close(); } catch(Exception e) {}
if(psmt!=null)try { psmt.close(); } catch(Exception e) {}
if(conn!=null)try { conn.close(); } catch(Exception e) {}
}
%>
