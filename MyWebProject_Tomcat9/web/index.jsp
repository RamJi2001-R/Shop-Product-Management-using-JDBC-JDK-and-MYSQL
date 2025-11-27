<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Login - MyStore Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="app-wrapper">
    <div class="auth-card">
        <div class="auth-title">Welcome back</div>
        <div class="auth-subtitle">Login to continue managing your store</div>

        <%
            String msg = request.getParameter("msg");
            String error = request.getParameter("error");

            if ("signup_success".equals(msg)) {
        %>
            <div class="msg">Signup successful. Please login.</div>
        <%
            } else if ("logged_out".equals(msg)) {
        %>
            <div class="msg">You have been logged out.</div>
        <%
            }

            if ("invalid".equals(error)) {
        %>
            <div class="err">Invalid email or password.</div>
        <%
            } else if ("login_required".equals(error)) {
        %>
            <div class="err">Please login to access that page.</div>
        <%
            }
        %>

        <form action="login.jsp" method="post">
            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button class="btn-primary" type="submit">Login</button>
        </form>

        <div class="small-link">
            New admin? <a href="adminSignup.jsp">Create an account</a>
        </div>
    </div>
</div>

</body>
</html>
