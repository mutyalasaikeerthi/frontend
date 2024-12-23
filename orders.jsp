<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart Details</title>
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
        .adminhomepage {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }

    </style>
</head>
<body>
    <%
    // Retrieve the admin email from the session attribute
    String username = (String) session.getAttribute("username");
%>
    <table>
        <th>Order Id</th>
        <th>Order Date</th>
        <th>Username</th>
        <th>Address</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total Price</th>
    

<%


    // Proceed with database operations
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");

        
        String selectQuery = "SELECT * FROM buy, register WHERE buy.username = register.username";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(selectQuery);

        // Iterate over the ResultSet and display the data
        while (rs.next()) {
            String orderid = rs.getString("orderid");
            String order_date = rs.getString("order_date");
            String address = rs.getString("address");
            String item_name= rs.getString("item_name");
            Float item_price = rs.getFloat("item_price");
            Float quantity = rs.getFloat("quantity");
            Float totalprice = rs.getFloat("totalprice");
            %>
            <tr>
                <td><%= orderid %></td>
                <td><%= order_date %></td>
                <td><%= username %></td>
                <td><%= address %></td>
                <td><%= item_name %></td>
                <td><%= quantity %></td>
                <td><%= item_price %></td>
                <td><%= totalprice %></td>

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
%>

</body>
</html>
