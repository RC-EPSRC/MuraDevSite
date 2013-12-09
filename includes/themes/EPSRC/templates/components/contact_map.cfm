<cfoutput>
	<section class="contact map">
	  <!---
	  <form>
	    <fieldset>
	      <label for="contact-search">Find an EPSRC Contact</label>
	      <input type="text" placeholder="Search by name and/or job responsibilities" id="contact-search" name="contact-search">
	      <button type="submit">Search Contacts</button>
	    </fieldset>
	  </form>
	  --->
	  <div id="map"></div>
	  <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
	  <script src="#$.siteConfig('themeAssetPath')#/js/theme/scripts/gmaps.js"></script>
	  <script>
	    var map;
	          
	    $(document).ready(function() {
	      map = new GMaps({
	        div: '##map',
	        lat: 51.567187,
	        lng: -1.785925,
	        zoomControl: true,
	        zoomControlOptions: { style: google.maps.ZoomControlStyle.SMALL },
	        streetViewControl: false
	      });
	            
	      map.addMarker({
	        lat: 51.567187,
	        lng: -1.785925,
	        title: 'EPSRC'
	      });
	            
	    });
	  </script>
	  <div class="address">
	  	#$.component('body')#
	  </div>
	</section>
</cfoutput>