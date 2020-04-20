/*****************************************************
Dima Bognen, Jonathan Pirca, Abel Rojas and Manish Sudani
The file fills out the information about the package upon Learn More Click 
/*****************************************************/

var currentUrl = window.location.protocol+'//'+window.location.hostname+(location.port ? ':'+location.port: '');

function getAllPackages(){
	 $.ajax({
         url: currentUrl+'/pack/all',
         method: 'GET',
         dataType: 'json',
         success: function(data){

                 $.each(data, function(i, item) {
                     // Append our result into our page
                     $('#mainbanner').append('<div class="grid_4">'+
                    	 '<div class="banner">'+
							'<img src="images/'+item.pkgVertImage+'" alt="">'+
							'<form action="/packageDetails" method="POST">'+
								'<div class="label">'+
									'<input name="packageId" type="hidden" value="'+item.packageId+'">'+
									'<div class="title">'+item.pkgName+'</div>'+
									'<div class="price">from<span>$ '+item.pkgBasePrice +'</span></div>'+
									'<button type="submit" class="learnmorebutton">LEARN MORE</button>'+
								'</div>'+
							'</form>'+
						'</div>'+
					'</div>');
               });

         }
      });
}