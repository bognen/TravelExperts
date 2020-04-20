<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    The file displays user's personal info *** -->
<!-- ********************************************************************** -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	    <%@ include file="parts/links.jsp" %>
	    <%@ include file="parts/scripts.jsp" %>
	    <link href="/css/PersonalInfo.css" rel="stylesheet" />
	    <script src="/js/PersonalInfo.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Personal Information</title>
</head>
<body>
	<%@ include file="parts/header.jsp" %>
	<% 
	String custId = request.getParameter("customerId"); 
	String custFirstName = request.getParameter("custFirstName"); 
	String custLastName = request.getParameter("custLastName"); 
	String custEmail = request.getParameter("custEmail"); 
	String custPhone = request.getParameter("custBusPhone"); 
	String custAddress = request.getParameter("custAddress"); 
	String custCity = request.getParameter("custCity"); 
	String custPostal = request.getParameter("custPostal"); 
	String custProv = request.getParameter("custProv"); 
	String custCountry = request.getParameter("custCountry"); 
	%>
    <div class="container">
        <div class="row">
            <div class="col-5">
                <div class="row">
                    <h2 class="col-9 text-center pt-2">Account Info</h2>
                    <button id="editbutton" type="button" class="col-3 btn btn-link" onclick="activateFields()">
                        Edit
                    </button>
                </div>
                <form id="personalinfo" class="dl-horizontal mb-5" method="post" action="">
                    <input id="custid" name="customerId" style="display:none"
                           value="<%= custId%>"/>
                    <div class="row">
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Fist Name </label>
                            <input id="custfname" name="custFirstName" class="custinfo-input"
                                   value="<%= custFirstName%>" disabled required/>
                        </div>
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Last Name</label>
                            <input id="custlname" name="custLastName" class="custinfo-input"
                                   value="<%= custLastName%>" disabled required/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Email</label>
                            <input id="custemail" name="custEmail" class="custinfo-input"
                                   value="<%= custEmail%>" disabled required/>
                        </div>
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Phone</label>
                            <input id="custphone" name="custBusPhone" class="custinfo-input"
                                   value="<%= custPhone%>" disabled/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 div-group">
                            <label class="custinfo-label">Address </label>
                            <input id="custaddress" name="custAddress" class="custinfo-input"
                                   value="<%= custAddress%>" disabled required/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6 div-group">
                            <label class="custinfo-label">City </label>
                            <input id="custcity" name="custCity" class="custinfo-input"
                                   value="<%= custCity%>" disabled required/>
                        </div>
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Province </label>
                            <input id="custprov" name="CustProv" class="custinfo-input"
                                   value="<%= custProv%>" disabled required />
                            <label id="province-error" class="error-label">Province is not valid</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Postal Code </label>
                            <input id="custpostal" name="custPostal" class="custinfo-input"
                                   value="<%= custPostal%>" disabled required />
                            <label id="postal-error" class="error-label">Postal code is not valid</label>
                        </div>
                        <div class="col-6 div-group">
                            <label class="custinfo-label">Country </label>
                            <input id="custcountry" name="CustCountry" class="custinfo-input"
                                   value="<%= custCountry%>" disabled required/>
                        </div>
                    </div>
                    <button id="updatebutton" type="button" class="btn btn-info mt-4 mb-3 float-right" onclick="updateCustomer()">Update</button>
                </form>
            </div>
            <div class="col-7">
                <img id="sideimage" src="/images/per-info.jpg" />
            </div>
        </div>
    </div>
    <%@ include file="parts/footer.jsp" %> 
    <script src="js/PersonalInfo.js"></script>
</body>
</html>