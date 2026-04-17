<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <style>
        .form-box {
            width: 350px;
            margin: 60px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            background: #2a6fb0;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4f85;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .success {
            color: green;
        }
    </style>
</head>

<body>

<div class="form-box">

<h2>Create Account</h2>

<%
String error = request.getParameter("error");
if(error != null){
%>
<p class="error"><%= error %></p>
<%
}
%>

<form action="<%= request.getContextPath() %>/signup" method="post">

    <input type="text" name="name" placeholder="Full Name" required>

    <input type="email" name="email" placeholder="Email" required>

    <input type="password" name="password" placeholder="Password" required minlength="6">
    
    <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
    <input type="text" name="phone" placeholder="Phone Number" required>

    <button type="submit">Sign Up</button>

</form>

<br>

<a href="login.jsp">Already have an account? Login</a>

</div>

</body>
</html>