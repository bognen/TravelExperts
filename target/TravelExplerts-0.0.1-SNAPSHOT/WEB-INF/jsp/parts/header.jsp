<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    The file included in other JSP pages   *** -->
<!-- ********************************************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
	<script src="js/header.js"></script>
  <!-- **************************************************** -->
    <!-- POP UP WINDOW FOR LOG IN -->
    <!-- **************************************************** -->
    <!-- CHECK IF USER WAS SENT FROM "ADD TO CART" CLICK -->
    <!-- **************************************************** -->
        <div id="loginModal" class="loginModal">
        <!-- Modal content -->
        <div class="login-modal-content">
            <span class="close" onclick="closeLoginModal();">&times;</span>
            <div id="loginh" class="text-center mb-4">Please, Sign In</div>
            <form action="login" method="post">
                <div class="row mb-2 mr-1">
                    <label class="col-sm-4 col-12 text-right login-label">Username: </label>
                    <input class="col-sm-8 col-12 text-left login-input" type="text" id="loginEmail" name="username" />
                </div>
                <div id="passwd-row" class="row mt-2 mr-1">
                    <label class="col-sm-4 col-12 text-right login-label">Password: </label>
                    <input class="col-sm-8 col-12 text-left login-input" type="password" id="loginPasswd" name="password" />
                </div>

                <div class="row justify-content-end mt-2 mr-1">
                    <input id="loginSbmtButton" type="submit" class="btn btn-secondary" value="Submit" />
                </div>
            </form>
        </div>
    </div>
    <!-- END HIDDEN DIV FOR LOGIN -->
    <!-- *************************************************** -->
<!--==============================header=================================-->
		<div class="very-top-line">
			<div class="container">
				<i class="fas fa-phone-square phone-icon ml-4"></i>1-800-555-3367
				<div class="float-right">
					<a class="login-register-icon mr-3" href="#" onclick="displayLogin()"><i class="fas fa-sign-in-alt header-icon"></i>LOGIN</a>
					<a class="login-register-icon ml-3" href="register"><i class="fas fa-user header-icon"></i>Register Now</a>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-md main-navbar">
			<div class="container">
				<!--   				
				<div>Here is Cookie - ${cookie['token'].value}</div>
				**********-->
				<a class="navbar-brand" href="/"><img src="images/travel-logo.png" alt="Your Happy Family"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarsExampleDefault">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active">
							<a class="nav-link menu-button" href="/#packagesTop">Destinations</a>
						</li>
						<li class="nav-item">
							<a class="nav-link menu-button" href="/#bookingTop">Book Now</a>
						</li>
						<li class="nav-item">
							<a class="nav-link menu-button" href="javascript:void(0)" onclick="notImplementedYet()">About</a>
						</li>
						<%
						Cookie[] cookies = request.getCookies();
						String token = null;
						
							if (cookies != null) {
							 for (Cookie cookie : cookies) {
							   if (cookie.getName().equals("traveltoken")) {
							     token = cookie.getValue();
							    }
							  }
							 }

						
					if(token != null) { %>						
				          <li class="nav-item dropdown">
				            <a class="nav-link dropdown-toggle menu-button" href="http://example.com" id="userdropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Your Name</a>
				            <div class="dropdown-menu" aria-labelledby="userdropdown">
				              <a class="dropdown-item" id="custbooking" href="">My Bookings</a>
				              <a class="dropdown-item" id="custinfo" href="">My Info</a>
				              <a class="dropdown-item" href="killtoken">Logout</a>
				            </div>
				          </li>
				           <script type="text/javascript">getUserName();</script>
					  <% }%>
					</ul>
				</div>
			</div>
			
		</nav>