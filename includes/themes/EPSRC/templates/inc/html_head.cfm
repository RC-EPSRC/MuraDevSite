<cfoutput>
<!DOCTYPE html>
<html lang="en"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
<head>
	<!--- META
	================================================== --->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>#HTMLEditFormat($.content('HTMLTitle'))# - #HTMLEditFormat($.siteConfig('site'))#</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="#HTMLEditFormat($.content('MetaDesc'))#">
	<meta name="keywords" content="#HTMLEditFormat($.content('getMetaKeywords'))#">
	<cfif len($.content('credits'))><meta name="author" content="#HTMLEditFormat($.content('credits'))#" /></cfif>
	<meta name="generator" content="Mura CMS #$.globalConfig('version')#" />
	<!--- CSS
	================================================== --->
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/bootstrap/css/bootstrap.css"> <!-- epo for now just referencing non-minified file -->
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/font-awesome/css/xfont-awesome.css">
	<link rel="stylesheet" href="#$.siteConfig('assetPath')#/css/xmura.6.0.min.css">
    
    <link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/jquery-ui-1.8.20.custom.css"> <!-- epo -->
    <link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/jquery-ui-1.css"> <!-- epo -->
    <link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/reset.css"> <!-- epo -->
    <link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/main.css"> <!-- epo -->
    <link rel="stylesheet" media="screen and (min-width: 1200px)" href="#$.siteConfig('themeAssetPath')#/css/grid1140.css" /> <!-- epo -->
    <link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/xytp.css"> <!-- epo -->
    
    <!-- @font-face - replaced single hashes with double (##) for cold fusion-->
	<style type="text/css">
	@font-face {
    font-family:"DIN Next W01 Bold";
    src:url("#$.siteConfig('themeAssetPath')#/fonts/b32ab78b-6c51-4bd3-bc37-4edcec0331f8.eot?##iefix"); <!-- replaced hash with ##skipnav for cold fusion -->
    src:url("#$.siteConfig('themeAssetPath')#/fonts/b32ab78b-6c51-4bd3-bc37-4edcec0331f8.eot?##iefix") format("eot"),url("#$.siteConfig('themeAssetPath')#/fonts/9949035f-6226-4080-a14a-bf7d94ffb1e1.woff") format("woff"),url("#$.siteConfig('themeAssetPath')#/fonts/6241bd09-15c2-485e-9796-9db8d0aa6974.ttf") format("truetype"),url("#$.siteConfig('themeAssetPath')#/fonts/af94da3e-4232-416a-b6bc-f39f85dd5db6.svg##af94da3e-4232-416a-b6bc-f39f85dd5db6") format("svg");
    /* Below needed for Firefox, or instead set security.fileuri.strict_origin_policy to false so FF can find files */
    src:local("DIN Next W01 Bold"), url("#$.siteConfig('themeAssetPath')#/fonts/6241bd09-15c2-485e-9796-9db8d0aa6974.ttf");
    }
    
    @font-face {
    font-family:"DIN Next W01 Regular";
    src:url("#$.siteConfig('themeAssetPath')#/fonts/da088ecc-a53c-4831-a95b-6fd81b5b338a.eot?##iefix");
    src:url("#$.siteConfig('themeAssetPath')#/fonts/da088ecc-a53c-4831-a95b-6fd81b5b338a.eot?##iefix") format("eot"),url("#$.siteConfig('themeAssetPath')#/fonts/c5a7f89e-15b6-49a9-8259-5ea665e72191.woff") format("woff"),url("#$.siteConfig('themeAssetPath')#/fonts/868c94b5-ca49-46b7-b62b-297f8d861125.ttf") format("truetype"),url("#$.siteConfig('themeAssetPath')#/fonts/e3145f65-29b5-4f7f-8c6e-2dc135021b6a.svg##e3145f65-29b5-4f7f-8c6e-2dc135021b6a") format("svg");
    /* Below needed for Firefox, or instead set security.fileuri.strict_origin_policy to false so FF can find files */
    src:local("DIN Next W01 Regular"), url("#$.siteConfig('themeAssetPath')#/fonts/868c94b5-ca49-46b7-b62b-297f8d861125.ttf");
    }
    </style>
	
	<!--- CfStatic CSS --->
	<cf_CacheOMatic key="globalheadercss" nocache="{1}">
		#$.static()
			.include('/xcss/theme/')
			.renderIncludes('xcss')#
	</cf_CacheOMatic>
	
	<!--- jQuery
	================================================== --->
	<script src="#$.siteConfig('assetPath')#/jquery/jquery.js"></script>
    
    <script src="#$.siteConfig('themeAssetPath')#/js/application.js"></script> <!-- epo -->
    <script src="#$.siteConfig('themeAssetPath')#/js/jquery-1.js"></script> <!-- epo -->
    <script src="#$.siteConfig('themeAssetPath')#/js/jquery-ui-1.js"></script> <!-- epo -->
	
	<!--- IE SHIM - for IE6-8 support of HTML5 elements
	================================================== --->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> --->
	
	<!--- FAV AND TOUCH ICONS
	================================================== --->
	<link rel="shortcut icon" href="#$.siteConfig('themeAssetPath')#/images/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-57-precomposed.png">
	
	<!--- MURA FEEDS
	================================================== --->
	<cfset rs=$.getBean('feedManager').getFeeds($.event('siteID'),'Local',true,true) />
	<cfloop query="rs"><link rel="alternate" type="application/rss+xml" title="#HTMLEditFormat($.siteConfig('site'))# - #HTMLEditFormat(rs.name)#" href="#XMLFormat('http://#listFirst(cgi.http_host,":")##$.globalConfig('context')#/tasks/feed/?feedID=#rs.feedID#')#"></cfloop>
    
</head>
</cfoutput>