<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from market where sno = ?";

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rset = null;

String sno = null;
String alt = null;
String title = null;
String loc =  null;
String price = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, "root", "1234");
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, request.getParameter("sno"));
	rset = psmt.executeQuery();
	while(rset.next()){
		sno = rset.getString("sno");
		alt = rset.getString("alt");
		title = rset.getString("title");
		loc =  rset.getString("loc");
		price = rset.getString("price");
	}
}catch(Exception e){ e.printStackTrace(); 
}finally{
	if(rset!=null)try { rset.close(); } catch(Exception e) {}
	if(psmt!=null)try { psmt.close(); } catch(Exception e) {}
	if(conn!=null)try { conn.close(); } catch(Exception e) {}
}
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
        <form action="updPost.jsp">
            <label class="lab">게시물 번호</label>
            <input type="text" name="sno" value="<%=sno%>" readonly/><br>
            <label>이미지 주소</label>
            <input type="text" name="alt" value="<%=alt%>"/><br>
            <label>게시물 제목</label>
            <input type="text" name="title" value="<%=title%>"/><br>
            <label>본인 거주지</label>
            <input type="text" name="loc" value="<%=loc%>"/><br>
            <label>중고품 가격</label>
            <input type="text" name="price" value="<%=price%>"/><br>
            <input type="submit" class="btn-primary" value="수정하기"/>
        </form>
    </div>
</body>
</html>
