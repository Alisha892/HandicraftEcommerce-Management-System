<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #e6dfd6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: #f7f7f7;
            padding: 40px;
            border-radius: 12px;
            width: 350px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #c49a6c;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background: #b88b5a;
        }

        .signup {
            margin-top: 15px;
            font-size: 14px;
        }

        .signup a {
            color: #6b4f2a;
            text-decoration: none;
            font-weight: bold;
        }

        .signup a:hover {
            text-decoration: underline;
        }
        .error-box{
    background: #ffe5e5;
    color: #d8000c;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
    font-weight: bold;
    border: 1px solid #ffb3b3;
}

.success-box{
    background: #e6ffed;
    color: #2e7d32;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
    font-weight: bold;
    border: 1px solid #b7ebc6;
}
    </style>
</head>

<body>

<div class="card">
    <h2>Login</h2>
    
    <%
String error = request.getParameter("error");
if(error != null){
%>

<div class="error-box">
    <%= error %>
</div>

<%
}
%>

<%
String success = request.getParameter("success");
if(success != null){
%>

<div class="success-box">
    <%= success %>
</div>

<%
}
%>

    <form action="<%= request.getContextPath() %>/login" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <!-- ✅ SIGNUP OPTION -->
    <div class="signup">
        Don't have an account?
        <a href="signup.jsp">Sign Up</a>
    </div>
</div>

</body>
</html>