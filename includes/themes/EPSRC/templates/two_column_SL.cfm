<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">
    
       	<div class="main_container"><!-- encompasses whole browser window eg for control of this area if needed-->
            <div class="container"><!-- Page proper starts -->

                <cfinclude template="inc/navbar.cfm" />
                <div class="clear"></div>

                <cfinclude template="inc/LHNav.cfm" />
				
                <section class="span6 content">
                    <cfinclude template="inc/breadcrumb.cfm" />
<!--- 
                    #$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#
                    #$.dspObjects(2)#
 --->
                </section><!--/span6-->
                <aside class="span3">
<!--- 
    				#$.dspObjects(3)# 
--->
                </aside><!--/span-->	
				
            </div><!-- end container center -->
        <div class="push"></div><!-- div needed for sticky footer -->
    </div><!-- end main_container (encompasses whole browser window eg for control of this area if needed) -->          
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>