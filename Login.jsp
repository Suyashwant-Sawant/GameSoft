<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
    <style>
        body {
            background-image: url('Images/game background.jpg');
            font-family: 'Verdana', sans-serif;
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        div {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 255, 0, 0.8);
            width: 350px;
            text-align: center;
        }

        h1, h2 {
            color: #00ff00;
        }

        h2.success {
            color: #00ff00;
        }

        h2.error {
            color: #ff0000;
        }

        a {
            color: #00ff00;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #ff0000;
        }
        button{
            color:black;
            background-color: #00ff00;
            width : 170px;
            height: 50px;
            font-family: 'Verdana', sans-serif;
        }

    </style>
</head>
<body>
    <div>
        <h1>Login JSP Page</h1>
        <%
            String uname = request.getParameter("txtName");
            String pass = request.getParameter("txtPass");

            try {
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/register1", "root", "root");

                PreparedStatement stmt = con.prepareStatement("SELECT Password FROM register1 WHERE Name=?");
                stmt.setString(1, uname);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    if (pass.equals(rs.getString("Password"))) {
                        out.println("<h2 class='success'>Login Successful</h2>");
                        out.println("<a href='Game.html'><button><h3>GAME</h3></button></a>");
                    } else {
                        out.println("<h2 class='error'>Incorrect Password</h2>");
                        out.println("<jsp:include page='index.html'></jsp:include>");
                    }
                } else {
                    out.println("<h2 class='error'>User Name does not exist</h2>");
                    out.println("<jsp:include page='index.html'></jsp:include>");
                }

            } catch (Exception e) {
                out.println("<h2 class='error'>Error: " + e.getMessage() + "</h2>");
            }
        %>
    </div>
</body>
</html>
