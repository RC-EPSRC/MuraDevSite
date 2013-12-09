<cfoutput>
	<nav class="primary">
	      <div class="wrap">
	      	  <cfset $.setNavOffset(0)>

		      <cf_CacheOMatic key="dspPrimaryNav#$.content('contentid')#">
					#$.dspPrimaryNav(
						viewDepth=0,
						id='navPrimary',
						class='nav',
						displayHome='Always',
						closePortals=false,
						showCurrentChildrenOnly=false,
						ulTopClass='nav',
						ulNestedClass='',
						liHasKidsClass='',
						liHasKidsCustomString='',
						liHasKidsNestedClass='',
						liNestedClass='',
						aHasKidsClass='',
						aHasKidsCustomString='',
						liCurrentClass='active',
						aCurrentClass='active'
					)#
				</cf_cacheomatic>
	      </div> <!-- wrap -->
	</nav> <!-- primary -->
	<div class="clear"></div>
</header>
</cfoutput>