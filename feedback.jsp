<%-- 
    Document   : feedback
    Created on : 25 Mar, 2025, 7:34:52 PM
    Author     : suyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%
            String uname = request.getParameter("name");
            String email = request.getParameter("email");
            String feedback = request.getParameter("feedback");

                try {
                    Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/feedback3", "root", "root");

                    PreparedStatement stmt = con.prepareStatement("INSERT INTO feedback3(name,email,feedback) VALUES (?, ?, ?)");
                    stmt.setString(1, uname);
                    stmt.setString(2, email);
                    stmt.setString(3, feedback);

                    int row = stmt.executeUpdate();

                  
                } catch (Exception e) {
                    out.println("<h2 class='error'>Error: " + e.getMessage() + "</h2>");
                }
           
        %>

        </div>
    </body>
</html>
