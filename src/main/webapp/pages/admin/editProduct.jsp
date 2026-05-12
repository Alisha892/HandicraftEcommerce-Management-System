<%@ page import="java.sql.*" %>
<%@ page import="com.handicraft.config.DBConfig" %>

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
<title>Edit Product</title>

<style>
body { font-family: Arial; background: #f5f1eb; }
.container { width: 400px; margin: auto; margin-top: 50px; }

input, textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}

button {
    width: 100%;
    padding: 10px;
    background: green;
    color: white;
    border: none;
}
</style>

</head>

<body>

<div class="container">

<h2>Edit Product</h2>

<form action="<%= request.getContextPath() %>/EditProductServlet" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <input type="text" name="name" value="<%= rs.getString("name") %>" required>

    <input type="number" name="price" value="<%= rs.getDouble("price") %>" required>

    <textarea name="description" required><%= rs.getString("description") %></textarea>

    <button type="submit">Update Product</button>

</form>

</div>

</body>
</html>