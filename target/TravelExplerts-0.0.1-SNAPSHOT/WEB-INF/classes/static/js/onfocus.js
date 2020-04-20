//***************************************************************************//
//** Function which shows registration form hint in certain spot**//
//***************************************************************************//
function displayDesc(id){

  //First: Retreive position of active input field
  var thisInput = document.getElementById(id);
  
  //Second: we display hint in certain position
  var activePar = retreivePar(id);
  document.getElementById(activePar).style.display = "block";
}

//***************************************************************************//
//** Function which hides Registration Form hint on blur**//
//***************************************************************************//
function hideDesc(id) {
  var activePar = retreivePar(id);
  document.getElementById(activePar).style.display = "none";
}

//***************************************************************************//
//** Function which helps to retreive ID a paragraph**//
//***************************************************************************//
function retreivePar(id) {
  var activePar;
  switch (id) {
    case "fname":
      activePar = "textForFname";
      break;
    case "lname":
      activePar = "textForLname";
      break;
    case "username":
      activePar = "textForPwd";
      break;
    case "password":
      activePar = "textForCpwd";
      break;
    case "email":
      activePar = "textForEmail";
      break;
    case "phone":
      activePar = "textForPhone";
      break;
    case "age":
      activePar = "textForAge";
      break;
    case "dob":
      activePar = "textForDOB";
      break;
    case "address":
      activePar = "textForAddress";
      break;
    case "city":
      activePar = "textForCity";
      break;
    case "postal":
      activePar = "textForPostal";
      break;
    case "prov":
      activePar = "textForProv";
      break;
    case "country":
      activePar = "textForCountry";
      break;
    default:
      alert("Something went wrong");
      break;
  }
  return activePar;
}
