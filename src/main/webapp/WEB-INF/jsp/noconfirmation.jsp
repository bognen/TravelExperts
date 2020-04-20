<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    The file displays when user tries to sing using unconfirmed email  *** -->
<!-- ********************************************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	    <%@ include file="parts/links.jsp" %>
	    <%@ include file="parts/scripts.jsp" %>
	    <link rel="stylesheet" type="text/css" href="css/emailconfirmation.css" />
<title>Email is not confirmed</title>
</head>
<body>
  <%@ include file="parts/header.jsp" %>

  <div class="container main">
    <div class="row">
      <div class="col-3"></div>
      <div class="col-6">
        <div class="card blue-card">
          <h3 class="card-title">Verify your email</h3>
          <!--White card inside --->
          <div class="card white-card">
              <i class="fas fa-exclamation-triangle fa-10x truck-icon"></i>
              <div class="card-body">
                <div class="card-text">
                  We sent you a verification email. Please, check your email.
                </div>
                <div class="card-question">
                  Email didn't arrive?
                </div>
          </div>
          </div>
          <!---->
        </div>
      </div>
      <div class="col-3"></div>
    </div>
  </div>
	
	<%@ include file="parts/footer.jsp" %> 
</body>
</html>