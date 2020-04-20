/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The file prvides additional front end functionality for register page page  
/*****************************************************/
var currentUrl = window.location.protocol+'//'+window.location.hostname+(location.port ? ':'+location.port: '');

function submition(btnname, myForm) {
   
   var validFields = formValidation();
   if (validFields==true){
	 
	 // If all fields are valid will try to insert data into Customers 
     $(document).ready(function(){
        $.ajax({
        url: currentUrl+"/customers/insert_customer",
        type: "POST",
        async: false,
        data: $("#regForm").serialize(),
        success: function(data){
          // If insert is successful redirect to another function which will insert info 
          userInfo(data);
        },
        error: function(){
          alert('Sorry, something went wrong with our server');
        }
        });
    });
  }
 }

// Function inserts data to Users 
function userInfo(custId){
	
    $(document).ready(function(){
        $.ajax({
        url: currentUrl+"/users/adduser",
        type: "POST",
        data: {
        	username: $("#username").val(),
        	password: $("#password").val(),
        	email: $("#email").val(),
        	customerId: custId
        },
        success: function(data){
          // If insert is successful redirect to dead end page which asks to confirm email 
          // in this case 'data' is returned string ProvidedEmail
          alert('Success! Email was sent. Email is - '+data);
          location.href =currentUrl+'/emailconfirmation?email='+data;
        },
        error: function(){
          alert('Sorry, something went wrong with our server. Users');
        }
        });
    });
}


//***************************************************************************//
//** Function validates if all required fields filled and then lunches PO validation**//
//***************************************************************************//
function formValidation() {

 
  // var email = document.forms["regform"]["email"].value;

  if (!formFilled()){
      var formValid = false;
      return formValid;
  } else if (!provIsSelected()) {
      var formValid = false;
      return formValid;
      
  } else if (!validatePO()) {
      var formValid = false;
      return formValid;
  } else{
      var formValid = true;
      return formValid;
  }
}

//***************************************************************************//
//** Function to checks if all required fields were filled **//
//***************************************************************************//
function formFilled(){
	
	var formFilled = true;
	
	// Create array and add all required elementsto it
    var requiredElements = [];
	var fname = document.getElementById('fname');
	requiredElements.push(fname);
	var lname = document.getElementById('lname');
	requiredElements.push(lname);
	var user = document.getElementById('username');
	requiredElements.push(user);
	var pass = document.getElementById('password');
	requiredElements.push(pass);
	var email = document.getElementById('email');
	requiredElements.push(email);
	var phone = document.getElementById('phone');
	requiredElements.push(phone);
	var address = document.getElementById('address');
	requiredElements.push(address);
	var city = document.getElementById('city');
	requiredElements.push(city);
	var country = document.getElementById('country');
	requiredElements.push(country);
	
	// loop through the array and check if it is filled
	requiredElements.forEach(function(el){
		if(el.value==null || el.value==""){
			  el.style.borderColor = "#ff1a1a";
		      errorMessage.innerHTML = "Required field " + el.placeholder + " is not filled";
		      errorMessageBody.style.display = "block";
		      formFilled = false;
		      return formFilled;
		}
	})
	
    return formFilled;
}

//***************************************************************************//
//** Function to checks if Province was selected  **//
//***************************************************************************//
function provIsSelected(){
	  
	  provinceSelected = false;
	  var province = document.getElementById('prov');
	  var prov = province.options[province.selectedIndex].value;
	
	if (prov==null || prov==""){
		
      province.style.borderColor = "#ff1a1a";
      errorMessage.innerHTML = "Required field \"Province\" is not filled";
      errorMessageBody.style.display = "block";
      provinceSelected = false;
      return provinceSelected;
      }
	else{
		provinceSelected = true;
	}
	
	return provinceSelected
}


//***************************************************************************//
//** Function to validate Postal Code  **//
//***************************************************************************//
function validatePO() {

  var reg = /^[A-Z]\d[A-Z]\d[A-Z]\d$/;
  if (!reg.test(document.getElementById('postal').value)) {
	document.getElementById('postal').style.borderColor = "#ff1a1a";
    errorMessage.innerHTML = "The postal you entered is not valid";
    errorMessageBody.style.display = "block";
    return false;
  } else{
    return true;
   }
  }


//***************************************************************************//
//** Variables which will be used in functions below**//
//***************************************************************************//
var errorMessage = document.getElementById('errorMessageText');
var errorMessageBlock = document.getElementById('errorMessageBody');

//***************************************************************************//
//** Function to close Error Message **//
//***************************************************************************//
function closeErrorMessage() {
    errorMessageBody.style.display = "none";
}
