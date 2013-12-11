<cfoutput>
<!DOCTYPE html>
<html class="no-js" lang="en">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<head> 	
	<!--- META
	================================================== --->
	<meta charset="UTF-8">
	
	<title>#HTMLEditFormat($.content('HTMLTitle'))# - #HTMLEditFormat($.siteConfig('site'))#</title>

	<meta name="viewport" content="width=device-width">
	<meta name="apple-mobile-web-app-capable" content="yes">
	
	<cfif len($.content('credits'))><meta name="author" content="#HTMLEditFormat($.content('credits'))#" /></cfif>
	
	<meta name="keywords" content="#HTMLEditFormat($.content('getMetaKeywords'))#">		
	<meta name="description" content="#HTMLEditFormat($.content('MetaDesc'))#">

	<meta name="robots" content="noindex, nofollow">
	<meta name="dcterms.creator" content="Engineering and Physical Science Research Council, EPSRC">
	<meta name="dcterms.date" content="#dateformat($.content().getValue('lastupdate'), 'dd mmm YYYY')#">
	<meta name="dcterms.publisher" content="Engineering and Physical Science Research Council, Polaris House, North Star Avenue, Swindon, SN2 1ET, email webteam@epsrc.ac.uk">
	<meta name="dcterms.rights" content="Copyright : Engineering and Physical Science Research Council, http://www.epsrc.ac.uk">
	<meta name="dcterms.title" content="#HTMLEditFormat($.content('HTMLTitle'))#">
	<!--- jQuery ================================================== --->
	<script src="#$.siteConfig('assetPath')#/jquery/jquery.js"></script>
  
	<!-- Modernizr -->
	<script src="#$.siteConfig('themeAssetPath')#/js/theme/modernizr.min.js"></script>
	
	<!-- Webfonts -->
	<!--- <link rel="stylesheet" href="http://fast.fonts.com/cssapi/1fb8477e-8896-4595-a793-c87d9e53312d.css" /> --->
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/core.css" />
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/grid990.css" media="screen and (min-width: 768px), screen and (min-device-pixel-ratio: 1.5) and (orientation: landscape), screen and (-webkit-min-device-pixel-ratio: 1.5) and (orientation: landscape)" />
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/grid1140.css" media="screen and (min-width: 1200px)" />

	
	<!--[if lte IE 8]> 
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/grid990.css" media="screen" />
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/ie/ie8.css" media="screen" />
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/grid1140.css" media="screen" />
	<![endif]-->
	
	<!--[if lte IE 7]> 
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/ie/ie7.css" media="screen" />
	<![endif]-->
	
	<!--[if IE 6]> 
		<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/theme/ie/ie6.css" media="screen" />
		<script src="#$.siteConfig('themeAssetPath')#/js/theme/unitpngfix.js"></script>
	<![endif]-->

	<!--- FAV AND TOUCH ICONS
	================================================== --->
	<link rel="shortcut icon" href="#$.siteConfig('themeAssetPath')#/images/template/favicon.ico" />
	<link rel="apple-touch-icon" href="#$.siteConfig('themeAssetPath')#/images/template/touch-icon-57x57.png" />
	<link rel="apple-touch-icon" sizes="72x72" href="#$.siteConfig('themeAssetPath')#/images/template/touch-icon-72x72.png" />
	<link rel="apple-touch-icon" sizes="114x114" href="#$.siteConfig('themeAssetPath')#/images/template/touch-icon-114x114.png" />

</head>
</cfoutput>