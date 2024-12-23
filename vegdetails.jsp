<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fruits and Vegetables</title>
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
        .adminhomepage {
            position: absolute;
            top: 20px;
            right: 20px;
        }

    </style>
</head>
<body>
    <center><h2>Fruits & Vegetables</h2></center>
    <div class="adminhomepage">
        
        <button type="button" class="btn btn-info"><a href="adminhomepage.jsp" style="text-decoration: none;color:lightslategray;">adminhomepage</a></button>
    </div>
   
    <% 
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");

            // Execute SELECT query
            String selectQuery = "SELECT * FROM FRESHVEG";
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
                <p><%= name %></p>
                <p>₹<%= price %></p>
                <p><a href='edit.jsp?name=<%= name %>&price=<%= price %>'>Edit</a></p>
                <p><a href='delete.jsp?name=<%= name %>'>Delete</a></p>
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
