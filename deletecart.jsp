<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Fruit or Vegetable</title>
</head>
<body>
  
    <% 
        String name = request.getParameter("name");
        
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

            // Prepare DELETE query
            String deleteQuery = "DELETE FROM cart WHERE name = ?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setString(1, name);

            // Execute the DELETE query
            int rowsAffected = pstmt.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected > 0) {
               response.sendRedirect("mycart.jsp");
            } else {
                out.println("<p>No matching Fruit or Vegetable found.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            if (pstmt != null) {
                try {
                    pstmt.close();
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
    
    
</body>
</html>
