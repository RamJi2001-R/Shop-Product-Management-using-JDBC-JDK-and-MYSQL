<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("adminEmail") == null) {
        response.sendRedirect("index.jsp?error=login_required");
        return;
    }

    String id = request.getParameter("id");
    String name = "";
    String category = "";
    double price = 0;
    int stock = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/grocerydb", "root", "root"
        );

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM products WHERE product_id=?"
        );
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            category = rs.getString("category");
            price = rs.getDouble("price");
            stock = rs.getInt("stock");
        }
    } catch(Exception e) {
        // simple error output for now
    }
%>
<html>
<head>
    <title>Edit Product - MyStore Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="dashboard-wrapper">
    <div class="page-card">
        <h2>Edit Product</h2>

        <form action="updateProduct.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">

            <label>Product Name</label>
            <input type="text" name="name" value="<%= name %>" required>

            <label>Category</label>
            <input type="text" name="category" value="<%= category %>" required>

            <label>Price</label>
            <input type="text" name="price" value="<%= price %>" required>

            <label>Stock</label>
            <input type="number" name="stock" value="<%= stock %>" required>

            <button class="btn-primary" type="submit">Update Product</button>
        </form>

        <div class="back-link">
            <a href="products.jsp">&larr; Back to Products</a>
        </div>
    </div>
</div>

</body>
</html>
