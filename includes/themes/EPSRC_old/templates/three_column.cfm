<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()# home" class="#$.createCSSid($.content('menuTitle'))#">
		<cfinclude template="inc/header_strip.cfm" />
		<div class="#$.getMBContainerClass()#">
			<cfinclude template="inc/navbar.cfm" />
      		<div id="content">
      			<div class="wrap">
		      		<nav class="tertiary">
			      		<h2>#$.getTopVar('menuTitle')#</h2>
						#$.dspObjects(1)#
		      		</nav>  <!-- tertiary -->
					<div class="primary">
						<cfinclude template="inc/breadcrumb.cfm" />
						<section class="module text">
						<cfif $.content().getSubType() eq 'FundingCall'>
							<cfif findnoCase($.content().getParent().getURL(), cgi.http_referer)>
								<a class="fundingCallsBack" href="#cgi.http_referer#"><< Funding calls</a> 
							<cfelse>
								<a class="fundingCallsBack" href="#$.content().getParent().getURL()#"><< Funding calls</a>
							</cfif>
						</cfif>
						
						<cfif isUserLoggedIn() and len($.content().getValue('callUniqueID'))>
							<cfset pagetitle = 'ID:' & $.content().getValue('callUniqueID') & " - " & $.content().getTitle()>
						<cfelse>
							<cfset pageTitle= $.content('title')>
						</cfif>
							#$.dspBody(body=$.content('body'),pageTitle=pageTitle,crumbList=0,showMetaImage=1)#					
							#$.dspObjects(2)#
						</section>
				    </div>
					<aside>
						#$.dspObjects(3)#
					</aside>
					<div class="clear"></div>
			    </div> <!-- wrap -->
			<cfinclude template="inc/footer.cfm" />
		    </div><!-- content -->
		<cfinclude template="inc/html_foot.cfm" />
		</div>
	</body>
</html>
</cfoutput>
