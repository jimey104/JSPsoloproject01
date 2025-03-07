<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("id") == null) {
        response.sendRedirect("../signin/signIn.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
    
    
        <h2>글쓰기</h2>
        
       
        <form action="createProcess.jsp" method="post">
        
            <div class="form-group">
                <input type="text" name="title" placeholder="제목" required/> </div>
            
            <div class="form-group">
                <input type="text" name="price" placeholder="가격 예)10000" required/> </div>
            
            <div class="form-group">
                <input type="text" name="category" placeholder="카테고리" required/> </div>
            
            <div class="form-group">
                <input type="text" name="loc" placeholder="거래지역 예)**시 **구 **동" required/> </div>
            
            <div class="form-group">
                <input name="text" name="alt" placeholder="이미지주소" required/> </div>
            
            <div class="form-group">
                <textarea name="content" placeholder="내용" required></textarea> </div>
            
            <div class="board-buttons">
          
                <button type="submit">등록</button>
                <a href="list.jsp" class="btn">취소</a>
                
            </div>
        </form>
    </div>
</body>
</html>
