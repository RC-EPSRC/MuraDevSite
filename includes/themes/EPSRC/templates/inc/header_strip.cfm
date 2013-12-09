<cfoutput>
	<header>
		<div class="wrap">
	      <a href="/" class="logo">
	        <div data-picture="" data-alt="EPSRC - Engineering and Physical Sciences Research Council">
	          <div data-src="#$.siteConfig('themeAssetPath')#/images/template/desktop/logo.png"></div>
	          <div data-src="#$.siteConfig('themeAssetPath')#/images/template/mobile/low-res/logo.png" data-media="(max-width: 767px)"></div>
	          <div data-src="#$.siteConfig('themeAssetPath')#/images/template/mobile/high-res/logo.png" data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)">
	          </div> <!-- picture -->
	          <noscript>
	            <img src="#$.siteConfig('themeAssetPath')#/images/template/desktop/logo.png" alt="EPSRC - Engineering and Physical Sciences Research Council" />
	          </noscript>
	        <img alt="EPSRC - Engineering and Physical Sciences Research Council" src="#$.siteConfig('themeAssetPath')#/images/template/desktop/logo.png" />
	        </div>
	      </a>
	      <nav class="secondary">
	        <ul>
	        <li><a href="##content">Skip Navigation</a></li>
	        <cfset feed=$.getBean("feed").loadBy(name="Header links")>
	        <cfset iterator=feed.getIterator()>
			<cfif iterator.hasNext()>
	            <cfloop condition="iterator.hasNext()">
		          	<cfset item=iterator.next()>
		          	<li<cfif not(iterator.hasNext())> class="omega"</cfif>><a href="#item.getAssocURL()#">#item.getValue('title')#</a></li>
	            </cfloop>
			</cfif>
	          <!---
	          
	          <li><a href="##">Media Enquiries</a></li>
	          <li class="omega"><a href="##">Accessibility</a></li>
	          --->
	          <li class="social youtube"><a href="##">YouTube</a></li>
	          <li class="social twitter"><a href="##">Twitter</a></li>
	          <li class="social rss"><a href="##">RSS</a></li>
	        </ul>
	      </nav>  <!-- secondary -->
	      <form action="/index.cfm/search-results/" id="searchForm">
				<fieldset>
					<input type="text" name="Keywords" id="txtKeywords" class="text" placeholder="search" value="">
					<input type="hidden" name="display" value="search">
					<input type="hidden" name="newSearch" value="true">
					<input type="hidden" name="noCache" value="1">
					<input type="submit" class="submit" value="Go" style="display: none;">
				</fieldset>
		  </form>
	      <!---<form>
	        <fieldset>
	          <input type="text" placeholder="Search" value="">
	        </fieldset>
	      </form>
	      --->
	    </div> <!-- wrap -->
</cfoutput>