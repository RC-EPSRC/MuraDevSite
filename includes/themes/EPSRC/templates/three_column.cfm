<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">
		<div class="#$.getMBContainerClass()#">
			<cfinclude template="inc/navbar.cfm" />
      		<div class="row-fluid" data-template-id="three_column">

                <cfinclude template="inc/breadcrumb.cfm" />

	      		<aside class="span3">
				    #$.dspObjects(1)#
	      		</aside><!--/span3-->
	      		
				<section class="span6 content">
				
<!--- From BV ? 
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
 --->
				
					#$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#
					#$.dspObjects(2)#
			    </section><!--/span6-->
			    
				<aside class="span3">
					#$.dspObjects(3)#
				</aside><!--/span3-->
				
			</div><!--/row-->
			<cfinclude template="inc/footer.cfm" />
		</div><!-- /.container -->
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>