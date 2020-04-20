<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    The file displays info abut specific package  *** -->
<!-- ********************************************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	    <%@ include file="parts/links.jsp" %>
	    <%@ include file="parts/scripts.jsp" %>
	    <script src="js/packages.js"></script>
<title>Packages</title>
</head>
<body onload="getAllPackages();">
<%@ include file="parts/header.jsp" %>
<div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
			<div class="container_12">
				<div id="mainbanner" class="banners">
					<!-- File content is formed dynamically via Package.js file -->
				</div>
			</div>
		</div>
<%@ include file="parts/footer.jsp" %> 
<script src="js/packages.js"></script>
</body>
</html>