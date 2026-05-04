<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f5efe7;
        }

        .navbar {
            background: #3e5c76;
            color: white;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
        }

        .nav-right a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .title {
            text-align: center;
            margin-top: 30px;
        }

        .dashboard {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 40px 0;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 25px;
            width: 220px;
            border-radius: 14px;
            text-align: center;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            font-size: 22px;
            font-weight: bold;
            color: #3e5c76;
        }

        .actions {
            text-align: center;
            margin-bottom: 40px;
        }

        .btn {
            padding: 12px 20px;
            background: #c69c6d;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            margin: 10px;
            display: inline-block;
            transition: 0.3s;
        }

        .btn:hover {
            background: #a67c52;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">Admin Panel</div>
    <div class="nav-right">
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</div>

<!-- TITLE -->
<h2 class="title">Welcome Admin</h2>

<!-- STATS -->
<div class="dashboard">

    <div class="card">
        <h3>Total Products</h3>
        <p>2</p>
    </div>

    <div class="card">
        <h3>Total Orders</h3>
        <p>11</p>
    </div>

    <div class="card">
        <h3>Revenue</h3>
        <p>Rs. 19100</p>
    </div>

</div>

<!-- ACTION BUTTONS -->
<div class="actions">

    <!-- ADD PRODUCT -->
    <a href="<%= request.getContextPath() %>/pages/addProduct.jsp" class="btn">
        Add Product
    </a>

    <!-- MANAGE PRODUCTS -->
    <a href="<%= request.getContextPath() %>/pages/admin/manageProducts.jsp" class="btn">
    Manage Products
</a>

    <!-- MANAGE ORDERS (FIXED) -->
    <a href="<%= request.getContextPath() %>/pages/admin/adminOrders.jsp" class="btn">
        Manage Orders
    </a>

</div>

</body>
</html>