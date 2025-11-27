<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
double price = Double.parseDouble(request.getParameter("price"));
int stock = Integer.parseInt(request.getParameter("stock"));

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/grocerydb", "root", "root"
    );

    PreparedStatement ps = con.prepareStatement(
        "UPDATE products SET name=?, category=?, price=?, stock=? WHERE product_id=?"
    );

    ps.setString(1, name);
    ps.setString(2, category);
    ps.setDouble(3, price);
    ps.setInt(4, stock);
    ps.setInt(5, Integer.parseInt(id));

    ps.executeUpdate();

    response.sendRedirect("products.jsp?msg=updated");

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
