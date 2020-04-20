/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The file prvides additional front end functionality for specific package page  
/*****************************************************/

//***************************************************************
var currentUrl = window.location.protocol+'//'+window.location.hostname+(location.port ? ':'+location.port: '');
var packModal = document.getElementById('packModal');
var cookie = getCook("traveltoken");

// Function which checks if cookie exists
function cookieIsSet(){
	if(cookie==null || cookie==""){
		packModal.style.display = "block";
		return false;
	}else{
		return true;
	}
}

$(document).ready(function() {
	$("#addpackform").submit(function (event) {
		event.preventDefault();
		event.stopImmediatePropagation();
		$.ajax({
			type: "POST",
			url: currentUrl+'/bookings/addbooking',
			headers: {'Authorisation': cookie},
			data: $('#addpackform').serialize(),
			success: function(){
				//++++++++++++++++++++++++++++++++++++++++++++++
				// Here I can add another layer to retrieve data current user bookings
				//++++++++++++++++++++++++++++++++++++++++++++++
				//redirectPost('http://localhost:8080/mybookings',res);
				document.getElementById("custbooking").click();
			},
			error: function () {
				alert("Didn't make it to the server");
			}
		});
	});
})
//***************************************************************//

// When the user clicks on <span> (x), close the modal
function closeModal() {
  packModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == packModal) {
    packModal.style.display = "none";
  }
}

//**************************************************************//

// AJAX function which selects information about 
function packageDetail(packId){
	
	var imageArray = null;
	 $.ajax({
         url: currentUrl+'/pack/'+packId,
         method: 'GET',
         success: function(data){
        	 
        	 month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        	 
        	 var stDout = new Date(data.pkgStartDate);
        	 var endDout = new Date(data.pkgEndDate);
        	 
        	 var stString = stDout.getDate()+" "+month[stDout.getMonth()]+" "+stDout.getFullYear();
        	 var endString = endDout.getDate()+" "+month[endDout.getMonth()]+" "+endDout.getFullYear();
        	 
        	 var pkPrice = "$ "+data.pkgBasePrice;
        	 
        	 imageArray = data.pkgImageArray;
        	 
        	 // Insert retreived data into html elements
        	 $('#PkgId').val(data.packageId);
        	 $('#PkgImageArray').val(data.pkgImageArray);
        	 $('#PkgName').html(data.pkgName);
        	 $('#PkgPrice').html(pkPrice);
        	 $('#fromlabel').html(stString);
        	 $('#tolabel').html(endString);
        	 $('#PkgDesc').html(data.pkgDesc);
        	 
         },
         error: function(){
        	 alert('Tusooysia!');
         }
      });
	 
	 return imageArray;
}

// Below functions needed to provide carousel and proper layout

var gallery = document.querySelector('.gallery');
var galleryItems = document.querySelectorAll('.gallery-item');
var numOfItems = gallery.children.length;
var itemWidth = 23; // percent: as set in css

var featured = document.querySelector('.featured-item');

var leftBtn = document.querySelector('.move-btn.left');
var rightBtn = document.querySelector('.move-btn.right');
var leftInterval;
var rightInterval;

var scrollRate = 0.2;
var left;

function selectItem(e) {
	if (e.target.classList.contains('active')) return;

	featured.style.backgroundImage = e.target.style.backgroundImage;

	for (var i = 0; i < galleryItems.length; i++) {
		if (galleryItems[i].classList.contains('active'))
			galleryItems[i].classList.remove('active');
	}

	e.target.classList.add('active');
}

function galleryWrapLeft() {
	var first = gallery.children[0];
	gallery.removeChild(first);
	gallery.style.left = -itemWidth + '%';
	gallery.appendChild(first);
	gallery.style.left = '0%';
}

function galleryWrapRight() {
	var last = gallery.children[gallery.children.length - 1];
	gallery.removeChild(last);
	gallery.insertBefore(last, gallery.children[0]);
	gallery.style.left = '-23%';
}

function moveLeft() {
	left = left || 0;

	leftInterval = setInterval(function() {
		gallery.style.left = left + '%';

		if (left > -itemWidth) {
			left -= scrollRate;
		} else {
			left = 0;
			galleryWrapLeft();
		}
	}, 1);
}

function moveRight() {
	//Make sure there is element to the leftd
	if (left > -itemWidth && left < 0) {
		left = left  - itemWidth;

		var last = gallery.children[gallery.children.length - 1];
		gallery.removeChild(last);
		gallery.style.left = left + '%';
		gallery.insertBefore(last, gallery.children[0]);
	}

	left = left || 0;

	leftInterval = setInterval(function() {
		gallery.style.left = left + '%';

		if (left < 0) {
			left += scrollRate;
		} else {
			left = -itemWidth;
			galleryWrapRight();
		}
	}, 1);
}

function stopMovement() {
	clearInterval(leftInterval);
	clearInterval(rightInterval);
}

leftBtn.addEventListener('mouseenter', moveLeft);
leftBtn.addEventListener('mouseleave', stopMovement);
rightBtn.addEventListener('mouseenter', moveRight);
rightBtn.addEventListener('mouseleave', stopMovement);


//Start this baby up
(function init() {
	
	//var images = [
	//	'https://s3-us-west-2.amazonaws.com/forconcepting/800Wide50Quality/car.jpg',
	//	'https://s3-us-west-2.amazonaws.com/forconcepting/800Wide50Quality/city.jpg',
	//	'https://s3-us-west-2.amazonaws.com/forconcepting/800Wide50Quality/deer.jpg',
	//	'https://s3-us-west-2.amazonaws.com/forconcepting/800Wide50Quality/flowers.jpg',
	//];
	
	var packId = document.getElementById('idenifier').innerHTML;
	var imagesArray = getImages(packId);
	var images = imagesArray.split(';');
	//Set Initial Featured Image
	featured.style.backgroundImage = 'url(' + images[0] + ')';

	//Set Images for Gallery and Add Event Listeners
	for (var i = 0; i < galleryItems.length; i++) {
		galleryItems[i].style.backgroundImage = 'url(' + images[i] + ')';
		galleryItems[i].addEventListener('click', selectItem);
	}
})();


//AJAX function which selects information about 
function getImages(packId){
	
	var imageArray = null;
 
	$.ajax({
         url: currentUrl+'/pack/'+packId,
         method: 'GET',
         async: false,
         success: function(data){   	 
        	 imageArray = data.pkgImageArray;    	   	 
         },
         error: function(){
        	 alert('Tusooysia!');
         }
      });
	 
	 return imageArray;
}

//Function get cookie value based on its name
function getCook(cookiename) 
{
	// Get name followed by anything except a semicolon
	var cookiestring=RegExp(""+cookiename+"[^;]+").exec(document.cookie);
	// Return everything after the equal sign, or an empty string if the cookie name not found
	return decodeURIComponent(!!cookiestring ? cookiestring.toString().replace(/^[^=]+./,"") : "");
}