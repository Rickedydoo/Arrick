<%@ page import="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.sql.Statement"%>
<html>
<head>
<title>Edit Information</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
    <a href="Vaccinecheckinpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check In</a>
    <a href="Vaccineeditpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white">Edit Your Information</a>
  </div>
  
<center>
<FORM ACTION="<%=request.getRequestURI() %>" METHOD="POST" onsubmit="alert('Your Information have been edited accordingly!');">
<% 
          String host = "localhost"; // Oracle Database Server
          String orasid = "xe"; // Oracle Database Instance
          String url= "jdbc:oracle:thin:@" + host + ":1521:" + orasid;
          String id = "system" ; // Your Oracle User login name
          String pass = "system"; // Your Oracle Password
          Connection connection = DriverManager.getConnection(url, id, pass);
          Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
          %>
   <br></br>
   <h1>Edit Information</h1>
   <h2>Please enter the NRIC you've used to book for the schedule to edit</h2>
NRIC: <input type= "text" name=nric required>
<br></br>      
  
Email: <input type= "text" name=email required>
<br></br>

Contact Number: <input type= "text" name=phone required>
<br></br>


Time Scheduled: <input type ="date" name=date required>
<br></br>

<label for="time">Location:</label>
<select name="time" id="time" required>
  <option value="3am">3am</option>
  <option value="10am">10am</option>
  <option value="11am">11am</option>
  <option value="4pm">4pm</option>
  <option value="6pm">6pm</option>
  <option value="11pm">11pm</option></select>
<br></br>

<label for="location">Location:</label>
<select name="location" id="location" required>
  <option value="Tanjong Pagar Community Club">Tanjong Pagar Community Club</option>
  <option value="Raffles Medical Vaccination Centre - Airport">Raffles Medical Vaccination Centre - Airport</option>
  <option value="Woodlands Galaxy Community Club">Woodlands Galaxy Community Club</option>
  <option value="Taman Jurong Community Club">Taman Jurong Community Club</option></select>
<br></br>

	
	<input type ="submit" value="Submit">
	</form>
</center>

<%	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	 Enumeration parameters = request.getParameterNames();
	 
	 if(parameters.hasMoreElements()) {
	
	 String PatNRIC = request.getParameter("nric");
	 String PatEmail = request.getParameter("email");
	 int PatPhone = Integer.parseInt(request.getParameter("phone"));
	 String PatDate = request.getParameter("date");
	 String PatTime = request.getParameter("time");
	 String PatLocation = request.getParameter("location");

	 
	 String insertstmt = "Update Patient set Pat_Email='"+PatEmail+"', Pat_PhoneNo='"+PatPhone+"', Pat_Date = TO_DATE('" + PatDate + "','YYYY-MM-DD'), Pat_Time ='"+PatTime+"', Pat_Location = '"+PatLocation+"' where Pat_NRIC='"+PatNRIC+"'";
	 
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