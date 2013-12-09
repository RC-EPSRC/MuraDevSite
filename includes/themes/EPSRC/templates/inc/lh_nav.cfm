<cfoutput>
	<cfset noDisplayAreas = 'Gallery,Folder,Calendar'> 
	<cfset $.setNavOffset(1)>
	<h2><a href="#$.createHREF(filename=$.getTopVar('filename'))#">#$.getTopVar('menuTitle')#</a></h2>
	
	<!---<cfdump var="#$.content()#">	--->
	
	<cfif $.content().hasParent() and $.getParent().getValue('type') neq 'Folder' and not(ListFind(nodisplayAreas, $.content('type'))) >
		<cf_CacheOMatic key="dspSecondaryNav#$.content('contentid')#">
			#$.dspPrimaryNav(
				viewDepth=4,
				id='',
				class='',
				displayHome='Never',
				closePortals=false,
				showCurrentChildrenOnly=true,
				ulTopClass='',
				ulNestedClass='',
				liHasKidsClass='more',
				liHasKidsCustomString='',
				liHasKidsNestedClass='',
				liNestedClass='',
				aHasKidsClass='more open', 
				aHasKidsCustomString='',
				liCurrentClass='',
				aCurrentClass='active'
			)#
		</cf_cacheomatic>
	</cfif>
</cfoutput>