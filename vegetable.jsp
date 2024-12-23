<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
// Retrieve the admin email from the session attribute
String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Fruits</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        .container {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            width: 250px; /* Adjust the width as needed */
            margin-bottom: 20px;
        }

        .container-row {
            display: inline-flex;
            justify-content: center;
        }

        .container img {
            width: 150px; /* Adjust the image width as needed */
            height: auto;
        }

        .container .details {
            margin-top: 10px;
            text-align: center;
        }

        .container p {
            margin: 5px 0;
        }
        .cart-icon {
            position: fixed;
            top: 20px;
            right: 20px;
        }
        .vegetable {
            position: absolute;
            top: 20px;
            right: 20px;
            display:inline-flex;
        }
    </style>
    <script>
        function calculateTotalPrice(name) {
            var kgInput = document.getElementById("kg-" + name);
            var amountInput = document.getElementById("amount-" + name);
            var totalPriceInput = document.getElementById("totalPrice-" + name);

            var kg = parseFloat(kgInput.value);
            var amount = parseFloat(amountInput.value);

            var totalPrice = kg * amount;
            totalPriceInput.value = totalPrice.toFixed(2);
        }
    </script>
</head>
<body>
    <center><h2>Vegetables</h2></center>
    <div class="vegetables">
        
        <button type="button" class="btn btn-info"><a href="fruits.jsp" style="text-decoration: none;color:lightslategray;">fruits</a></button>
        
        <button type="button" class="btn btn-info"><a href="myorders.jsp" style="text-decoration: none;color:lightslategray;">myorders</a></button>
        <button type="button" class="btn btn-info"><a href="user.jsp" style="text-decoration: none;color:lightslategray;">userpage</a></button>
    </div>
    <a href="mycart.jsp" class="cart-icon"><i class="fas fa-shopping-cart" style="font-size: 40px;"></i></a><br>

    <% 
    
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

            // Execute SELECT query
            String selectQuery = "SELECT * FROM FRESHVEG WHERE type='Vegetable'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(selectQuery);

            // Iterate over the ResultSet and display the data
            while (rs.next()) {
                String img = rs.getString("image");
                String name = rs.getString("name");
                String price = rs.getString("price");
            
    %>
    
    <div class="container-row">
        <div class="container">
            <img src='<%= img %>' width="300px" height="300px">
            <div class="details">
                
                <form action="cart.jsp?">
                    <input type="text" name="fruit" value="<%= name %>" readonly><br><br>
                <input type="number" id="kg-<%= name %>" name="quantity" placeholder="Kilograms" step="0.5"><br><br>
                <input type="button" value="Calculate" onclick="calculateTotalPrice('<%= name %>')"><br><br>
                <input type="number" id="amount-<%= name %>" name="amount" value=<%= price %> readonly><br><br>
                <input type="text" id="totalPrice-<%= name %>" name="totalPrice" readonly><br><br>
                <input type="submit" value="add to cart"></form>
            </div>
        </div>
    </div>
    
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
