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

<title>Check you slot</title>
</head>
<body>
<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
      <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
      <a href="Vaccinemainpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Home</a>
      <a href="#" onclick="href='https://www.moh.gov.sg/covid-19/vaccination'" target="_blank" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Latest Government Updates</a>
      <a href="Vaccineschedulepage.jsp"class="w3-bar-item w3-button w3-padding-large w3-hover-white">Schedule an appointment</a>
      <a href="Vaccinecheckpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-white">Check your slot information</a>
      <a href="Vaccinecheckinpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check In</a>
          <a href="Vaccineeditpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Edit Your Information</a>
    </div>
</div>

<% 
          String host = "localhost"; // Oracle Database Server
          String orasid = "xe"; // Oracle Database Instance
          String url= "jdbc:oracle:thin:@" + host + ":1521:" + orasid;
          String id = "system" ; // Your Oracle User login name
          String pass = "system"; // Your Oracle Password
          Connection connection = DriverManager.getConnection(url, id, pass);
          Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
          %>

<center>
<br></br>
<br></br>
<h2>Please enter your NRIC you've used to shedule to check your slot</h2>
<FORM ACTION="<%=request.getRequestURI() %>" METHOD="POST">
NRIC: <input type= "text" name=nric required>
<br></br>

	<input type ="submit" value="Submit">
	</form>
	
<TABLE BORDER="5" CELLPADDING="3" CELLSPACING="0">

<TR><TD><B>First Name</B></TD>
<TD><B>Last Name</B></TD>
<TD><B>Gender</B></TD>
<TD><B>Age </B></TD>
<TD><B>Email</B></TD>
<TD><B>Phone Number</B></TD>
<TD><B>NRIC</B></TD>
<TD><B>Date Booked</B></TD>
<TD><B>Time Slot Booked</B></TD>
<TD><B>Location Chosen</B></TD>
<TD><B>Status</B></TD>
<TD><B>Priority</B></TD>
</TR>


</center>

<% 
	 Class.forName("oracle.jdbc.driver.OracleDriver");

	 Enumeration parameters = request.getParameterNames();
	 
	 String PatNRIC = request.getParameter("nric");

	 ResultSet columns = statement.executeQuery("SELECT * FROM Patient where Pat_NRIC='"+PatNRIC+"'");
	 while (columns.next())
	 {
	String FName = columns.getString("Pat_FName");
	String LName = columns.getString("Pat_LName");
	String Gender = columns.getString("Pat_Gender");
	int Age = columns.getInt("Pat_Age");
	String Email = columns.getString("Pat_Email");
	int Phone = columns.getInt("Pat_PhoneNo");
	String NRIC = columns.getString("Pat_NRIC");
	String Date = columns.getString("Pat_Date");
	String Time = columns.getString("Pat_Time");
	String Location = columns.getString("Pat_Location");
	String Status = columns.getString("Pat_Status");
	String Priority = columns.getString("Pat_Priority");

	%>
	 <TR><TD> <%=FName%> </TD><TD> <%=LName%> </TD><TD> <%=Gender%> </TD> <td><%=Age%> </td> <td><%=Email%></td> <td><%=Phone%></td> <td><%=NRIC%></td> <td><%=Date%></td> <td><%=Time%></td> <td><%=Location%></td> <td><%=Status%></td> <td><%=Priority%></td></TR>
	<%
	 }
	 
	  columns.close();
 connection.close();
%>
</TABLE>

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