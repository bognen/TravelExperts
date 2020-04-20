/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The file prvides additional front end functionality for header which appears on all pages  
/*****************************************************/

var currentUrl = window.location.protocol+'//'+window.location.hostname+(location.port ? ':'+location.port: '');
var cookieToken = getCook('traveltoken');

// Function sends request and gets Customer's Info
$(document).ready(function(){
	$("#custinfo").click(function(event){
		event.preventDefault();
		event.stopPropagation();
	    $.ajax({
		    url: currentUrl+"/auth/customerinfo",
		    type: "POST",
		    headers: {'Authorisation': 'Check '+cookieToken},
			async: false,
		    success: function(data){
		    	redirectPost(currentUrl+'/personalinfo',data);
	    },
		    error: function(){
		      alert('Sorry, no token');
	    }
	    });
	});

});

/*****************************************************************/
//Function sends request and gets Bookings
$(document).ready(function(){	
	$("#custbooking").click(function(event){
		event.preventDefault();
		event.stopPropagation();
	    $.ajax({
	    	
		    url: currentUrl+"/auth/bookings",
		    type: "POST",
		    headers: {'Authorisation': 'Check '+cookieToken},
		    success: function(response){
		    	//alert("successfull request");	    	
		    	redirectBooking(currentUrl+"/mybookings", response);
	    },
		    error: function(){
		      alert('Sorry, no token');
	    }
	    });
	});
});

function redirectBooking(url, data) {
	
	    var form = document.createElement('form');
	    document.body.appendChild(form);
	    form.method = 'post';
	    form.action = url;
	    
	    for (i=0;i<data.length;i++){
	    	var division = document.createElement('div');
	    	form.appendChild(division);
		    for (var name in data[i]) {
		        var input = document.createElement('input');
		        input.type = 'hidden';
		        input.name = name;
		        input.value = data[i][name];
		        division.appendChild(input); 
		    }
	    }
    	form.submit();

	
}


/*********************************************************/

// Function gets users full name when he logged in
function getUserName(){
	//alert(token);
    $(document).ready(function(){
        $.ajax({
        url: currentUrl+"/customers/get_full_name",
        type: "POST",
        data: {token: cookieToken},
        success: function(data){
          // If insert is successful redirect to another function which will insert info 

            $('#userdropdown').html(data);
        },
        error: function(){
          alert('Sorry, probably session expired');
        }
        });
    });
}

// Function which creates invisible form on AJAX success response
function redirectPost(url, data) {
		
		//alert('You are in the secont function');
	
	    var form = document.createElement('form');
	    document.body.appendChild(form);
	    form.method = 'post';
	    form.action = url;
	    for (var name in data) {
	        var input = document.createElement('input');
	        input.type = 'hidden';
	        input.name = name;
	        input.value = data[name];
	        form.appendChild(input);
	    }
	    form.submit();
	}

// Function get cookie value based on its name
function getCook(cookiename) 
{
	// Get name followed by anything except a semicolon
	var cookiestring=RegExp(""+cookiename+"[^;]+").exec(document.cookie);
	// Return everything after the equal sign, or an empty string if the cookie name not found
	return decodeURIComponent(!!cookiestring ? cookiestring.toString().replace(/^[^=]+./,"") : "");
}