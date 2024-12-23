<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Fruit or Vegetable</title>
</head>
<body>
    <% 
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

            // Get the form data
            String name = request.getParameter("name");
        
            String price = request.getParameter("price");

            // Execute UPDATE query to update the fruit or vegetable details
            String updateQuery = "UPDATE FRESHVEG SET  price = ? WHERE name = ?";
            stmt = conn.prepareStatement(updateQuery);
            
            stmt.setString(1, price);
            stmt.setString(2, name);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("vegdetails.jsp");
            } else {
                out.println("<h2>Update failed.</h2>");
            }
        } catch (Exception e) {
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
</body>
</html>
