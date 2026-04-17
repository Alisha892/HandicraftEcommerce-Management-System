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

<h2>Edit Product</h2>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<form action="<%= request.getContextPath() %>/editProduct" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
    Price: <input type="text" name="price" value="<%= rs.getDouble("price") %>"><br>
    Description: <input type="text" name="description" value="<%= rs.getString("description") %>"><br>
    Category: <input type="text" name="category" value="<%= rs.getString("category") %>"><br>

    <button type="submit">Update</button>
</form>