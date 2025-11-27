<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/grocerydb",
            "root",
            "root"
    );

    String sql = "DELETE FROM products WHERE product_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, Integer.parseInt(id));
    ps.executeUpdate();

    response.sendRedirect("products.jsp?msg=deleted");

} catch (Exception e) {
    out.println("<p class='err'>Error: " + e.getMessage() + "</p>");
}
%>
