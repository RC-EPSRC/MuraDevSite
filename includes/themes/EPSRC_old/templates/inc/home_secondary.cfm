<cfoutput>
        <section class="research-opportunities">
          <h2>Funding calls</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris volutpat eros sed lectus posuere tristique.:</p>
          <p class="filter">Filter by: <a class="closing active" href="##">Closing Soon</a> | <a class="recent" href="##">Recently Issued</a></p>
          <div class="filter">
            <div class="closing">
            	<cfset feed=$.getBean("feed").loadBy(name="Funding Calls - Closing soon")>
				<cfset iterator=feed.getIterator()>
				<cfif iterator.hasNext()>
				<cfloop condition="iterator.hasNext()">
					<cfset item=iterator.next()>
					<article>
						<cfset closingTime = dateformat(item.getValue("callClosingDate"), 'yyyy-mm-dd')>
						<time datetime="#closingTime#"><span>#dateformat(closingTime, 'dd')#</span>#dateformat(closingTime, 'mmm')#</time>
						<h1><a href="#item.getURL()#">#item.getTitle()#</a></h1>
						<p>#item.getSummary()#</p>
					</article>
				</cfloop>
				<cfelse>
				<p>No feed items to display</p>
				</cfif>
				<div class="clear"></div>
            </div>
            <div class="recent">
              <cfset feed=$.getBean("feed").loadBy(name="Funding Calls - Newest calls")>
				<cfset iterator=feed.getIterator()>
				<cfif iterator.hasNext()>
				<cfloop condition="iterator.hasNext()">
					<cfset item=iterator.next()>
					<article>
						<cfset closingTime = dateformat(item.getValue("callClosingDate"), 'yyyy-mm-dd')>
						<time datetime="#closingTime#"><span>#dateformat(closingTime, 'dd')#</span>#dateformat(closingTime, 'mmm')#</time>
						<h1><a href="#item.getURL()#">#item.getTitle()#</a></h1>
						<p>#item.getSummary()#</p>
					</article>
				</cfloop>
				<cfelse>
				<p>No feed items to display</p>
				</cfif>
			  <div class="clear"></div>
            </div>
			<div class="clear"></div>
          </div>
        </section>
</cfoutput>