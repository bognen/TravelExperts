/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The file prvides additional front end functionality for login pop up 
/*****************************************************/

var loginModal = document.getElementById("loginModal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
function displayLogin() {
	loginModal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
function closeLoginModal() {
	loginModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == loginModal) {
    	loginModal.style.display = "none";
    }
}