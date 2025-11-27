<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session.getAttribute("adminEmail") == null) {
        response.sendRedirect("index.jsp?error=login_required");
        return;
    }
%>
<html>
<head>
    <title>Add Product - MyStore Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="dashboard-wrapper">
    <div class="page-card">
        <h2>Add New Product</h2>

        <form action="saveProduct.jsp" method="post">
            <label>Product Name</label>
            <input type="text" name="name" required>

            <label>Category</label>
            <input type="text" name="category" required>

            <label>Price</label>
            <input type="text" name="price" required>

            <label>Stock</label>
            <input type="number" name="stock" required>

            <button class="btn-primary" type="submit">Save Product</button>
        </form>

        <div class="back-link">
            <a href="dashboard.jsp">&larr; Back to Dashboard</a>
        </div>
    </div>
</div>

</body>
</html>
