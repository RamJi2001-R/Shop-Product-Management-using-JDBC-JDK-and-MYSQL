<%
session.invalidate();
response.sendRedirect("index.jsp?msg=logged_out");
%>
