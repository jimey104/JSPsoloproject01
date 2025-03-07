<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String id = (String) session.getAttribute("id");
if(id!=null){
	response.sendRedirect("../main.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
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
	<form action="signinProcess.jsp" method="post">
		<label>ID :</label>
		<input type="text" name="id" required/><br/>
		<label>PW :</label>
		<input type="text" name="pw" required/><br/>

		
		<input type="submit" class="btn-primary"/>
	</form>
</div>
</body>
</html>