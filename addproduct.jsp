<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% 
    String type = request.getParameter("type");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String image = request.getParameter("image");
    out.println(image);
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

        
        String insertQuery = "INSERT INTO FRESHVEG (type,name,price,image) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(insertQuery);
        stmt.setString(1, type);
        stmt.setString(2, name);
        
        
        stmt.setString(3, price);
        stmt.setString(4, image);
        int rowsInserted = stmt.executeUpdate();
        
        if (rowsInserted > 0) {
            response.sendRedirect("vegdetails.jsp");
        } else {
            throw new SQLException("Failed to insert details.");
        }
    } 
    catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
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
