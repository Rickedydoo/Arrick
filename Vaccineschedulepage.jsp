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

<title>Schedule Page</title>
<style>
input[type=submit] {
  background-color: black;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  width: 100%;
}
.container input {
  width: 100%;
  clear: both;
}


</style>

</head>
<body>

<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
      <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
      <a href="Vaccinemainpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Home</a>
      <a href="#" onclick="href='https://www.moh.gov.sg/covid-19/vaccination'" target="_blank" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Latest Government Updates</a>
      <a href="Vaccineschedulepage.jsp"class="w3-bar-item w3-button w3-padding-large w3-white">Schedule an appointment</a>
      <a href="Vaccinecheckpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check your slot information</a>
      <a href="Vaccinecheckinpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check In</a>
          <a href="Vaccineeditpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Edit Your Information</a>
    </div>
</div>
<center>
<div class "container">
<br></br>
<h1>Schedule</h1>
<h3>If your age is above 65, you'll be placed in a High Priority queue</h3>
<FORM ACTION="<%=request.getRequestURI() %>" METHOD="POST" onsubmit="alert('You have been successfully scheduled!');">
<% 
          String host = "localhost"; // Oracle Database Server
          String orasid = "xe"; // Oracle Database Instance
          String url= "jdbc:oracle:thin:@" + host + ":1521:" + orasid;
          String id = "system" ; // Your Oracle User login name
          String pass = "system"; // Your Oracle Password
          Connection connection = DriverManager.getConnection(url, id, pass);
          Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
          %>
          
First Name: <input type= "text" name=fname required>
<br></br>

Last Name: <input type= "text" name=lname required>
<br></br>

<label for="gender">Gender:</label>
<select name="gender" id="gender" required>
  <option value="Male">Male</option>
  <option value="Female">Female</option></select>
<br></br>

  <label for="age">Age:</label>
  <input type="number" id="age" name="age" min="18" max="125" required>
  <br></br>

Email: <input type= "text" name=email required>
<br></br>

Contact Number: <input type= "text" name=phone required>
<br></br>

NRIC: <input type= "text" name=nric required>
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
	
	 String PatFName = request.getParameter("fname");
	 String PatLName = request.getParameter("lname");
	 String PatGender = request.getParameter("gender");
	 int PatAge = Integer.parseInt(request.getParameter("age"));
	 String PatEmail = request.getParameter("email");
	 int PatPhone = Integer.parseInt(request.getParameter("phone"));
	 String PatNRIC = request.getParameter("nric");
	 String PatDate = request.getParameter("date");
	 String PatTime = request.getParameter("time");
	 String PatLocation = request.getParameter("location");
	 String PatPriority = "";
	 if(PatAge>64){
		 PatPriority = "High";
	 }
	 else{
		 PatPriority = "Normal";
	 }

	 String insertstmt = "INSERT INTO PATIENT(Pat_ID, Pat_FName, Pat_LName, Pat_Gender, Pat_Age, Pat_Email, Pat_PhoneNo, Pat_NRIC, Pat_Date, Pat_Time, Pat_Location, Pat_Status, Pat_Priority) VALUES (Pat_ID_seq.NEXTVAL,'"+PatFName+"','"+PatLName+"', '"+PatGender+"', '"+PatAge+"', '"+PatEmail+"', '"+PatPhone+"', '"+PatNRIC+"' ,TO_DATE('" + PatDate + "','YYYY-MM-DD'),'"+PatTime+"', '"+PatLocation+"', 'InComplete', '"+PatPriority+"')";
	 
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