$(document).ready(function(){
    	$('#slider .flexslider').flexslider({
    	controlNav: true,
    	directionNav: true,
    	touch: true,
    	slideshowSpeed: 4000,
    	animationSpeed: 750,
    	animation: 'slide',
        selector: '.slides > li',
        slideshow: true,
        pausePlay: true
    });  
});

