<cfoutput>

	<script src="#$.siteConfig('themeAssetPath')#/js/theme/jquery.flexslider.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/picturefill.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/jquery.adaptivetext.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/jquery.easing.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/flexslider-functions.js"></script>
	<script src="#$.siteConfig('themeAssetPath')#/js/theme/modernizr.functions.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/application.min.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/resizer.min.js"></script>
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/cookies.js"></script>
  
    <div id="clonebag-latestupdates" style="display:none;"></div>
    <div id="clonebag-keyfacts" style="display:none;"></div>
		<!--- CfStatic JS --->
<!---
		<cf_CacheOMatic key="globalfooterjs">
			#$.static().include('/js/theme/').renderIncludes('js')#
		</cf_CacheOMatic>
--->
</cfoutput>