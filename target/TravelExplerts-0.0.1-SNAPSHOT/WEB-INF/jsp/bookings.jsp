<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    The file displays personilised booking info  *** -->
<!-- ********************************************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   		
   		<%@ include file="parts/links.jsp" %>
		<link href="/css/bookings.css" rel="stylesheet" />
   		
	    <%@ include file="parts/scripts.jsp" %>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="js/booking.js"></script>
	    
	    <%@ page import="java.util.ArrayList" %>
	    <%@ page import="java.sql.Date" %>
	    <%@ page import="java.text.DecimalFormat" %>
	    <%@ page import="com.travelexperts.model.Booking" %>
	    
	<% 
	
	// Get all values from post request
	String[] pkgNames = request.getParameterValues("pkgName");
	String[] customerIds = request.getParameterValues("customerId");
	String[] pkgIds = request.getParameterValues("packageId");
	String[] pkgStartDates = request.getParameterValues("packStartDate");
	String[] pkgEndDates = request.getParameterValues("packEndDate");
	String[] pkgImages = request.getParameterValues("pkgImageArray");
	String[] bookingIds = request.getParameterValues("bookingId");
	String[] bookingNos = request.getParameterValues("bookingNo");
	String[] pkgPrices = request.getParameterValues("pkgBasePrice");
	String[] tripTypes = request.getParameterValues("tripType");
	String[] bookingDates = request.getParameterValues("bookingDate");
	String[] travelerCounts = request.getParameterValues("travelerCount");
	
	// Declare array list of objects of booking class
	ArrayList<Booking> bookings = new ArrayList<Booking>();
	
	// Get obtained information and store it a list of obects
	if (pkgNames!=null){
		for(int i=0;i<pkgNames.length;i++){
			
			Booking book = new Booking();
			book.setBookingId(Integer.valueOf(bookingIds[i]));
			book.setBookingDate(java.sql.Date.valueOf(bookingDates[i]));
			book.setBookingNo(bookingNos[i]);
			book.setTravelerCount(Integer.valueOf(travelerCounts[i]));
			book.setTripType(tripTypes[i]);
			book.setCustomerId(Integer.valueOf(customerIds[i]));
			book.setPackageId(Integer.valueOf(pkgIds[i]));
			book.setPackStartDate(java.sql.Date.valueOf(pkgStartDates[i]));
			book.setPackEndDate(java.sql.Date.valueOf(pkgEndDates[i]));
			book.setPkgName(pkgNames[i]);
			book.setPkgBasePrice(Double.valueOf(pkgPrices[i]));
			
			String allImage = pkgImages[i];
			String[] imgs = allImage.split("\\;");
			book.setPkgImageArray(imgs[0]);
			
			bookings.add(book);	
		}
	}
	
	Double total = 0.00;
	int traveler = 0;
	DecimalFormat formatter = new DecimalFormat("###,###.00");
	%>
<title>Booking Details</title>
</head>
<body>
	<%@ include file="parts/header.jsp" %>
		  <!-- ************************************************************************ -->
          <!-- *** Modal popup *** -->
          <div id="bookingModalBox" class="bookingmodal">
			  <!-- Modal content -->
			  <div class="bookingmodal-content">
			    <span class="close" onclick="closeBookModal()">&times;</span>
			    <div id="bookpopupmessage" class="mb-4"></div>
			    <div class="row">
			    	<div class="col-6">
			    		<button id="confirmbtn" type="button" class="btn btn-secondary modalbtn">Confirm</button>
			    	</div>
			    	<div class="col-6">
			    		<button type="button" class="btn btn-secondary modalbtn" onclick="closeBookModal()">Decline</button>
			    	</div>
			    </div>
			  </div>
			</div>
          <!-- ************************************************************************ -->
          <div class="container main-container">
            <div class="row">
              <div class="col-9">
                <h2 class="mb-4">Booking Details: </h2>
              
              <%for ( Booking book : bookings){ %>
                 <div class="container bg-light my-3 book-container">
                    <div class="row">
                      <div class="col-4 imageCol">
                        <div><img class="imageContainer" src="<%=book.getPkgImageArray() %>" /></div>
                      </div>
                      <div class="col-6">
                      <!-- Package name -->
	                      <h4 class="pkgName"> <%= book.getPkgName()%></h4>
	                        <div class="row"> </div>
	                        <!-- Date From-->
	                        <div class="row date-from">
	                          <div class="col-4 date-from"><label class="font-weight-bold date-from">From: </label></div>
	                          <div class="col-8 date-from"><%= book.getPackStartDate()%></div>
	                        </div>         
	                        <!-- Date To-->
	                        <div class="row date-to">
	                            <div class="col-4 date-to"><label class="font-weight-bold date-to">To: </label></div>
	                            <div class="col-8 date-to"><%= book.getPackEndDate()%></div>
	                        </div> 
	
	                        <div class="row"> </div>
	
	                        <!-- Number of Travelers -->
	                        <div class="row travCount">
	                            <div class="col-8"><label>Number of Travelers: </label></div>
	                            <div class="col-4"> <%= book.getTravelerCount() %></div>
	                        </div> 
	
	                        <div class="row"> </div>
	                        <div class="row"> </div>
	
	                        <!-- Date when Package was booked -->
	                        <div class="row orderDate">
	                            <div class="col-8"><label>Date Ordered: </label></div>
	                            <div class="col-4"><%= book.getBookingDate()%></div>
	                        </div> 
	                  </div>
                      <div class="col-2 priceSide">
                        <div class="align-self-stretch price-container">
                        <!-- Price-->
                          <div class="row">
                              <div class="col-12 price">$ <%= String.format("%.0f",book.getPkgBasePrice()) %></div>
                          </div> 

                          <!-- Per Person Label-->
                          <div><label class="per-person">Per Person</label></div> 
                          <!-- BUTTONS -->
                          <div class="row change-button-row">                           
                            <div class="col-6 text-center">
                              <button type="button" class="btn">
                                  <i class='fas fa-trash-alt foicon' title='Delete' 
                                  onclick='displayDeleteConfirmation("<%=book.getPkgName() %>","<%=book.getBookingId() %>")'></i></button>
                                </div>
                             <div class="col-6 text-center">
                                <button type="button" class="btn">
                                  <i class='fas fa-pen-square foicon' title='Edit'></i></button>
                              </div>
                            </div>
                          </div>
                        </div>
                        
                      </div>
                    </div>
              <div style="display:none"><%= total = total + book.getPkgBasePrice()*book.getTravelerCount() %></div>
              <div style="display:none"><%= traveler = traveler + book.getTravelerCount() %></div>
            <%} %>
           
           </div>
           <!-- Right hand side column -->
           <div class="col-3">         
             <div  class="total-price">
               <button type="button" class="btn btn-secondary place-order">Place your order</button>
               
                 <!-- Order Summary -->
                 <div class="order-summary mt-1">
                   <div style="font-weight:bold;">Order Summary: </div>
                   <!-- Travel Packages price -->
                   <div class="row price-row">
                       <div class="col-6">Travel Packages:</div>
                       <div class="col-6">
                           <label id="lblTravelPkg" class="float-right"><%=formatter.format(total) %></label>
                       </div>
                   </div>
                   <%
                   	Double visaFee = Double.valueOf(traveler*150);
                   	Double beforeTax = total + traveler*150;
                   	Double gst = (total + traveler*150)*0.05;
                   	Double mainTotal = (total + traveler*150)*1.05;
                   %>
                   <!-- Travel Fees -->
                   <div class="row price-row">
                       <div class="col-6">Visa Fees:</div>
                       <div class="col-6">
                           <label id="lblVisaFees" class="float-right"><%=formatter.format(visaFee) %></label>
                       </div>
                   </div>
               </div><!-- End of Order Summary -->

               <!-- GST Calcualtion -->
               <div class="order-summary">                   
                 <!-- Amount Before Tax -->
                 <div class="row price-row">
                     <div class="col-6">Total before tax:</div>
                     <div class="col-6">
                         <label id="lblAmountBeforeTax" class="float-right"><%=formatter.format(beforeTax) %></label>
                     </div>
                 </div>
                 <!-- GST -->
                 <div class="row price-row">
                     <div class="col-6">GST:</div>
                     <div class="col-6">
                         <label id="lblGST" class="float-right"><%=formatter.format(gst) %></label>
                     </div>
                 </div>
               </div><!-- End of Order Summary -->
               
               <!--Order Total -->
               <div class="row price-row order-total">
                   <div class="col-5" style="font-size:1.2vw;">Order Total: </div>
                   <div class="col-7">
                     <label id="lblOrderTotal" class="float-right">$ <%=formatter.format(mainTotal) %></label></div>
               </div>
             </div>
           </div>
         </div>
 	   </div>
 	<script src="js/booking.js"></script>
    <%@ include file="parts/footer.jsp" %>
</body>
</html>