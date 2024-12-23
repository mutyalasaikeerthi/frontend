<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
// Retrieve the admin email from the session attribute
String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fruits</title>
</head>
<body>
    <% 
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

            // Get form parameter values
            
            String fruitName = request.getParameter("fruit");
            float kg = Float.parseFloat(request.getParameter("quantity"));
            
            float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));

            // Prepare the INSERT statement
            String insertQuery = "INSERT INTO cart (username, name, quantity, total_amount) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, username);
            pstmt.setString(2, fruitName);
            pstmt.setFloat(3, kg);
            
            pstmt.setFloat(4, totalPrice);

            // Execute the INSERT statement
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                
            response.sendRedirect("fruits.jsp");
            } else {
                out.println("<h3>Failed to add fruit.</h3>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>An error occurred while adding the fruit: " + e.getMessage() + "</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>An unexpected error occurred while adding the fruit:</h3>");
            out.println("<pre>" + e.toString() + "</pre>");
        }
        
        finally {
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
