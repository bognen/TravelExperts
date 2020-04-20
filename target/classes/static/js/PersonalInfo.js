/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The provides additional functionality for My Info page
/*****************************************************/
var currentUrl = window.location.protocol+'//'+window.location.hostname+(location.port ? ':'+location.port: '');

// Function which PUT informaition into Database
function updateCustomer(){
  if(validation()){
    $.ajax({
    url: currentUrl+"/customers/update_customer",
    type: "PUT",
    data: $("#personalinfo").serialize(),
    success: function(){
      //window.location.replace("regconfirmation.html");
      alert('success');
    },
    error: function(){
      alert('Sorry, something went wrong with our server');
    }
    });
  }
}

// Function to activate taggeted fields
function activateFields() {

    // Display Update button
    document.getElementById('updatebutton').style.display = "block";

    var listOfFields = [];

    var custfname = document.getElementById('custfname');
    listOfFields.push(custfname);
    var custlname = document.getElementById('custlname');
    listOfFields.push(custlname);
    var custemail = document.getElementById('custemail');
    listOfFields.push(custemail);
    var custaddress = document.getElementById('custaddress');
    listOfFields.push(custaddress);
    var custcity = document.getElementById('custcity');
    listOfFields.push(custcity);
    var custprov = document.getElementById('custprov');
    listOfFields.push(custprov);
    var custpostal = document.getElementById('custpostal');
    listOfFields.push(custpostal);
    var custcountry = document.getElementById('custcountry');
    listOfFields.push(custcountry);
    var custphone = document.getElementById('custphone');
    listOfFields.push(custphone);

    var i;
    for (i=0; i < listOfFields.length; i++) {

        listOfFields[i].removeAttribute("Disabled");
        listOfFields[i].style.color = "#000000";
        listOfFields[i].style.backgroundColor = "#ffffb3";
        listOfFields[i].style.border = "2px #80b3ff solid";
    }

}

// Function to validate input against regex
function validation() {

    // Get field needed for validation
    var custprov = document.getElementById('custprov');
    var custpostal = document.getElementById('custpostal');

    // Validate postal code
    var postalReg = /^[A-Z]\d[A-Z]\d[A-Z]\d$/;
    var provRegex = /^(N[BLSTU]|[AMN]B|[BQ]C|ON|PE|SK)$/;

    if (!postalReg.test(custpostal.value)) {
        custpostal.style.borderColor = "#ff1a1a";
        document.getElementById('postal-error').style.display = "block";
        return false;
    } else if(!provRegex.test(custprov.value)){
        custprov.style.borderColor = "#ff1a1a";
        document.getElementById('province-error').style.display = "block";
        return false;
    } else {
        return true;
    }
}
