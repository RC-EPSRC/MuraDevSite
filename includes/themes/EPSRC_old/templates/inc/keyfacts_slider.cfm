<cfoutput> 
	<cfset latestfeed=$.getBean("feed").loadBy(name="Key facts slideshow")>
	<cfset latestIterator=latestFeed.getIterator()>
	

	<cfif latestIterator.hasNext()>
		<!---<cfdump var="#latestIterator.next().getAllValues()#">--->
		<div class="tertiary">
			<div class="wrap">
				<h2>Key Facts and Figures</h2>
				<div class="flexslider" id="keyfacts">
					<div class="slides">
						<div class="kfwrap">							
							<cfloop condition="latestIterator.hasNext()">
								<cfset latestItem=latestIterator.next()>
        
						        <div class="kfitem">
						          <p><strong>#HTMLEditFormat(latestItem.getTitle())#</strong>#latestItem.getSummary()#</p>
						        </div>
							</cfloop>
						</div> <!-- luwrap -->
					</div> <!-- slides -->
				</div> <!-- flexslider/keyfacts -->
				<div class="clear"></div>
			</div> <!-- wrap -->
		</div> <!-- primary -->
	</cfif>
</cfoutput>
