<%@page import="java.sql.*"%>



<%
String uname=request.getParameter("uname");
String pswd=request.getParameter("pwd");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
PreparedStatement stmt = con.prepareStatement("SELECT * FROM register WHERE USERNAME=? AND PASSWORD=?");
stmt.setString(1, uname);
stmt.setString(2, pswd);
ResultSet rs = stmt.executeQuery();

// If a matching record is found, redirect the user to the home page

if (rs.next()) {
    // Valid credentials
    // Redirect to a success page or perform other actions
   \
    response.sendRedirect("user.jsp");
 } else {
    // Invalid credentials
    // Redirect to an error page or display an error message
   out.println("Invalid credentials!!");
 }
} catch (Exception e) {
 // Handle any exceptions
 e.printStackTrace();
}




%>

