<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">
	<div class="main_container"><!-- encompasses whole browser window eg for control of this area if needed -->
		<div class="container"><!-- Page proper starts -->

			<cfinclude template="inc/navbar.cfm" />
	
			<div class="clear"></div>
			#$.dspCrumblistLinks()#
			<div class="wrap">
				<span style="background-color:##069; height:100px; display:block;">
					lorem ipsum dolor sit amet *** HOME.CFM -> inc/navbar.cfm above ***
				<span>	
			</div><!-- end wrap -->

		</div><!-- end container (Page proper) -->

	<div class="push"></div><!-- div needed for sticky footer -->
	
</div><!-- end main_container (encompasses whole browser window eg for control of this area if needed) -->

<cfinclude template="inc/footer.cfm" />
<cfinclude template="inc/html_foot.cfm" />
</cfoutput>