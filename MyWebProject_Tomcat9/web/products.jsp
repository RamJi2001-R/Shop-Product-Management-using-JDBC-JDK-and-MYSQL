<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("adminEmail") == null) {
        response.sendRedirect("index.jsp?error=login_required");
        return;
    }

    String keyword = request.getParameter("keyword");
    if (keyword == null) keyword = "";
%>

<html>
<head>
    <title>Products - MyStore Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="dashboard-wrapper">
    <div class="table-card">

        <!-- HEADER -->
        <div class="table-header-row">
            <div class="table-title">All Products</div>
            <div class="table-actions">
                <a href="addProduct.jsp">+ Add Product</a>
                <a href="dashboard.jsp">Dashboard</a>
            </div>
        </div>

        <form method="get" style="margin-top: 14px;">
            <input type="text"
                   name="keyword"
                   placeholder="Search by name or category..."
                   value="<%= keyword %>"
                   style="width: 250px; padding: 8px 10px; border-radius: 10px; border: 1px solid #d0d7e2;">
            <button class="btn-primary" style="width: 120px; margin-left: 10px;">Search</button>
        </form>

        <!-- TABLE -->
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/grocerydb", "root", "root"
                    );

                    String query = "SELECT * FROM products WHERE name LIKE ? OR category LIKE ?";

                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, "%" + keyword + "%");
                    ps.setString(2, "%" + keyword + "%");

                    ResultSet rs = ps.executeQuery();

                    boolean found = false;

                    while (rs.next()) {
                        found = true;
            %>

                        <tr>
                            <td><%= rs.getInt("product_id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("category") %></td>
                            <td><%= rs.getDouble("price") %></td>
                            <td><%= rs.getInt("stock") %></td>

                            <td>
                                <a class="action-btn edit-btn"
                                   href="editProduct.jsp?id=<%= rs.getInt("product_id") %>">
                                   Edit
                                </a>
                            </td>
                            <td>
                                <a class="action-btn delete-btn"
                                   href="deleteProduct.jsp?id=<%= rs.getInt("product_id") %>"
                                   onclick="return confirm('Delete this product?');">
                                   Delete
                                </a>
                            </td>
                        </tr>

            <%
                    }

                    if (!found) {
            %>
                        <tr>
                            <td colspan="7" style="text-align:center; color:#555;">No products found.</td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
            %>
                    <tr><td colspan="7">Error: <%= e.getMessage() %></td></tr>
            <%
                }
            %>
        </table>
    </div>
</div>

</body>
</html>
