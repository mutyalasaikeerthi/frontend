<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title><style>
    .vegetable {
        position: absolute;
        bottom: 20px;
        right: 20px;
        display:inline-flex;
    }
    
</style>
</head>
<body>
<%
String username = (String) session.getAttribute("username");
Float totalPrice = (Float) session.getAttribute("totalPrice");
String orderId = UUID.randomUUID().toString();
String vegname = null;
Float quantityinkg = null;
Float pricetotal = null;

if (username == null || totalPrice == null) {
    // Handle the case when username or totalPrice is not available
    // Redirect or display an error message
    out.println("<h2>Error: Required session attributes not found.</h2>");
} else {
    // Proceed with database operations
    Connection conn = null;
    PreparedStatement selectStmt = null;
    PreparedStatement insertStmt = null;
    PreparedStatement deleteStmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

        // Retrieve data from cart table
        String selectQuery = "SELECT name, SUM(quantity) AS total_quantity, SUM(total_amount) AS total_price FROM cart WHERE username = ? GROUP BY name";
        selectStmt = conn.prepareStatement(selectQuery);
        selectStmt.setString(1, username);
        rs = selectStmt.executeQuery();

        // Iterate over the ResultSet and insert data into buy table
        while (rs.next()) {
            String name = rs.getString("name");
            Float quantity = rs.getFloat("total_quantity");
            Float price = rs.getFloat("total_price");

            vegname = name;
            quantityinkg = quantity;
            pricetotal = price;

            // Insert data into buy table
           
            String insertQuery = "INSERT INTO buy (username, order_date, totalprice, item_name, item_price, quantity,orderid) VALUES (?, ?, ?, ?, ?, ?,?)";
            insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, username);
            insertStmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));
            insertStmt.setFloat(3, totalPrice);
            insertStmt.setString(4, vegname);
            insertStmt.setFloat(5, pricetotal);
            insertStmt.setFloat(6, quantityinkg);
            insertStmt.setString(7,orderId);
            insertStmt.executeUpdate();
        }

        // Delete records from cart table
        String deleteQuery = "DELETE FROM cart WHERE username = ?";
        deleteStmt = conn.prepareStatement(deleteQuery);
        deleteStmt.setString(1, username);
        deleteStmt.executeUpdate();

        // Display order confirmed message
        out.println("<h2>Order Confirmed!</h2>");
        out.println("<p>Thank you for your purchase.</p>");
        %>
        <p>Order ID:<%= orderId %></p>
        <% 
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error occurred during database operation.</h2>");
       
        

    } finally {
        // Close database resources
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (selectStmt != null) {
            try {
                selectStmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (insertStmt != null) {
            try {
                insertStmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (deleteStmt != null) {
            try {
                deleteStmt.close();
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
}
%>
</body>

<div class="vegetable">
        
    <button type="button" class="btn btn-info"><a href="vegetable.jsp" style="text-decoration: none;color:lightslategray;">vegetable</a></button>
    <button type="button" class="btn btn-info"><a href="user.jsp" style="text-decoration: none;color:lightslategray;">userpage</a></button>
    <button type="button" class="btn btn-info"><a href="fruits.jsp" style="text-decoration: none;color:lightslategray;">fruits</a></button>
    <button type="button" class="btn btn-info"><a href="myorders.jsp" style="text-decoration: none;color:lightslategray;">myorders</a></button>
</div>
</html>
