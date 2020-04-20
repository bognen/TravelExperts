<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    Registration information form  *** -->
<!-- ********************************************************************** -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
		<!--The line below links font awesome-->
		<link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
		<!--<link rel="stylesheet" type="text/css" href="styles.css" /> -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="css/regformStyles.css" />
		<link href="bootstrap/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

	    <%@ include file="parts/links.jsp" %>
	    <%@ include file="parts/scripts.jsp" %>
	    
	    <script type="text/javascript" src="js/onfocus.js"></script>
	    <script type="text/javascript" src="js/regMain.js"></script>
	    <script type="text/javascript" src="js/Submition.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Registration Form</title>
	</head>
<body>
	<%@ include file="parts/header.jsp" %>
	<br />
	  <!--************************************************************************************-->
    <!--Part responsibe for PopUp Window. Initially hidden ----------------------------------->
    <!--************************************************************************************-->
      <!-- The Submit PopUp Box -->
      <div id="popupbox" class="popupbox">
        <!-- Modal content -->
        <div class="popup-content">
          <span class="close" id="closespan" onclick="closeFunction()">&times;</span>
          <p id="popuptext">Will be changed to pop up text</p>
          <div class="row">
            <div class="form-group col-md-6">
              <button type="button" id="y-answer">Y</button>
            </div>
            <div class="form-group col-md-6">
              <button type="button" id="n-answer">N</button>
            </div>
          </div>
        </div>
      </div>
    <!--************************************************************************************-->
    <!--End of the part responsibe for PopUp Window------------------------------------------->
    <!--************************************************************************************-->
    <!--Hidden Div for registartion Error Messagges ------------------------------------------>
    <!--************************************************************************************-->
    <div id="errorMessageBody">
      <div id="errorMessageContent">
        <span class="close" id="closeError" onclick="closeErrorMessage()">&times;</span>
        <p id="errorMessageText"> </p>
      </div>
    </div>
    <!--************************************************************************************-->
    <!--End of Div for registartion Error Messagges------------------------------------------->
    <!--************************************************************************************-->
    <div class="row">
    <div class="col-2"></div>
    <div class="col-8">
    <div class="wholegroup">
  	  <h4 id="formHeader">Fill your information</h4>
  		<form name="regform" id="regForm" method="post" action="">
    <!--************************************************************************************-->
    <!--  First and Last Names --------------------------------------------------------------->
    <!--************************************************************************************-->
  		  <div class="form-row">
  			<div class="form-group col-md-6">
  				<label>First Name</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fas fa-user fa" aria-hidden="true"></i></span>
  					<input type="text" class="form-control" name="custFirstName" id="fname" onfocus="displayDesc(this.id)"
                    onblur="hideDesc(this.id)" placeholder="Enter your First Name"/>                
  				</div>
  				<label class="onfocuspar"  id="textForFname">Enter your first name only</label>
  			</div>
  			<div class="form-group col-md-6">
  				<label>Last Name</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
  					<input type="text" class="form-control" name="custLastName" id="lname" onfocus="displayDesc(this.id)"
                    onblur="hideDesc(this.id)" placeholder="Enter your Last Name"/>
  				</div>
  				<label class="onfocuspar"  id="textForLname">Enter your last name only</label>
  			</div>
  		  </div>
      <!--************************************************************************************-->
      <!--  Username and Password fields ------------------------------------------------>
      <!--************************************************************************************-->
  		  <div class="form-row">
  			<div class="form-group col-md-6">
  				<label>Username</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fa fa-unlock fa" aria-hidden="true"></i></span>
  					<input type="text" class="form-control" name="username" id="username" onfocus="displayDesc(this.id)"
                   onblur="hideDesc(this.id)" placeholder="User name"/>
  				</div>
  				<label class="onfocuspar"  id="textForPwd">Create user name</label>
  			</div>
  			<div class="form-group col-md-6">
  				<label>Password</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fa fa-unlock fa" aria-hidden="true"></i></span>
  					<input type="password" class="form-control" name="password" id="password" onfocus="displayDesc(this.id)"
                   onblur="hideDesc(this.id)" placeholder="Enter your Password"/>
  				</div>
  				<label class="onfocuspar"  id="textForCpwd">Create your password. It should contain both letter and numbers</label>
  			</div>
  		  </div>
      <!--************************************************************************************-->
      <!--  Email and Phone Number ------------------------------------------------------------->
      <!--************************************************************************************-->
  		  <div class="form-row">
  			<div class="form-group col-md-6">
  				<label>Email</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
  					<input type="text" class="form-control" name="custEmail" id="email" onfocus="displayDesc(this.id)"
                   onblur="hideDesc(this.id)" placeholder="Enter your Email"/>
  				</div>
  				<label class="onfocuspar"  id="textForEmail">Email must be in format example@site.com</label>
  			</div>
  			<div class="form-group col-md-6">
  				<label>Phone Number</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fa fa-at fa" aria-hidden="true"></i></span>
  					<input type="text" class="form-control" name="custBusPhone" id="phone" onfocus="displayDesc(this.id)"
                   onblur="hideDesc(this.id)" placeholder="Enter your Phone Number"/>
  				</div>
  				<label class="onfocuspar"  id="textForPhone">Phone number must contain numbers only</label>
  			</div>
  		  </div>
      <!--************************************************************************************-->
      <!--  Address line ----------------------------------------------------------------------->
      <!--************************************************************************************-->
  		  <div class="form-row">
  			<div class="form-group col-md-12">
  				<label>Street Address</label>
  				<div class="input-group">
  					<span class="input-group-addon"><i class="fa fa-address-card fa" aria-hidden="true"></i></span>
  					<input type="text" class="form-control" name="custAddress" id="address" onfocus="displayDesc(this.id)"
                   onblur="hideDesc(this.id)" placeholder="Enter your Address"/>
  				</div>
  				<label class="onfocuspar"  id="textForAddress">Street address including apartment number</label>
  			</div>
  		  </div>
      <!--************************************************************************************-->
      <!--  City and Postal Code---------------------------------------------------------------->
      <!--************************************************************************************-->
          <div class="form-row">
          <div class="form-group col-md-6">
            <label>City</label>
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-city fa" aria-hidden="true"></i></span>
              <input type="text" class="form-control" name="custCity" id="city" onfocus="displayDesc(this.id)"
                     onblur="hideDesc(this.id)" placeholder="City"/>
            </div>
            <label class="onfocuspar"  id="textForCity">Enter city name starting with Capital letter</label>           
          </div>
          <div class="form-group col-md-6">
            <label>Postal Code</label>
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
              <input type="text" class="form-control" name="custPostal" id="postal" onfocus="displayDesc(this.id)"
                     onblur="hideDesc(this.id)" placeholder="Postal Code"/>
            </div>
            <label class="onfocuspar"  id="textForPostal">Postal Code should be in format: A1A1A1</label>
          </div>
          </div>
      <!--************************************************************************************-->
      <!--  Province and Country ---------------------------------------------------------------->
      <!--************************************************************************************-->
          <div class="form-row">
          <div class="form-group col-md-6">
            <label>Province</label>
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-city fa" aria-hidden="true"></i></span>
              <select class="form-control" name="CustProv" id="prov" onfocus="displayDesc(this.id)"
                     onblur="hideDesc(this.id)">
                <option value="">Select Province...</option>
				<option value="AB">Alberta</option>
				<option value="BC">British Columbia</option>
				<option value="MB">Manitoba</option>
				<option value="NB">New Brunswick</option>
				<option value="NL">Newfoundland and Labrador</option>
				<option value="NS">Nova Scotia</option>
				<option value="ON">Ontario</option>
				<option value="PE">Prince Edward Island</option>
				<option value="QC">Quebec</option>
				<option value="SK">Saskatchewan</option>
				<option value="NT">Northwest Territories</option>
				<option value="NU">Nunavut</option>
				<option value="YT">Yukon</option>
			</select>		
              
              <!-- input type="text" class="form-control" name="CustProv" id="prov" onfocus="displayDesc(this.id)"
                     onblur="hideDesc(this.id)" placeholder="AB"/> -->
            </div>
            <label class="onfocuspar"  id="textForProv">Two characters</label>
          </div>
          <div class="form-group col-md-6">
            <label>Country</label>
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
              <input type="text" class="form-control" name="CustCountry" id="country" onfocus="displayDesc(this.id)"
                     onblur="hideDesc(this.id)" placeholder="Country"/>
            </div>
            <label class="onfocuspar"  id="textForCountry">Enter country name</label>
          </div>
          </div>
    <!--*********************************************************************************************************************************-->
    <!-- Two button on the bottom of the form (in both cases types defined as "button" as we trigger proper function onEvent listener) ---->
    <!--*********************************************************************************************************************************-->
        <div class="form-row">
          <div class="form-group col-md-6">
            <button type="button" name="submitbtn" id="submitbtn" value="Register" onclick="submition(this.name, this.form)">Submit</button>  <!--return validate(this.form) -->
          </div>
          <div class="form-group col-md-6">
            <button type="button" name="resetbtn" id="resetbtn" value="Reset" onclick="displayPopUp(this.name)">Reset</button>
          </div>
        </div>
  		</form>
	  </div>
	  </div>
	  <div class="col-2"></div>
	</div>  
    <!--************************************************************************************-->
    <!--  JavaScript---------------------------------------------------------------->
    <!--************************************************************************************-->
    <script type="text/javascript" src="js/regMain.js"></script>
    <script type="text/javascript" src="js/onfocus.js"></script>
    <script type="text/javascript" src="js/Submition.js"></script>
    <%@ include file="parts/footer.jsp" %> 
	</body>
</html>