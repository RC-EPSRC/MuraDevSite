
<cfset fcUtils = CreateObject("component", "fundingCallsUtils")>

<cfset closingDateTime = ParseDateTime($.content().getValue('callClosingDate'))>
<cfset timeRemaining = fcUtils.getPretifiedDateDiff(now(),closingDateTime)>
<cfset showTimeZone = $.content().getPArent().getValue('callsShowTimeZone')>


<cfset status = "">
<cfset callThemeStr = "">
<cfset callThemeArray = listToArray($.content().getValue('callTheme'), ',')>
<cfset arrLen = arrayLen(callThemeArray)>
<cfloop from="1" to="#arrLen#" index="i">
	<cfset callThemeStr &= '<a href="/callThemeLinks/#fcUtils.formatFilename(callThemeArray[i])#" target="_blank" title="Opens in new window">#callThemeArray[i]#</a>'>
	<cfif i neq arrLen>
		<cfset callThemeStr &= ', '>
	</cfif>
</cfloop>

<cfif $.content().getValue('callOpenDate') GT now()>
	<cfset status = 'Future'>
<cfelseif closingDateTime LT now()>
	<cfset status = 'Closed'>
<cfelse>
	<cfset status = 'Open'>
</cfif>
<cfoutput>
<!---<cfdump var="IsDST?:#isDST#">--->
<!---<p><strong><font color="red" size="5px">This section under review pending QA/UAT.<br />Please do NOT edit.</font></strong></p>--->
<article class="listing">
	<ul class="meta">
		<cfif timeRemaining NEQ 'Closed'>
            <li class="timeLeft">Time remaining : #fcUtils.getPretifiedDateDiff(now(),closingDateTime)#</li>
		</cfif>
		<li class="status">Status: #status#</li>
		<li class="issue">Issue date: #dateformat($.content().getValue('callIssueDate'), 'dd/mm/yyyy')#</li>
        <li class="open">Open date: #dateformat($.content().getValue('callOpenDate'), 'dd/mm/yyyy')#</li>
        <li class="closing">Closing date: #fcUtils.getCallClosingTimeString(closingDateTime, showTimeZone)#</li>
        <li class="type">Call type: #$.content().getValue('callType')#</li>
        <li class="related">Call themes: #callThemeStr#</li>
	</ul>
    #$.renderEditableAttribute(attribute='body', type='HTMLEditor', value=$.content('body'),enableMuraTag=true)#
</article>
</cfoutput>

