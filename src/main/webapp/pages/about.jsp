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

The Handicraft E-Commerce System is a web-based platform developed to provide customers with an easy and convenient way to explore and purchase handmade and traditional handicraft products online. The system is designed to support digital commerce by connecting customers with a variety of handcrafted items through a simple and user-friendly interface. It aims to promote handicraft products and improve accessibility by allowing users to browse and purchase items from anywhere and at any time.
</p>

<p>

Our platform provides a range of services and features to enhance the shopping experience. Customers can create accounts, securely log in, browse products, search and sort items, view product details, add products to the cart, place orders, and manage their profiles. The system also displays discounts, promotional offers, and product availability information to help users make better purchasing decisions.

</p>

<p>

For administrators, the system provides an efficient management platform to add, edit, and remove products, manage stock and inventory, update product offers, and monitor customer orders through the admin dashboard. The goal of the Handicraft E-Commerce System is to simplify online shopping, improve inventory management, and provide a complete digital solution for handicraft businesses.

</p>

</div>

</body>
</html>