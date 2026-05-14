<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Successful</title>

<style>

body{
    margin:0;
    padding:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#f5f1eb;
    font-family:Arial, sans-serif;
}

.box{
    background:white;
    padding:50px;
    border-radius:15px;
    text-align:center;
    width:400px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

h1{
    color:#2ecc71;
    margin-bottom:15px;
}

p{
    color:#666;
    font-size:18px;
}

.role{
    margin:20px 0;
    display:inline-block;
    padding:10px 20px;
    border-radius:30px;
    background:#ffe6e6;
    color:#e74c3c;
    font-weight:bold;
}

.btn{
    display:inline-block;
    margin-top:20px;
    padding:12px 25px;
    background:#c19a6b;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
}

.btn:hover{
    background:#a67c52;
}

</style>

</head>

<body>

<div class="box">

    <h1>Login Successful</h1>

    <p>
        Your Role:
        <strong>
            <%= session.getAttribute("role") %>
        </strong>
    </p>

    <div class="role">
        <%= session.getAttribute("role") %>
    </div>

    <br>

    <a class="btn"
       href="<%= request.getContextPath() %>/<%= session.getAttribute("redirectPage") %>">

       <%= session.getAttribute("role").equals("admin")
           ? "Go to Admin Dashboard"
           : "Continue Shopping"
       %>

    </a>

</div>

</body>
</html>