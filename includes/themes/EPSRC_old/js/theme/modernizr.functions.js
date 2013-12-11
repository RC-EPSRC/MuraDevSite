$(document).ready(function() {
  
	Modernizr.load({
	    test: Modernizr.placeholder,
	    nope: [
	    		themepath + '/js/theme/scripts/placeholders.js'
	          ],
		  complete : function () {
			  $('input, textarea').placeholder();
		  }
	});
  
});