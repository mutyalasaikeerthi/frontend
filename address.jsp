<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Address Details</title>
</head>
<body>
    <h1>Address Details</h1>
    
    <%-- Retrieve the address parameter from the request --%>
    <% String address = request.getParameter("address"); %>
    
    <%-- Retrieve the username parameter from the request --%>
    
    <%  String username = (String) session.getAttribute("username"); %>
    
    <%-- Validate and process the address and username if needed --%>
    <% if (address != null && !address.isEmpty() && username != null && !username.isEmpty()) { %>
        <%-- Display the address and username --%>
        <p>Entered Address: <%= address %></p>
        <p>Entered Username: <%= username %></p>
        
        <%-- Database Connection Configuration --%>
        <% String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE"; // Replace with your Oracle connection URL %>
        <% String dbUsername = "system"; // Replace with your Oracle username %>
        <% String dbPassword = "system"; // Replace with your Oracle password %>
        
        <%-- Perform Database Insertion --%>
        <% Connection conn = null; %>
        <% Statement stmt = null; %>
        <% try { %>
            <% Class.forName("oracle.jdbc.driver.OracleDriver"); %>
            <% conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword); %>
            
            <% String updateQuery = "UPDATE register SET address = ? WHERE username = ?"; %>
            <% stmt = conn.createStatement(); %>
            <% PreparedStatement preparedStatement = conn.prepareStatement(updateQuery); %>
            <% preparedStatement.setString(1, address); %>
            <% preparedStatement.setString(2, username); %>
            
            <% int rowsAffected = preparedStatement.executeUpdate(); %>
            
            <% if (rowsAffected > 0) { %>
                <% response.sendRedirect("user.jsp"); %>
            <% } else { %>
                <p>Failed to insert the address into the database.</p>
            <% } %>
            
        <% } catch (ClassNotFoundException | SQLException e) { %>
            <p>Error: <%= e.getMessage() %></p>
        <% } finally { %>
            <% if (stmt != null) { %>
                <% try { stmt.close(); } catch (SQLException e) { } %>
            <% } %>
            <% if (conn != null) { %>
                <% try { conn.close(); } catch (SQLException e) { } %>
            <% } %>
        <% } %>
        
    <% } else { %>
        <p>No address or username entered.</p>
    <% } %>
    
    <%-- Add more HTML or JSP code here as needed --%>
</body>
</html>
