<%
    // Retrieve the admin email from the session attribute
    String adminusername = (String) session.getAttribute("adminusername");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hi! Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image:url(images/adminhomepage.jpg);
            background-repeat: no-repeat;
            background-size:1100px;
        }
        
        h2 {
            color: #333;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        
        .btn-info {
            background-color: #2196F3;
        }
    </style>
</head>
<body>
    <h2>Hi, <%= adminusername %></h2>
    <button type="button" class="btn btn-info"><a href="add.html" style="text-decoration: none;color: white;">Add</a></button><br/><br/>
    <button type="button" class="btn btn-info"><a href="vegdetails.jsp" style="text-decoration: none;color: white;">Fruits and Vegetables</a></button><br/><br>
    <button type="button" class="btn btn-info"><a href="orders.jsp" style="text-decoration: none;color: white;">Order Details</a></button>
    <button type="button" class="btn btn-info"><a href="fresh.html" style="text-decoration: none;color: white;">Logout</a></button>
</body>

</html>
