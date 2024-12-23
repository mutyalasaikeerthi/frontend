<html>
    <head>
        <title>FRESHVEGI</title>
       
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <style>
          *{
    margin:0px;
    padding:0px;
    box-sizing:border-box;
}

.veg{
    text-align:center;
    color:gray;
    background-color:azure;
    list-style:none;
}
.veg ul{
    display:inline-flex;
    list-style:none;
}
.veg ul li{
    padding:10px;
    font-style: italic;
    font-size:18px;
    color:black;
    width:180px;
}
.veg ul li:hover{
    background-color: palevioletred;
   border-radius:40px;
}
.dropdown {
    position: relative;
    display:inline-block;
  }

  /* Style for the dropdown menu button */
  .dropdown .dropdown-button {

    color:blue;
    padding: 10px;
    font-size: 18px;
    border: none;
    cursor: pointer;
  }

  /* Style for the dropdown menu content */
  .dropdown .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
  }

  /* Style for the dropdown menu links */
  .dropdown .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
  }

  /* Style for the dropdown menu links on hover */
  .dropdown .dropdown-content a:hover {
    background-color: #f1f1f1;
  }

  /* Show the dropdown menu content when hovering over the dropdown button */
  .dropdown:hover .dropdown-content {
    display: block;
  }


        </style>
        </head>
        <%
    // Retrieve the admin email from the session attribute
    String username = (String) session.getAttribute("username");
%>
       
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">FRESHVEGGIES</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="user.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        
        <li class="nav-item active">
          <a class="nav-link" href="fruits.jsp">Fruits</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="vegetable.jsp">Vegetables</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="myorders.jsp">Myorders</a>
        </li>
        
      </ul>
      
        <form action="address.jsp">
          <input type="text" name="address">
          <input type="submit">
        </form>
      
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link disabled" href="#">Hi!<%= username %></a>
          </li>
          
          <li class="nav-item active">
            <a href="mycart.jsp" class="cart-icon"><i class="fas fa-shopping-cart" style="font-size: 30px;"></i></a><br>

          </li>
          <li class="nav-item active">
            <a class="nav-link" href="fresh.html">Logout</a>
          </li>
        </ul>

      </form>
    </div>
  </nav>
  <img src="images/fresh.jpg" width="100%" height="75%"><br><br>
  <div class="container-fluid" style="background-color: rgb(226, 220, 220);color:rgb(7, 7, 6)"><br><br>
    <div class="row">
      <div class="col-1"></div>
      <div class="col-10">
      Fruits and vegetables are an essential part of a nutritious diet. They contain vitamins, minerals, fiber, and other nutrients.
      </div>
    </div><br><br>
    <div class="row">
      
      <div class="col-1">

      </div>
      <div class="col-3">
        <p>Contact Us</p>
        <p>9181234567</p>
        <p>freshvegi@gmail.com</p>
        
      </div>
      <div class="col-3">
        <p>Quick Links</p>
        <p><a href="login.html">Login</a></p>
      </div>
      <div class="col-4">
        <h4>FRESHVEGI</h4>
      </div>
      <div class="col-1"></div>
    </div><br><br>
  </div>


</body>
</html>