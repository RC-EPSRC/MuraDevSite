<cfoutput>
	<footer>
	    <div class="green-bar">
	      <div class="wrap">
	        <h3><strong>Connect with EPSRC</strong> Stay up to date with the latest goings on at EPSRC</h3>
	        <ul>
	          <li class="social youtube"><a href="##">YouTube</a></li>
	          <li class="social twitter"><a href="##">Twitter</a></li>
	          <li class="social rss"><a href="##">RSS</a></li>
	        </ul>
	      </div> <!-- wrap -->
	      <div class="clear"></div>
	    </div> <!-- green-bar -->
	    <div class="white-bar">
	      <div class="wrap">
	        <section class="quick-links inline">
	        <cfset feed=$.getBean("feed").loadBy(name="Large footer links")>
	        <cfset iterator=feed.getIterator()>

			<cfif iterator.hasNext()>
	          <ul>
	            <cfloop condition="iterator.hasNext()">
		          	<cfset item=iterator.next()>
		          	<li><a href="#item.getAssocURL()#">#item.getValue('title')#</a></li>
	            </cfloop>
	          </ul>
			</cfif>
	        </section>
	        <cfset feed=$.getBean("feed").loadBy(name="Small footer links")>
	        <cfset iterator=feed.getIterator()>
	        <cfif iterator.hasNext()>
	        <section class="links">
	          <p>
	         <cfloop condition="iterator.hasNext()">
		     	<cfset item=iterator.next()>
			 		<a href="#item.getAssocURL()#">#item.getValue('title')#</a><cfif iterator.hasNext()> | </cfif>
	         </cfloop>
	         </p>
	        </section>
	        </cfif>
	        <div class="copyright">
	          <p>Copyright #dateformat(now(), 'YYYY')#. Engineering and Physical Sciences Research Council</p>
	        </div> <!-- copyright -->
	      </div> <!-- wrap -->
	    </div> <!-- white-bar -->
  </footer>
</cfoutput>