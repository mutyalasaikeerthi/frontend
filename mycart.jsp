<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart Details</title>
    <script src="https://kit.fontawesome.com/3db56b5611.js" crossorigin="anonymous"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
        .vegetable {
            position: absolute;
            bottom: 20px;
            right: 20px;
            display:inline-flex;
        }
    </style>
</head>
<body>
    <table>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Delete</th>
<%
String username = (String) session.getAttribute("username");

if (username == null) {
    // Handle the case when username is not available
    // Redirect or display an error message
} else {
    // Proceed with database operations
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

        // Execute SELECT query with GROUP BY
        String selectQuery = "SELECT name, SUM(quantity) AS total_quantity, SUM(total_amount) AS total_price FROM cart WHERE username='" + username + "' GROUP BY name";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(selectQuery);

        // Iterate over the ResultSet and display the data
        while (rs.next()) {
            String name = rs.getString("name");
            Float quantity = rs.getFloat("total_quantity");
            Float price = rs.getFloat("total_price");
            %>
            <tr>
                <td><%= name %></td>
                <td><%= quantity %></td>
                <td><%= price %></td>
                <th><a href="deletecart.jsp?name=<%= name %>">delete</i></a></th>
            </tr>
            <%
        }

        // Calculate total price
        String sQuery = "SELECT SUM(total_amount) AS total FROM cart WHERE username='" + username + "'";
        rs = stmt.executeQuery(sQuery);
        if (rs.next()) {
            
            Float totalPrice = rs.getFloat("total");
            session.setAttribute("totalPrice",totalPrice);
            %>
            <tr>
                <td colspan="2" align="right">Total Price:</td>
                <td><%= totalPrice %></td>
            </tr>
            <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
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
}
%>
</table><br><br>
<button type="button" class="btn btn-info"><a href="buy.jsp" style="text-decoration: none;color:skyblue;">BUY</a></button><br><br><br>
<div class="vegetable">
        
    <button type="button" class="btn btn-info"><a href="vegetable.jsp" style="text-decoration: none;color:lightslategray;">vegetable</a></button>
    <button type="button" class="btn btn-info"><a href="user.jsp" style="text-decoration: none;color:lightslategray;">userpage</a></button>
    <button type="button" class="btn btn-info"><a href="fruits.jsp" style="text-decoration: none;color:lightslategray;">fruits</a></button>
    <button type="button" class="btn btn-info"><a href="myorders.jsp" style="text-decoration: none;color:lightslategray;">myorders</a></button>
</div>


</body>
</html>
