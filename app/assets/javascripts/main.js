$(document).ready(function(){


 $("#owl-example").owlCarousel({
    // Most important owl features
    items : 4,
    pagination : true,
    paginationSpeed : 1000,
    navigation : true,
    navigationText : ["","<i class='fa fa-angle-right'></i>"],
    slideSpeed : 800,
 });

	$("#navigation").sticky({
		topSpacing : 75,
	});

//Initiat WOW JS
    new WOW().init();

});
