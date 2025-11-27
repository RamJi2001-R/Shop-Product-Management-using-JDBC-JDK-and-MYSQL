<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/grocerydb",
            "root",
            "root"
    );

    String sql = "SELECT * FROM admins WHERE email=? AND password=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, email);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("adminEmail", email);
        session.setAttribute("adminName", rs.getString("name"));
        response.sendRedirect("dashboard.jsp");
    } else {
        response.sendRedirect("index.jsp?error=invalid");
    }

} catch (Exception e) {
    out.println("<p class='err'>Error: " + e.getMessage() + "</p>");
}
%>
