<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">
		<div class="#$.getMBContainerClass()#"><!-- encompasses whole browser window eg for control of this area if needed -->
                <cfinclude template="inc/navbar.cfm" />
                <div class="clear"></div>

				
			    <div class="row-fluid" data-template-id="three_column">
			    
			    
                    <div class="wrap">
						<nav class="tertiary col-md-3">
						    #$.dspObjects(1)#
						</nav>
						<div class="primary">
	                        <cfinclude template="inc/breadcrumb.cfm" />
					        <div class="col-md-6 content">
						        #$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#
						        #$.dspObjects(2)#
					        </div><!-- module -->
			            </div> 
						<aside class="col-md-3 sidebar">
						    #$.dspObjects(3)#
						</aside><!--/span3-->
						<div class="clear"></div>
                    </div><!-- wrap --> 
					
					
			    </div><!-- row -->
			     
            <div class="push"></div><!-- div needed for sticky footer -->
        </div><!-- end main_container (encompasses whole browser window eg for control of this area if needed) -->
    <cfinclude template="inc/footer.cfm" />
    <cfinclude template="inc/html_foot.cfm" /><!--- closes body --->
</cfoutput>
