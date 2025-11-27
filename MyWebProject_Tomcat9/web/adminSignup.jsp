<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Signup - MyStore Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="app-wrapper">
    <div class="auth-card">
        <div class="auth-title">Create Admin Account</div>
        <div class="auth-subtitle">Set up access for the shop owner</div>

        <%
            String error = request.getParameter("error");
            if ("failed".equals(error)) {
        %>
            <div class="err">Signup failed. Try again.</div>
        <%
            } else if ("exists_or_db".equals(error)) {
        %>
            <div class="err">Email already exists or database error.</div>
        <%
            }
        %>

        <form action="saveAdmin.jsp" method="post">
            <label>Full Name</label>
            <input type="text" name="name" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button class="btn-primary" type="submit">Sign Up</button>
        </form>

        <div class="small-link">
            Already have an account? <a href="index.jsp">Login</a>
        </div>
    </div>
</div>

</body>
</html>
