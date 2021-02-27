<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.Statement"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Check In</title>

<style>
input[type=submit] {
  background-color: white; /* Green */
  border: 2px solid #008CBA;
  color: black;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}


input[type=submit]:hover {
  background-color: #008CBA;
  color: white;
}

</style>

</head>
<body>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-red w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="Vaccinemainpage.jsp"class="w3-bar-item w3-button w3-padding-large w3-hover-white">Home</a>
    <a href="#" onclick="href='https://www.moh.gov.sg/covid-19/vaccination'" target="_blank" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Latest Government Updates</a>
    <a href="Vaccineschedulepage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Schedule an appointment</a>
    <a href="Vaccinecheckpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check your slot information</a>
    <a href="Vaccinecheckinpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white">Check In</a>
    <a href="Vaccineeditpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Edit Your Information</a>
  </div>
  
<center>
<h1 style="color:blue;">Check In</h1>

<FORM ACTION="<%=request.getRequestURI() %>" METHOD="POST" onsubmit="alert('Thank you for checking in!');">
<% 
          String host = "localhost"; // Oracle Database Server
          String orasid = "xe"; // Oracle Database Instance
          String url= "jdbc:oracle:thin:@" + host + ":1521:" + orasid;
          String id = "system" ; // Your Oracle User login name
          String pass = "system"; // Your Oracle Password
          Connection connection = DriverManager.getConnection(url, id, pass);
          Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
          %>

Name: <input type= "text" name=name required>
<br></br>

NRIC: <input type= "text" name=nric required>
<br></br>

<input type ="submit" value="Check In">
</FORM>

</center>

<%	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	 Enumeration parameters = request.getParameterNames();
	 
	 if(parameters.hasMoreElements()) {
	
	 String PatNRIC = request.getParameter("nric");

	 String insertstmt = "Update Patient set Pat_Status='Completed' where Pat_NRIC='"+PatNRIC+"'";
	 
	 out.println(insertstmt);
	 
	 try {
	 statement.executeUpdate(insertstmt);
	 } catch (SQLException sqle) {
	 out.println(sqle);
	 }
	 }
	 
statement.close();
connection.close();
	 %>
<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">  
  <!--<div class="w3-xlarge w3-padding-32">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
 </div>-->
 <p>For more updates on the COVID-19 situation in Singapore, visit <a href="https://www.moh.gov.sg/covid-19" target="_blank"> THIS LINK.</a></p>
</footer>-->
</body>
</html>