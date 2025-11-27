<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/grocerydb",
            "root",
            "root"
    );

    String sql = "INSERT INTO admins(name,email,password) VALUES (?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.executeUpdate();

    response.sendRedirect("index.jsp?msg=signup_success");

} catch (Exception e) {
    out.println("<p class='err'>Error: " + e.getMessage() + "</p>");
}
%>
