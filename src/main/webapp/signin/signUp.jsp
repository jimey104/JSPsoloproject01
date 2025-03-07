<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
    
        <h2>회원가입</h2>
        
        <form action="signUpProcess.jsp" method="post">
        
         <div class="form-group">
            <input type="text" name="id" placeholder="아이디" required/> </div>
            
         <div class="form-group">
            <input type="text" name="pw" placeholder="비밀번호" required/> </div>
            
         <div class="form-group">
            <input type="text" name="username" placeholder="닉네임" required/> </div>
               
         <div class="form-group">
            <input type="text" name="address" placeholder="주소" required/> </div>  
             
         <div class="form-group">
            <input type="text" name="name" placeholder="이름" required/> </div>
            
         <div class="form-group">
            <input type="text" name="email" placeholder="이메일" required/> </div>
               
            <input type="submit" class="btn-primary" value="가입하기">
        </form>
    </div>
</body>
</html>


