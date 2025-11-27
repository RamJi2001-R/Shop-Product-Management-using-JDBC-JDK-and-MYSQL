package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
    import java.io.PrintWriter;
import java.sql.Connection;

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try {
            Connection con = DBConnection.getConnection();
            if (con != null) {
                out.println("<h2>Database Connected Successfully! (Tomcat 9)</h2>");
            } else {
                out.println("<h2>Connection Failed!</h2>");
            }
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
