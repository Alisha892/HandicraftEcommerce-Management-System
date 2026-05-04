<!DOCTYPE html>
<html>
<head>
    <title>Handicraft Store</title>

    <!-- IMPORTANT -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="navbar">
    <div class="logo">Handicraft</div>
    <div class="nav-links">
        <a href="#">Home</a>
        <a href="pages/login.jsp">Login</a>
        <a href="pages/signup.jsp">Sign Up</a>
    </div>
</div>

<div class="hero">
    <h1>Crafted by Nature</h1>
    <p>Beautiful handmade products made with passion.</p>
    <a href="pages/login.jsp" class="btn-primary">Shop Now</a>
</div>

<div class="features">
    <div class="feature-box">
        <h3>Handmade</h3>
        <p>Crafted by artisans</p>
    </div>

    <div class="feature-box">
        <h3>Eco Friendly</h3>
        <p>Natural & sustainable</p>
    </div>

    <div class="feature-box">
        <h3>Unique</h3>
        <p>Every item is special</p>
    </div>
</div>

<h2 class="section-title">Back in Stock</h2>

<div class="product-grid">

    <!-- Handmade Mug -->
    <div class="product-card">
    <img src="${pageContext.request.contextPath}/uploads/Mug.png" width="250" height="250" alt="Logo">
        <h3>Handmade Mug</h3>
        <p>Rs. 1200</p>
        <a href="pages/login.jsp" class="btn-outline">Add to Cart</a>
    </div>

    <!-- Clay Plate -->
    <div class="product-card">
    <img src="${pageContext.request.contextPath}/uploads/clayplate.png" width="250" height="250" alt="Logo">
    <h3>Clay Plate</h3>
    <p>Rs. 900</p>
    <a href="pages/login.jsp" class="btn-outline">Add to Cart</a>
</div>

    <!-- Wood Craft -->
    <div class="product-card">
       <img src="${pageContext.request.contextPath}/uploads/woodcraft.png" width="250" height="250" alt="Logo"> 
        <h3>Wood Craft</h3>
        <p>Rs. 1500</p>
        <a href="pages/login.jsp" class="btn-outline">Add to Cart</a>
    </div>

    <!-- Decor Vase -->
    <div class="product-card">
        <img src="${pageContext.request.contextPath}/uploads/vase.png" width="250" height="250" alt="Logo"> 
        <h3>Decor Vase</h3>
        <p>Rs. 1800</p>
        <a href="pages/login.jsp" class="btn-outline">Add to Cart</a>
    </div>

</div>

</body>
</html>