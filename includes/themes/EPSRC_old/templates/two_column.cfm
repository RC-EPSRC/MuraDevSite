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
							#$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#										
					<div class="clear"></div>
			    </div> <!-- wrap -->
			<cfinclude template="inc/footer.cfm" />
		    </div><!-- content -->
		<cfinclude template="inc/html_foot.cfm" />
		</div>
		<cfset subtype=application.classExtensionManager.getSubTypeByName('Page','Funding call',$.event('siteid'))>
		<cfset extendSet=subtype.getExtendSetByName('Funding call details') />
		<cfset attributesArray=extendSet.getAttributes()>
		<cfloop from="1" to="#arrayLen(attributesArray)#" index="a">	
		<cfset attributeBean=attributesArray[a]/>
			<div class="controls">
				<h4>#attributeBean.getLabel()#</h4>
				<p>#attributeBean.getOptionLabelList()#</p>
				<p>#attributeBean.getOptionList()#</p>
			</div>
		</cfloop>

</cfoutput>
	</body>
</html>