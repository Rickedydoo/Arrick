<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
<title>Vaccination Schedule iNTUition</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-red w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="Vaccinemainpage.jsp"class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
    <a href="#" onclick="href='https://www.moh.gov.sg/covid-19/vaccination'" target="_blank" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Latest Government Updates</a>
    <a href="Vaccineschedulepage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Schedule an appointment</a>
    <a href="Vaccinecheckpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check your slot information</a>
    <a href="Vaccinecheckinpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Check In</a>
    <a href="Vaccineeditpage.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Edit Your Information</a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
    <a href="https://youtu.be/9kQ2GtvDV3s" class="w3-bar-item w3-button w3-padding-large">Link 4</a>
  </div>
</div>

<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding:128px 16px">
  <h1 class="w3-margin w3-jumbo">Singapore Vaccination Program</h1>
  <p class="w3-xlarge">Get vaccinated today!</p>   
  <button onclick="location.href='Vaccineschedulepage.jsp'" class="w3-button w3-black w3-padding-large w3-large w3-margin-top">Schedule an Appointment</button>   
  <!--<button id = "Schedule" class="w3-button w3-black w3-padding-large w3-large w3-margin-top" data-toggle="modal" data-target="#myModal">Schedule an Appointment</button>-->
</header>


<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>About the vaccine</h1>
      <h5 class="w3-padding-32">COVID-19 vaccines help protect our bodies from the virus by building immunity against it. The vaccines do this by helping the body produce T-lymphocytes and 
      B-lymphocytes that will fight against the virus.</h5>

      <p class="w3-text-grey">The process of vaccination can cause a few symptoms such as fever but they are not severe and it is part of the process of building immunity to the virus.
Vaccination is declared safe by the Ministry of Health and it is highly recommended for the safety of all residents of Singapore.</p>
    </div>

    <div class="w3-third w3-center">
        <iframe width="420" height="315" src="https://www.youtube.com/embed/UYEzGMF57qI">
        </iframe>
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <!--<i class="fa fa-coffee w3-padding-64 w3-text-red w3-margin-right"></i>-->
    </div> 

    <div class="w3-twothird">
      <h1>Vaccine availability</h1>
      <!--<h5 class="w3-padding-32">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h5>-->

      <p class="w3-text-grey">Do you want to know if you are elgible to receive the vaccine? Just fill in the form and click submit to find out!</p>
    </div>
  </div>

  <form action="Vaccineschedulepage2.jsp" onsubmit="if(document.getElementById('agree').checked & document.getElementById('agree2').checked & document.getElementById('agree3').checked & document.getElementById('agree4').checked) 
{ 
    window.alert('you are eligible for the vaccine');
    return false;
} 
else { 
    alert('Sorry! you are not eligible for the vaccine'); 
return false; }">

<input type="checkbox" name="checkbox" value="check" id="agree" /> I am aged 18 and older
<br>
<input type="checkbox" name="checkbox" value="check" id="agree2" /> I am not currently pregnant
<br>
<input type="checkbox" name="checkbox" value="check" id="agree3" /> I do not have a history of allergies with other vaccines
<br>
<input type="checkbox" name="checkbox" value="check" id="agree4" /> I am not currently ill with fever or other symptoms
<br></br>
<button type ="submit" name ="submit" class="w3-button w3-black w3-padding-large w3-large w3-margin-top" value="location.href='schedule.html';">Check availability</button>   

<!--<input type="submit" name="submit" value="Next"/>-->




</form>

</div>

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

<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html>
