<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String mId = request.getParameter("mId");
if (mId == null) {
    response.sendRedirect("/main.jsp");
    return;
}

int id = Integer.parseInt(mId);

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rset = null;

try {
    conn = DatabaseUtil.getConnection();
    
    // 조회수 증가
    String updateSql = "UPDATE market SET viewcount = viewcount + 1 WHERE id = ?";
    psmt = conn.prepareStatement(updateSql);
    psmt.setInt(1, id);
    psmt.executeUpdate();
    psmt.close(); // 기존 psmt 닫기

    // 게시글 조회
    String sql = "SELECT m.*, u.name FROM market m JOIN users u ON m.writer = u.username WHERE m.id = ?";
    psmt = conn.prepareStatement(sql);
    psmt.setInt(1, id);
    rset = psmt.executeQuery();

    if (rset.next()) {
        
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<title><%=rset.getString("title")%></title>
<style type="text/css">
	.item {
        background: white;
        padding: 10px;
        border-radius: 3px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
        
    }
    .item img {
        width: 490px;
    	height: 290px;
        object-fit: cover;
        border-radius: 3px;
    }
    .item .item-text{
    	text-align: left;
   		padding: 25px;
    }
</style>
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h2><%=rset.getString("title")%></h2>
            <div class="board-nav">
                <a href="../main.jsp">메인</a>
                <% if (session.getAttribute("username") != null && 
                      session.getAttribute("username").equals(rset.getString("writer"))) { %>
                    <a href="update.jsp?id=<%=id%>">수정</a>
                     <a href="delete.jsp?id=<%=id%>">삭제</a>
                <% } %>
            </div>
        </div>
        <div class="item">		   
            <img alt="<%=rset.getString("alt")%>" src="${pageContext.request.contextPath}<%=rset.getString("alt")%>"> 
            <div class="item-text">
	            <div style="font-weight: bold; margin: 4px; margin-bottom: 18px; font-size: large;"><%=rset.getString("title")%>
	            	 <span style="font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;<%=rset.getInt("price")%>원</span> 
	            	</div>
	            <span style="color: gray;"><%=rset.getString("category") != null ? rset.getString("category") : "기타"%></span>
	                       	            
	            <span><%=rset.getString("loc")%></span>
            </div>
        </div>
        <div class="board-content">
            <%=rset.getString("content").replace("\n", "<br>")%>
        </div>
        
        <div class="board-info">
            <span>작성자: <%=rset.getString("writer")%></span>
            <span>작성일: <%=rset.getTimestamp("regdate")%></span>
            <span>조회수: <%=rset.getInt("viewcount")%></span>
        </div>
<%
    } else {
        out.println("<script>alert('존재하지 않는 게시글입니다.'); location.href='../main.jsp';</script>");
    }
} catch (Exception e) { 
    e.printStackTrace();
} finally {
    if (rset != null) { try { rset.close(); } catch (Exception e) {} }
    if (psmt != null) { try { psmt.close(); } catch (Exception e) {} }
    if (conn != null) { try { conn.close(); } catch (Exception e) {} } 
}
%>         

        <div class="board-content">
	        <c:forEach var="comment" items="${list}">
	            <div>${comment.vComment}</div>
	            <div>${comment.vWriter}</div>
	            <div>${comment.vDate}</div>
	        </c:forEach>
        </div>
 
        <!-- 댓글창 -->
        <form action="commentProcess.jsp" method="post">
        	<input type="hidden" name="mId" value="<%= mId%>"/>
			<textarea rows="5" cols="50" name="vComment"></textarea>
			<input type="submit" class="btn-primary"/>
		</form>	
    </div>
</body>
</html>
