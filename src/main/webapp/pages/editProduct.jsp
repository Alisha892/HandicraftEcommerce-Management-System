<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection conn = DBConfig.getConnection();
PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();

rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<style>

/* BODY */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4efe9;
}

/* NAVBAR */
.navbar {
    background-color: #3e5c76;
    color: white;
    padding: 15px 40px;
    display: flex;
    justify-content: space-between;
}

.navbar a {
    color: white;
    text-decoration: none;
}

/* CENTER */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 85vh;
}

/* CARD */
.form-box {
    background: white;
    padding: 40px;
    width: 400px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.form-box h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* INPUTS */
.form-group {
    margin-bottom: 15px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

textarea {
    height: 80px;
    resize: none;
}

/* BUTTON */
.btn {
    width: 100%;
    padding: 12px;
    background-color: #c19a6b;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
}

.btn:hover {
    background-color: #a67c52;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>Edit Product</div>
    <a href="products.jsp">Back</a>
</div>

<!-- FORM -->
<div class="container">

<div class="form-box">

<h2>Update Product</h2>

<form action="<%=request.getContextPath()%>/editProduct" method="post">

    <input type="hidden" name="id" value="<%=rs.getInt("id")%>">

    <div class="form-group">
        <input type="text" name="name" value="<%=rs.getString("name")%>" required>
    </div>

    <div class="form-group">
        <input type="number" name="price" value="<%=rs.getDouble("price")%>" required>
    </div>

    <div class="form-group">
        <textarea name="description"><%=rs.getString("description")%></textarea>
    </div>

    <div class="form-group">
        <input type="text" name="category" value="<%=rs.getString("category")%>">
    </div>

    <button type="submit" class="btn">Update Product</button>

</form>

</div>

</div>

</body>
</html>