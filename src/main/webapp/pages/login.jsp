<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<h2>Login Page</h2>


<form action="<%= request.getContextPath() %>/login" method="post">
    Email: <input type="text" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>
<div class="signup-link">
    Don't have an account? 
    <a href="signup.jsp">Sign Up</a>
</div>

</body>
</html>