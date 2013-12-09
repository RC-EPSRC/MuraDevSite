<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="home"<!--- class="#$.createCSSid($.content('menuTitle'))#"--->>
		<cfinclude template="inc/header_strip.cfm" />
		<cfinclude template="inc/navbar.cfm" />
		<div id="global-cookie-message" style="display: none;">
		  	<p>EPSRC uses cookies to make the site simpler. <a href="/support/cookies">Find out more about cookies</a></p>
		</div>
		<cfinclude template="inc/home_slider.cfm">
		<div id="content">
			<div class="primary">
				<cfinclude template="inc/latestupdates_slider.cfm">
			</div> <!--primary -->
			<div class="secondary">
				<div class="wrap">	
					<cfinclude template="inc/home_secondary.cfm">
					<section class="portfolio">
			        	#$.dspObjects(1)#
			        </section> <!-- portfolio --->
			        <section class="growth-stories">
				        #$.dspObjects(2)#
			        </section><!-- growth-stories -->
			        <div class="clear"></div>
			    </div> <!-- wrap -->
			</div> <!-- secondary -->
			<cfinclude template="inc/keyfacts_slider.cfm">
		</div> <!-- content -->
		<div class="clear"></div>
		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</cfoutput>
	<script type="text/javascript">
		cookieMessageCheck();
	</script>
	</body>
</html>	