<cfoutput>
<header>
    <div class="wrap">
        <h1>
            <span class="logo" tabindex="1"><a href="/"><img src="#$.siteConfig('themeAssetPath')#/images/logo.png" alt="EPSRC - Engineering and Physical Sciences Research Council" title="EPSRC - Engineering and Physical Sciences Research Council"/></a></span>
        </h1>
    <!-- ----------------------------------------------------------- MEDIA OPTION LINKS -------------------------------------------------------------------- -->
       <nav class="media_option_links">
            <p class="none">Access Keys:</p>
            <ul class="none">
                <li><a accesskey="S" id="A1" class="hide" href="##skipnav">Skip navigation (access key S)</a></li><!-- replaced hash with ##skipnav for cold fusion-->
                <li><a accesskey="1" id="A2" class="hide" href="/">Home page (access key 1)</a></li>
                <li><a accesskey="2" id="A3" class="hide" href="/newsevents/Pages/latestupdates.aspx">What's new (access key 2)</a></li>
                <li><a accesskey="3" id="A4" class="hide" href="/use/Pages/sitemap.aspx">Site map (access key 3)</a></li>
                <li><a accesskey="4" id="A5" class="hide" href="/Pages/searchresults.aspx">Search (access key 4)</a></li>
                <li><a accesskey="6" id="A6" class="hide" href="/use/help/Pages/help.aspx">Help (access key 6)</a></li>
                <li><a accesskey="7" id="A7" class="hide" href="/about/standards/Pages/complaints.aspx">Complaints procedure (access key 7)</a></li>
                <li><a accesskey="8" id="A8" class="hide" href="/use/Pages/terms.aspx">Terms and conditions (access key 8)</a></li>
                <li><a accesskey="9" id="A9" class="hide" href="/about/contactus/Pages/feedback.aspx">Feedback form (access key 9)</a></li>
                <li><a accesskey="0" id="A10" class="hide" href="/use/accessibility/Pages/accessibility.aspx##keys">Access key details (access key 0)</a></li><!-- replaced aspx-hash-keys with ## for cold fusion-->
            </ul>
            <ul class="visible_links">
                <li><a href="##skipnav" accesskey="S" tabindex="2">Skip Navigation</a></li><!-- replaced hash with ##skipnav for cold fusion-->
                <li><a href="/use/accessibility" tabindex="3">Accessibility</a></li>
                <li><a href="/newsevents/news/Pages/mediacontacts.aspx" tabindex="4">Media Enquiries</a></li>
                <li class="omega">
                    <fieldset>
                        <a href="/use/Pages/cookies.aspx" id="cookieAcceptorLnk" tabindex="6"><input type="checkbox" name="cookieAcceptor" value="" id="cookieAcceptor" tabindex="5"><label for="cookies">Accept Cookies</label></a>
                    </fieldset>
                </li>
                <li class="social youtube"><a href="http://www.youtube.com/epsrcvideo/" tabindex="7"><img src="#$.siteConfig('themeAssetPath')#/images/youtube-header.png" alt="YouTube" width="48" height="45" /></a></li>
                <li class="social twitter"><a href="http://www.twitter.com/epsrc/" tabindex="8"><img src="#$.siteConfig('themeAssetPath')#/images/twitter-header.png" alt="Twitter" width="47" height="41" /></a></li>
                <li class="social rss"><a href="/newsevents/pages/feeds.aspx" tabindex="9"><img src="#$.siteConfig('themeAssetPath')#/images/rss-header.png" alt="RSS" width="46" height="42" /></a></li>
            </ul>
        </nav> <!-- end nav.media_option_links -->
        
        <div class="resizer" aria-hidden="true">
            <span>Change text size:</span> <a href="" class="small" tabindex="10">A</a>
            <a href="" class="medium" tabindex="11">A</a>
            <a href="" class="large" tabindex="12">A</a>
        </div>
        <div class="search-box">
            <fieldset>
               <div>
                    <div class="SearchDivClass"><label title="Firefox 25" class="SearchLabelNoShow">Search this site here</label><input type="text" class="SearchTextbox" tabindex="13" placeholder="Search" /><input type="submit" value=" " class="searchsubmit" tabindex="14" /></div>
               </div>
                <!--Set TextEntryMode = StaticMarkup for Google Custom Search Engine or TextBox for Google Mini -->
            </fieldset>
         </div> <!-- end div.search-box -->
    
    </div> <!-- end div.wrap -->
    
    <!-- END Media Option Links-->
    
    <!-- ----------------------------------------------------------- PRIMARY NAV -------------------------------------------------------------------- -->                           
    <!-- Primary Nav -->
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
    	</div>
	
		<cfinclude template="megaDropDown.html" />
            
     </nav>
     <div class="clear"></div>
     
     <!-- End of Primary Nav -->
    </header>
</cfoutput>