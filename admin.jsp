<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Result</title>
</head>
<body>
    <%-- Retrieve the submitted credentials --%>
    <% String username = request.getParameter("username");
       String password = request.getParameter("password");

       // Check if the credentials are correct
       if (username.equals("saikeerthi") && password.equals("keerthi22")) {
           // Valid credentials, redirect to the admin dashboard
           session.setAttribute("adminusername",username);
           response.sendRedirect("adminhomepage.jsp");
       } else {
           // Invalid credentials, display an error message
           session.setAttribute("adminErrorMessage", "Invalid email or password. Please try again.");
           response.sendRedirect("adminlogin.jsp");
       }
    %>
</body>
</html>
