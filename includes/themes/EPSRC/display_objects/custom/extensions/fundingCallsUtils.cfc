<cfcomponent displayname="fundingCallsUtility">
	
	<cffunction name="makePagination" returnType="string">
		<cfargument name="pageCount" required="true">
		<cfargument name="currentPage" required="false" default="1">
		<cfargument name="selectClass" required="true">
		<cfargument name="$" required="true">
		
		<cfif findNoCase('?', $.getCurrentURL())>
			<cfset var qryStrJoiner = '&'>
		<cfelse>
			<cfset var qryStrJoiner = '?'>
		</cfif>
		
		<cfset var thisURL = "">
		<cfset var paginationStr = '<ul class="fcPagination">'>

		<cfsavecontent variable="callsPerPage">
		<cfoutput>
		<li class="fcPerPage">Calls per page: <select name="fcPerPage" id="fcPerPage" class="#selectClass#" >
			<option value="10"<cfif findnocase('10',$.event('fcPerPage'))> selected</cfif>>10</option>
			<option value="25"<cfif findnocase('25',$.event('fcPerPage'))> selected</cfif>>25</option>
			<option value="50"<cfif findnocase('50',$.event('fcPerPage'))> selected</cfif>>50</option>
			<option value="100"<cfif findnocase('100',$.event('fcPerPage'))> selected</cfif>>100</option>
		</select></li>
		</cfoutput>			
		</cfsavecontent>
		
		<cfset paginationStr &= callsPerPage>
		
		<cfif currentPage GT 1>
			<cfset thisURL = getPaginationURL($.getCurrentURL(), currentPage, currentPage-1)>
			<cfset paginationStr &= '<li class="prev""><a href="#thisURL#"><< Previous</a></li>'>
		<cfelse>
			<cfset paginationStr &= '<li class="prev greyed"><< Previous</li>'>
		</cfif>
		
		<cfloop index="i" from="1" to="#pageCount#">
			<cfif i neq currentPage>
				<cfset thisURL = getPaginationURL($.getCurrentURL(), currentPage, i)>
				<cfset paginationStr &= '<li><a href="#thisURL#">#i#</a></li>'>
			<cfelse>
				<cfset paginationStr &= '<li class="current">#i#</li>'>
			</cfif>
		</cfloop>
		<cfif pageCount GT currentPage>
			<cfset thisURL = getPaginationURL($.getCurrentURL(), currentPage, currentPage+1)>
			<cfset paginationStr &= '<li class="next"><a href="#thisURL#">Next >></a></li>'>
		<cfelse>
			<cfset paginationStr &= '<li class="next greyed">Next >></li>'>
		</cfif>
		<cfset paginationStr &= '</ul>'>
		<cfreturn paginationStr>
	</cffunction>
	
	<cffunction name="getPaginationURL" returnType="string">
		<cfargument name="currentURL" required="true">
		<cfargument name="currentPage" required="true">
		<cfargument name="goToPage" required="true">
		<cfset var thisURL = "">
		<cfif findnocase('currPage=',currentURL)>
			<cfset thisURL = replacenocase(currentURL, 'currPage=' & currentPage, 'currPage=' & goToPage)>
		<cfelseif findnocase('?', currentURL)>
			<cfset thisURL = currentURL & '&currPage=' & goToPage>
		<cfelse>
			<cfset thisURL = currentURL & '?currPage=' & goToPage>
		</cfif>	
		<cfreturn thisURL>
	</cffunction>
	
	<cffunction name="getPretifiedDateDiff" returnType="string">
	<cfargument name="dateStart" default="now()" required="false">
	<cfargument name="dateEnd" default="now()>" required="false">
	<cfset dateStart = dateFormat(dateStart, 'mm/dd/yyyy') & " " & timeFormat(dateStart, 'HH:mm')>
	<cfset dateEnd = dateFormat(dateEnd, 'mm/dd/yyyy') & " " & timeFormat(dateEnd, 'HH:mm')>
	
	<cfif NOT isValid("date", dateStart)>
	    <cfthrow message="dateStart must be a valid DATE" detail="The value #dateStart# is not a valid DATE. For example, #dateformat(now(), 'mm/dd/yyyy')# #timeformat(now(), 'h:mm:ss tt')# is a valid DATETIME value." />
	</cfif>
	<cfif NOT isValid("date", dateEnd)>
	    <cfthrow message="dateEnd must be a valid DATE" detail="The value #dateEnd# is not a valid DATE. For example, #dateformat(now(), 'mm/dd/yyyy')# #timeformat(now(), 'h:mm:ss tt')# is a valid DATETIME value." />
	</cfif>
	
	<cfset compareGivenDates = DateCompare(dateStart, dateEnd, "s")>
	<cfif compareGivenDates eq 1>
	    <cfset returnTimeRemaining = ''>
	</cfif>
	
	<cfset rightNow = dateformat(now(), "mm/dd/yyyy") & " " & timeformat(now(), "HH:mm:ss tt") />
	<cfset compareNow = DateCompare(rightNow, dateStart, "s") />
	<cfswitch expression="#compareNow#">
	    <cfcase value="-1">
	        <cfthrow message="Coming Soon..." />
	    </cfcase>
	    <cfcase value="1">
	        <cfset dateStart = rightNow />
	    </cfcase>
	</cfswitch>
	
	<cfset returnTimeRemaining="" />
	<cfset dateStart = dateformat(dateStart, "mm/dd/yyyy") & " " & timeformat(dateStart, "HH:mm:ss") />
	<cfset dateEnd = dateformat(dateEnd, "mm/dd/yyyy") & " " & timeformat(dateEnd, "HH:mm:ss") />
	<cfset hdif = Abs(DateDiff("h", dateEnd, dateStart)) />
	<cfset ndif = Abs(DateDiff("n", dateEnd, dateStart)) />
	<cfset sdif = Abs(DateDiff("s", dateEnd, dateStart)) />
	<cfset years2go = Abs(DateDiff("yyyy", dateEnd, dateStart)) />
	<cfset months2go = Abs(DateDiff("m", dateEnd, dateStart)) />
	<cfset weeks2go = Abs(DateDiff("ww", dateEnd, dateStart)) />
	<cfset days2go = Abs(DateDiff("d", dateEnd, dateStart)) />
	<cfset local.hours2go = TimeFormat(dateEnd-dateStart, 'H') />
	<cfset min2go = TimeFormat("#dateEnd-dateStart#", "m") />
	<cfset sec2go = TimeFormat("#dateEnd-dateStart#", "s") />
	<cfset newmonths = months2go-(years2go*12) />
	<cfset tempDate = dateadd("m", months2go, dateStart) />
	<cfset newweeks = Abs(DateDiff("ww", dateEnd, tempDate)) />
	<cfset tempdays = Abs(DateDiff("d", dateEnd, tempDate)) />
	<cfset newdays = tempdays-(newweeks*7) />
	<cfset comparison = DateCompare(dateStart, dateEnd, "s") />
	<cfswitch expression="#comparison#">
	    <cfcase value="-1">
	        <cfif years2go GTE 1>
	            <cfset returnTimeRemaining = returnTimeRemaining & "#years2go#y #newmonths#m #newweeks#w #newdays#d #hours2go#h #min2go#m #sec2go#s" />
	        <cfelseif months2go GTE 1>
	            <cfset returnTimeRemaining = returnTimeRemaining & "#months2go#m #newweeks#w #newdays#d #hours2go#h #min2go#m #sec2go#s" />
	        <cfelseif weeks2go GTE 1>
	            <cfset returnTimeRemaining = returnTimeRemaining & "#weeks2go#w #newdays#d #hours2go#h #min2go#m #sec2go#s" />
	        <cfelseif hdif GTE 24>
	            <cfset returnTimeRemaining = returnTimeRemaining & "#days2go#d #hours2go#h #min2go#m #sec2go#s" />
	        <cfelseif ndif GTE 60>
	            <cfset returnTimeRemaining = returnTimeRemaining & "#hours2go#h #min2go#m #sec2go#s" />
	        <cfelseif sdif GTE 60>
	            <cfset returnTimeRemaining = returnTimeRemaining & "<span class=""boldred"">#min2go#m #sec2go#s</span>" />
	        <cfelseif sdif GTE 01>
	            <cfset returnTimeRemaining = returnTimeRemaining & "<span class=""boldred"">#sec2go#s</em>" />
	        <cfelse>
	            <cfset returnTimeRemaining = "" />
	    </cfif>
	    </cfcase>
	    <cfcase value="0">
	        <cfset returnTimeRemaining = "" />
	    </cfcase>
	    <cfcase value="1">
	        <cfset returnTimeRemaining = "Closed" />
	    </cfcase>
	</cfswitch>
	<cfreturn returnTimeRemaining>
	</cffunction>
	
	<cffunction name="getCallClosingTimeString" returnType="String">
		<cfargument name="closingDateTime" required="true">
		<cfargument name="showTimeZone" required="true">
		
		<cfset timezoneClass = createObject( "java", "java.util.TimeZone" ) />
		<cfset zoneId = "Europe/London" />
		<cfset timezone = timezoneClass.getTimeZone(javaCast( "string", zoneId )) />
		<cfset isCallClosingInDST = timezone.inDaylightTime(closingDateTime)>
		
		<cfset callClosingDateTimeString = dateformat(closingDateTime, 'dd/mm/yyyy') & ' ' & timeformat(closingDateTime, 'HH:mm')>
		<cfif showTimeZone eq 'true'>
			<cfif isCallClosingInDST>
				<cfset callClosingDateTimeString &= ' GMT+1'>
			<cfelse>
				<cfset callClosingDateTimeString &= ' GMT'>		
			</cfif>
		</cfif>
		<cfreturn callClosingDateTimeString>
	</cffunction>
	
	<cffunction name="formatFilename" returntype="any" output="false" access="public">
		<cfargument name="filename" type="any" />
		<cfset var wordDelim = "-">
			<!--- temporarily escape " " used for word separation --->
		<cfset filename=rereplace(filename," ","svphsv","ALL") />
		
		<!--- temporarily escape "-" used for word separation --->
		<cfset filename=rereplace(filename,"\#wordDelim#","svphsv","ALL") />
		
		<!--- remove all punctuation --->
		<cfset filename=rereplace(filename,"[[:punct:]]","","ALL") />
		
		<!--- escape any remaining unicode chars --->
		<cfset filename=urlEncodedFormat(filename) />
		
		<!---  put word separators " "  and "-" back in --->
		<cfset filename=rereplace(filename,"svphsv",wordDelim,"ALL") />
		
		<!--- remove an non alphanumeric chars (most likely %) --->
		<cfset filename=lcase(rereplace(filename,"[^a-zA-Z0-9\#wordDelim#]","","ALL")) />
		<cfset filename=lcase(rereplace(filename,"\#wordDelim#+",wordDelim,"ALL")) />
	
		<cfreturn filename>
	
	</cffunction>

</cfcomponent>


