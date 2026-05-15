<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>

<style>

body{
    margin:0;
    font-family:Arial,sans-serif;
    background:#f5f1eb;
}

.navbar{
    background:#3e5c76;
    padding:15px 40px;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-right:25px;
    font-weight:bold;
}

.container{

    width:80%;
    margin:40px auto;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);

}

h1{
    color:#3e5c76;
}

p{
    line-height:1.8;
    color:#555;
}

</style>

</head>

<body>

<div class="navbar">

<a href="<%=request.getContextPath()%>/pages/products.jsp">Home</a>

<a href="<%=request.getContextPath()%>/pages/about.jsp">About</a>

<a href="<%=request.getContextPath()%>/pages/contact.jsp">Contact</a>

<a href="<%=request.getContextPath()%>/logout">Logout</a>

</div>


<div class="container">

<h1>About Handicraft E-Commerce</h1>

<p>

The Handicraft E-Commerce Management System is a web-based application developed to provide customers with an easy and convenient platform for purchasing handmade products online. The system enables users to browse handicraft products, manage carts, place orders, and track purchases efficiently.

</p>

<p>

The objective of the project is to support digital business operations and promote local handicraft products through an organized online platform. Administrators can manage products and customer orders through an admin dashboard.

</p>

<p>

This project is developed using Java, JSP, Servlets, JDBC, HTML, CSS, and MySQL following the MVC architecture.

</p>

</div>

</body>
</html>