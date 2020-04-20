<!-- ********************************************************************** -->
<!-- ***    Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani    *** -->
<!-- ***    The main page  *** -->
<!-- ********************************************************************** -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<title>Travel Experts</title>
		<meta charset="utf-8">
		<meta name="format-detection" content="telephone=no" />
		
		<%@ include file="parts/links.jsp" %>
		<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">

		<%@ include file="parts/scripts.jsp" %>
		
		<script>
			$(document).ready(function(){
			jQuery('#camera_wrap').camera({
				loader: false,
				pagination: false ,
				minHeight: '444',
				thumbnails: false,
				height: '48.375%',
				caption: true,
				navigation: true,
				fx: 'mosaic'
			});
			/*carousel*/
			var owl=$("#owl");
				owl.owlCarousel({
				items : 2, //10 items above 1000px browser width
				itemsDesktop : [995,2], //5 items between 1000px and 901px
				itemsDesktopSmall : [767, 2], // betweem 900px and 601px
				itemsTablet: [700, 2], //2 items between 600 and 0
				itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
				navigation : true,
				pagination : false
				});
			$().UItoTop({ easingType: 'easeOutQuart' });
			});
		</script>
</head>
  <body class="page1" id="top">
	<%@ include file="parts/header.jsp" %>
		<div class="slider_wrapper">
			<div id="camera_wrap" class="">
				<div data-src="images/slide.jpg">
					<div class="caption fadeIn">
						<h2>European Cities Tour</h2>
						<div class="price">
							FROM
							<span>$3000</span>
						</div>
						<a href="javascript:void(0)" onclick="notImplementedYet()">LEARN MORE</a>
					</div>
				</div>
				<div data-src="images/slide1.jpg">
					<div class="caption fadeIn">
						<h2>Polynesian Paradise</h2>
						<div class="price">
							FROM
							<span>$2000</span>
						</div>
						<a href="javascript:void(0)" onclick="notImplementedYet()">LEARN MORE</a>
					</div>
				</div>
				<div data-src="images/slide2.jpg">
					<div class="caption fadeIn">
						<h2>Venice</h2>
						<div class="price">
							FROM
							<span>$1600</span>
						</div>
						<a href="javascript:void(0)" onclick="notImplementedYet()">LEARN MORE</a>
					</div>
				</div>
			</div>
		</div>
		<div id="packagesTop"></div>
<!--==============================Content=================================-->
		<div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
			<div class="container_12">
				<div class="grid_4">
					<div class="banner">
						<img src="images/ban_img1.jpg" alt="">
						<div class="label">
							<div class="title">Barcelona</div>
							<div class="price">FROM<span>$ 1000</span></div>
							<a href="javascript:void(0)" onclick="notImplementedYet()">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="images/page3_img2.jpg" alt="" class="titleimage">
						<div class="label">
							<div class="title">KYIV</div>
							<div class="price">FROM<span>$ 1.500</span></div>
							<a href="javascript:void(0)" onclick="notImplementedYet()" >LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="images/ban_img3.jpg" alt="">
						<div class="label">
							<div class="title">PARIS</div>
							<div class="price">FROM<span>$ 1.600</span></div>
							<a href="javascript:void(0)" onclick="notImplementedYet()">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div>
					<button type="button" class="btn btn-primary btn-block">
						<a id="explAllBtn" href="packages">EXPLORE ALL PACKAGES</a>
					</button>
				</div>
				<div  id="bookingTop" class="clear"></div>
				<div class="grid_6">
					<h3>Booking Form</h3>
					<form id="bookingForm">
						<div class="row">
							<label class="col-5 my-auto">Package: </label>
							<div class="col-7">
								<select class="tmSelect auto w-100" data-class="tmSelect tmSelect2" data-constraints="">
									<option class="tmInput">Select package...</option>
								</select>
							</div>
						</div>


						<div class="clear"></div>
						<strong>Start date:</strong>
						<label class="tmDatepicker">
							<input type="text" name="Check-in" placeHolder='10/05/2019' data-constraints="@NotEmpty @Required @Date">
						</label>
						<div class="clear"></div>
						<strong>End date:</strong>
						<label class="tmDatepicker">
							<input type="text" name="Check-out" placeHolder='20/05/2019' data-constraints="@NotEmpty @Required @Date">
						</label>
						<div class="m-3"></div>
					
							<p>Trip Type</p>
							<div class="form-check">
								<div class="form-check-inline">
							        <input type="radio" class="form-check-input" id="radio1" name="optradio" value="L" checked>
							         <label class="form-check-label" for="radio1">Leisure</label>
							    </div>
							    <div class="form-check-inline">
							        <input type="radio" class="form-check-input" id="radio2" name="optradio" value="B">
							        <label class="form-check-label" for="radio2">Business</label>
							    </div>
							    <div class="form-check-inline">
							        <input type="radio" class="form-check-input" id="radio2" name="optradio" value="G">
							        <label class="form-check-label">Group</label>
							    </div>
						    </div>
				
						<div class="clear"></div>
						<div class="row">
							<div class="col-7 mr-auto my-auto">Number of Travelers</div>
							<div class="col-5">
								<select name="Adults" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
									<option>1</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
								</select>
						</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
						<div class="tmTextarea">
							<textarea name="Message" placeHolder="Message" data-constraints='@NotEmpty @Required @Length(min=20,max=999999)'></textarea>
						</div>
						<a href="javascript:void(0)" onclick="notImplementedYet()" class="btn" data-type="submit">Submit</a>
					</form>
				</div>
				<div class="grid_5 prefix_1">
					<h3>Welcome</h3>
					<img src="images/page1_img1.jpg" alt="" class="img_inner fleft">
					<div class="extra_wrapper">
						<p>Lorem ipsum dolor sit ere amet, consectetur ipiscin.</p>
						In mollis erat mattis neque facilisis, sit ametiol
					</div>
					<div class="clear cl1"></div>
					<p>Find the detailed description of this <span class="col1"><a href="http://blog.templatemonster.com/free-website-templates/" rel="dofollow">freebie</a></span> at TemplateMonster blog.</p>
					<p><span class="col1"><a href="http://www.templatemonster.com/category/travel-website-templates/" rel="nofollow">Travel Website Templates</a></span> category offers you a variety of designs that are perfect for travel sphere of business.</p>
					Proin pharetra luctus diam, a scelerisque eros convallis
				</div>
				<div class="grid_12">
					<h3 class="head1">Latest News</h3>
				</div>
				<div class="grid_4">
					<div class="block1">
						<time datetime="2014-01-01">10<span>Jan</span></time>
						<div class="extra_wrapper">
							<div class="text1 col1"><a href="#">Aliquam nibh</a></div>
							Proin pharetra luctus diam, any scelerisque eros convallisumsan. Maecenas vehicula egestas
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1">
						<time datetime="2014-01-01">21<span>Jan</span></time>
						<div class="extra_wrapper">
							<div class="text1 col1"><a href="#">Etiam dui eros</a></div>
							Any scelerisque eros vallisumsan. Maecenas vehicula egestas natis. Duis massa elit, auctor non
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1">
						<time datetime="2014-01-01">15<span>Feb</span></time>
						<div class="extra_wrapper">
							<div class="text1 col1"><a href="#">uamnibh Edeto</a></div>
							Ros convallisumsan. Maecenas vehicula egestas venenatis. Duis massa elit, auctor non
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="parts/footer.jsp" %> 

</body>
</html>