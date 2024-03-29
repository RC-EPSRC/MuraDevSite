<!---
|| BEGIN FUSEDOC ||
    
|| Properties ||
Name: 
Author: John Crocker (john@netadvances.co.uk
Template Created: 18-07-2002
Last Updated: 

|| Responsibilities ||
Lazarus contentServer Sitemap
|| URL ||


|| END FUSEDOC ||--->

<!----------------------------
|| BEGIN FUSEBOX APPLICATION ||
------------------------------>

<!--- Global parameters --->
<!---<cfoutput>#URLList#</cfoutput>  --->

<!--- Default Action --->
<cfsilent>
<cfparam name="request.filterBy" default="">
<cfparam name="request.day" default="0">


<cfif request.filterBy eq "releaseDate">
    <cfset variables.menuType="CalendarDate">
<cfelse>
    <cfset variables.menuType="CalendarMonth">
</cfif>

<cfif not isNumeric(variables.$.event('month')) 
    or (isNumeric(variables.$.event('month')) and variables.$.event('month') gt 12)>
    <cfset variables.$.event('month',month(now()))>
</cfif>

<cfif not isNumeric(variables.$.event('year'))>
    <cfset variables.$.event('year',year(now()))>
</cfif>

<cfif isNumeric(variables.$.event('day')) and variables.$.event('day')
    and variables.menuType eq "CalendarDate">
    <cfset variables.menuDate=createDate(variables.$.event('year'),variables.$.event('month'),variables.$.event('day'))>
<cfelseif variables.menuType eq "CalendarMonth">
    <cfset variables.menuDate=createDate(variables.$.event('year'),variables.$.event('month'),1)>
</cfif>

<cfset variables.rsPreSection=variables.$.getBean('contentGateway').getKids('00000000000000000000000000000000000',variables.$.event('siteID'),variables.$.content('contentID'),variables.menuType,variables.menuDate,100,variables.$.event('keywords'),0,"displayStart","asc",variables.$.event('categoryID'),variables.$.event('relatedID'),variables.$.event('tag'))>
<cfif variables.$.siteConfig('extranet') eq 1 and variables.$.event('r').restrict eq 1>
    <cfset variables.rssection=variables.$.queryPermFilter(variables.rsPreSection)/>
<cfelse>
    <cfset variables.rssection=variables.rsPreSection/>
</cfif>
</cfsilent>             
<cfoutput>
<cfinclude template="myglobals.cfm">
<cfinclude template="dsp_list.cfm">
</cfoutput>


