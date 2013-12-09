<cfset feed=$.getBean("feed").loadBy(name="HomeSlideshow")>

<cfset iterator=feed.getIterator()>

<cfif iterator.hasNext()>
<cfoutput>
	<div id="slider">
		<div class="wrap">
			<div class="flexslider">
				<ul class="slides">
					<cfloop condition="iterator.hasNext()">
						<cfset item=iterator.next()>
						<li class="slide">
							<div data-alt="" data-picture="">
				              <div data-src="#item.getImageURL(width=960, height=381)#"></div>
				              <div data-media="(max-width: 767px)" data-src="#item.getImageURL(width=768, height=305)#"></div>
				              <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="#item.getImageURL(width=1536, height=610)#"></div>
				              <noscript>
				                <img alt="" src="#item.getImageURL(width=960, height=381)#" />
				              </noscript>
				            </div> <!-- picture -->
							<h2>#HTMLEditFormat(item.getTitle())#</h2>
							<p>#item.getSummary()#</p>
						</li> <!-- slide -->
					</cfloop>
				</ul> <!-- slides -->
			</div> <!-- flexslider -->
		</div> <!-- wrap -->
	</div> <!-- slider -->
	<div class="clear"></div>
</cfoutput>
<cfelse>
	<p class="notice">Your feed has no items</p>
</cfif>