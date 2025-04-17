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
            button{
            color:black;
            background-color:#00ff00;
            width : 170px;
            height: 50px;
            font-family: 'Verdana', sans-serif;
        }
    </style>
</head>
<body>
    <div>
        <h1>Registration Page</h1>
        <%
            String uname = request.getParameter("txtName");
            String pass1 = request.getParameter("txtPass1");
            String pass2 = request.getParameter("txtPass2");
            String email = request.getParameter("txtEmail");

            if (pass1.equals(pass2)) {
                try {
                    Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/register1", "root", "root");

                    PreparedStatement stmt = con.prepareStatement("INSERT INTO register1(Name,Password,Gmail) VALUES (?, ?, ?)");
                    stmt.setString(1, uname);
                    stmt.setString(2, pass1);
                    stmt.setString(3, email);

                    int row = stmt.executeUpdate();

                    if (row == 1) {
                        out.println("<h2 class='success'>Registration Successful</h2>");
                         out.println("<a href='Game.html'><button><h3>GAME</h3></button></a>");
                    } else {
                        out.println("<h2 class='error'>Registration Failed</h2>");
                        %><jsp:include page="index.html"></jsp:include><%
                    }

                } catch (Exception e) {
                    out.println("<h2 class='error'>Error: " + e.getMessage() + "</h2>");
                }
            } else {
                out.println("<h2 class='error'>Password Mismatch</h2>");
                %><jsp:include page="index.html"></jsp:include><%
            }
        %>
    </div>
</body>
</html>
