<%@ page import="java.sql.*" %>

<%
try {
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    double price = Double.parseDouble(request.getParameter("price"));
    int stock = Integer.parseInt(request.getParameter("stock"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/grocerydb",
            "root",
            "root"
    );

    String sql = "INSERT INTO products(name,category,price,stock) VALUES (?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, category);
    ps.setDouble(3, price);
    ps.setInt(4, stock);
    ps.executeUpdate();

    response.sendRedirect("products.jsp?msg=added");

} catch (Exception e) {
    out.println("<p class='err'>Error: " + e.getMessage() + "</p>");
}
%>
