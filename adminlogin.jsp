<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        .login {
            padding-right: 50px;
            margin-right: 50px;
        }
        body {
            font-family: Arial, sans-serif;
            background-image: url("images/adminbg.avif");
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: lightpink;
            border: 5px solid #111111;
            border-radius: 5px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 50%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
        }
    </style>
</head>
<body>
    <br><br><br><br>
    <div class="login">
        <form action="admin.jsp" method="post">
            <% 
            // Check if an error message exists in the session
            String errorMessage = (String) session.getAttribute("adminErrorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
                %>
                <br>
                <center>
                    <span style="color: red; font-size: 20px;"><%= errorMessage %></span>
                </center>
                <%
                // Remove the error message from the session after displaying it
                session.removeAttribute("adminErrorMessage");
            }
            %>
            <h2>Admin Login</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            
            <center>
                <input type="submit" value="Login">
            </center>
        </form>
    </div>
</body>
</html>
