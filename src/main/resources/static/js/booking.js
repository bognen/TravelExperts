/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The file prvides additional front end functionality for bokings page  
/*****************************************************/

var bookingModal = document.getElementById("bookingModalBox");
var currentUrl = window.location.protocol+'//'+window.location.hostname+(location.port ? ':'+location.port: '');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
function displayDeleteConfirmation(pkgName,bookingId) {
	var message = document.getElementById('bookpopupmessage');
	var confirmBtn = document.getElementById('confirmbtn');
	
	message.innerHTML = "Do you want to delete <b>"+pkgName+"</b> from the cart?";
	confirmBtn.setAttribute('onclick','sentDelRequest('+bookingId+');');
	
	bookingModal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
function closeBookModal() {
	bookingModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == bookingModal) {
	  bookingModal.style.display = "none";
  }
}

function sentDelRequest(bookId){
	
    $.ajax({
        type     : "DELETE",
        url      : currentUrl+'/bookings/deletebooking',
        //headers  : {'Authorisation': cookie},
        async    : false,
        data     : {bookingId: bookId},
        success  : function(data) {
            //alert("Made it!");
            document.getElementById('custbooking').click();
        },
        error	: function(){
        	alert("Didn't make it to the server");
        }
    });
    	
}