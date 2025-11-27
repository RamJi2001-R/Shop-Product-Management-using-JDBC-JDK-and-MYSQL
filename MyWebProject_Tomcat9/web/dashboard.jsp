<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String adminEmail = (String) session.getAttribute("adminEmail");
    String adminName = (String) session.getAttribute("adminName");
    if (adminEmail == null) {
        response.sendRedirect("index.jsp?error=login_required");
        return;
    }
%>
<html>
<head>
    <title>Dashboard - MyStore Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="dashboard-wrapper">
    <div class="dashboard-card">

        <!-- HEADER -->
        <div class="dashboard-header">
            <div>
                <div class="dashboard-title">MyStore Management</div>
                <div class="dashboard-subtitle">Simple dashboard to manage your store inventory</div>
            </div>
            <div class="dashboard-user">
                <span><strong><%= adminName %></strong></span>
                <span><%= adminEmail %></span>
                <a class="logout-link" href="logout.jsp">Logout</a>
            </div>
        </div>

        <!-- CARDS -->
        <div class="card-grid">

            <!-- ADD PRODUCT CARD -->
            <a href="addProduct.jsp">
                <div class="action-card">
                    <div class="action-icon">+</div>
                    <div>
                        <div class="action-content-title">Add Product</div>
                        <div class="action-content-desc">Quickly add a new item to your store inventory.</div>
                    </div>
                </div>
            </a>

            <!-- VIEW PRODUCTS CARD -->
            <a href="products.jsp">
                <div class="action-card">
                    <div class="action-icon">&#128202;</div>
                    <div>
                        <div class="action-content-title">View Products</div>
                        <div class="action-content-desc">See all products, stock levels, and update or delete.</div>
                    </div>
                </div>
            </a>

            <!-- LOGOUT CARD -->
            <a href="logout.jsp">
                <div class="action-card">
                    <div class="action-icon">&#128274;</div>
                    <div>
                        <div class="action-content-title">Logout</div>
                        <div class="action-content-desc">Securely sign out from MyStore Management.</div>
                    </div>
                </div>
            </a>

        </div>
    </div>
</div>

</body>
</html>
