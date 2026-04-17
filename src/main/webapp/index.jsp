<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Handicraft Store</title>

   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fa;
        }

        /* NAVBAR */
        .navbar {
            background: #2a6fb0;
            padding: 15px;
            text-align: center;
        }

        .navbar a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        /* HERO SECTION */
        .hero {
            height: 70vh;
            background: url('https://images.unsplash.com/photo-1616627455935-5d0d4c3e9f1c') center/cover no-repeat;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .hero h1 {
            font-size: 45px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 18px;
            margin-bottom: 25px;
        }

        .btn {
            padding: 12px 25px;
            background: #ffffff;
            color: #2a6fb0;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .btn:hover {
            background: #e0eaff;
        }

        /* FEATURES */
        .features {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 50px 20px;
        }

        .card {
            width: 250px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            color: #555;
        }

        /* FOOTER */
        .footer {
            background: #2a6fb0;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <a href="#">Home</a>
    <a href="pages/login.jsp">Login</a>
    <a href="pages/signup.jsp">Sign Up</a>
</div>

<!-- HERO -->
<div class="hero" style="background:black; color:white;">
    <h1>Handicraft E-Commerce</h1>
    <p>Discover unique handmade products crafted with love</p>

    
</div>

<!-- FEATURES -->
<div class="features">

    <div class="card">
        <h3>Handmade</h3>
        <p>Authentic handcrafted items made by skilled artisans</p>
    </div>

    <div class="card">
        <h3>Fast Delivery</h3>
        <p>Quick and reliable delivery at your doorstep</p>
    </div>

    <div class="card">
        <h3>Affordable</h3>
        <p>High-quality products at reasonable prices</p>
    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 Handicraft Store | All Rights Reserved
</div>

</body>
</html>