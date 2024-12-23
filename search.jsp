<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vegetable Search</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <h1>Vegetable Search</h1>
    
    
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
        <% 
        String searchKeyword = request.getParameter("search");
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
            
            String selectQuery = "SELECT NAME,PRICE FROM FRESHVEG WHERE NAME LIKE '%" + search + "%'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(selectQuery);
            
            while (rs.next()) {
                String name = rs.getString("NAME");
                float price = rs.getFloat("PRICE");
                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= price %></td>
                </tr>
                <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        %>
        </tbody>
    </table>
</body>
</html>
