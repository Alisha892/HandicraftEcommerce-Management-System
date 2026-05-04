<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f5efe7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            padding: 40px;
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            color: #333;
        }

        .role {
            font-size: 18px;
            margin: 10px 0;
            color: #666;
        }

        .badge {
            display: inline-block;
            padding: 6px 15px;
            border-radius: 20px;
            font-weight: bold;
            margin-top: 10px;
        }

        .admin {
            background: #ffe0e0;
            color: #c0392b;
        }

        .user {
            background: #e0f0ff;
            color: #2980b9;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 25px;
            background: #c49a6c;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            background: #a67c52;
        }
    </style>
</head>

<body>

<div class="card">

    <h1>Login Successful</h1>

    <div class="role">
        Your Role: <b><%= session.getAttribute("role") %></b>
    </div>

    <%
        String role = (String) session.getAttribute("role");
        if ("admin".equalsIgnoreCase(role)) {
    %>

        <div class="badge admin">ADMIN</div>
        <br>
        <a class="btn" href="admin/dashboard.jsp">Go to Admin Dashboard</a>

    <%
        } else {
    %>

        <div class="badge user">USER</div>
        <br>
        <a class="btn" href="products.jsp">Go to Shop</a>

    <%
        }
    %>

</div>

</body>
</html>