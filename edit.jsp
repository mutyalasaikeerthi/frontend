<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Styles for the edit section */
        .edit {
            margin-bottom: 20px;
        }
        
        /* Styles for the form labels */
        label {
            display: inline-block;
            width: 80px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 200px;
            padding: 5px;
            background-color:lightgray;
            color:black;
            font-size: 20px;
            border:black;
        }

        /* Styles for the update button */
        input[type="submit"] {
            padding: 10px 20px;
            border:black;
            background-color:green;
            color:black;
            font-size: 20px;
            cursor: pointer;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            background-color:lightseagreen;
            color:whitesmoke;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        /* Styles for the admin homepage button */
        .adminhomepage {
            position: fixed;
            position: fixed;
            bottom: 20px;
            left: 20px;
            style:inline-flex;
        }
        
    </style>
    <title>Edit Fruit or Vegetable</title>
</head>
<body style="background-image: url('images/edit.png');background-size: cover;">
    
    <h2 style="color:red;font-size:46px">Edit Fruit or Vegetable </h2><div class="edit">
        <br><br>
    <form action="update.jsp" method="post">
        <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
        <label for="name" style="color:blue;font-size:29px;">Name:</label>
        <input type="text" id="name" name="name" value="<%= request.getParameter("name") %>" readonly><br><br>
        <label for="price" style="color:blue;font-size:26px;">Price:</label>
        <input type="text" id="price" name="price" value="<%= request.getParameter("price") %>" required><br><br>

        <input type="submit" value="Update">
    </form></div>
    <div class="adminhomepage">
        
        <button type="button" class="btn btn-info"><a href="adminhomepage.jsp" style="text-decoration: none;color:lightslategray;">adminhomepage</a></button>
        <button type="button" class="btn btn-info"><a href="vegdetails.jsp" style="text-decoration: none;color:lightslategray;">vegdetails</a></button>
    </div>
    
    
</body>
</html>
