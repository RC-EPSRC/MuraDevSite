<cfset fcUtils = CreateObject("component", "fundingCallsUtils")>

<cfset subtype=application.classExtensionManager.getSubTypeByName('Page','FundingCall',$.event('siteid'))>
<cfset extendSet=subtype.getExtendSetByName('Funding call details') />
<cfset attributesArray=extendSet.getAttributes()>
<cfloop from="1" to="#arrayLen(attributesArray)#" index="a">	
	<cfset attributeBean=attributesArray[a]/>
	<cfswitch expression="#attributeBean.getName()#">
		<cfcase value="callType">
			<cfset callTypeOptionArray = listToArray(attributeBean.getOptionList(), '^')>
			<cfset callTypeOptionLabelArray = listToArray(attributeBean.getOptionLabelList(), '^')>
		</cfcase>
		<cfcase value="callTheme">
			<cfset callThemeOptionArray = listToArray(attributeBean.getOptionList(), '^')>
			<cfset callThemeOptionLabelArray = listToArray(attributeBean.getOptionLabelList(), '^')>
		</cfcase>
		<cfdefaultcase>
		</cfdefaultcase>
	</cfswitch>
</cfloop>

<cfset showTimeZone = $.content().getValue('callsShowTimeZone')>

<cfoutput>
	<!---<p><strong><font color="red" size="5px">This section under review pending QA/UAT.<br />Please do NOT edit.</font></strong></p>--->
	<cfset listContents = getFundingCallFeed()>		
	<cfset iterator=listContents.getIterator()>	
	<section class="module text">
		<div class="callSorting">
			<form name="filters" id="filters" action="#$.getCurrentURL()#">
				<input type="hidden" name="filtersSubmitted" value="true">
				<p class="sortBy"><span>Your search has returned #Iterator.recordCount()# results.</span> Sort by: <select name="callSortBy" onchange="this.form.submit();disableFurtherInput();">
					<option value="callClosingDate"<cfif $.event('callSortBy') eq 'callClosingDate'> selected</cfif>>Closing date</option>
					<option value="callIssueDate"<cfif $.event('callSortBy') eq 'callIssueDate'> selected</cfif>>Issue date</option>
					<option value="callOpenDate"<cfif  $.event('callSortBy') eq 'callOpenDate'> selected</cfif>>Open date</option>
					
				</select>
				<select name="callSortOrder" onchange="this.form.submit();disableFurtherInput();">
					<option value="asc"<cfif $.event('callSortOrder') eq 'asc'> selected</cfif>>ascending</option>
					<option value="desc"<cfif $.event('callSortOrder') eq 'desc'> selected</cfif>>descending</option>		
				</select>
				</p>	
		</div>
		
		<cfset listContents = getFundingCallFeed()>		
		<cfset iterator=listContents.getIterator()>	 
		<cfif Iterator.recordCount()>
			<cfset iterator.setNextN(10)>
			<cfif isNumeric(listfirst($.event('fcPerPage')))>
				<cfset iterator.setNextN(listfirst($.event('fcPerPage')))>
			</cfif>  
			<cfset iterator.setPage(1)>  
			<cfif isNumeric($.event('currPage'))> 
				<cfset iterator.setPage($.event('currPage'))> 
				<cfset paginationHTML = fcUtils.makePagination(iterator.pageCount(), $.event('currPage'), 'top', $)>
			<cfelse>
				<cfset paginationHTML = fcUtils.makePagination(iterator.pageCount(), 1, 'top', $)>
			</cfif>
			<p class="paginationContainerTop">
				#paginationHTML#
			</p>
			<div class="clear"></div>
			<cfloop condition="iterator.hasNext()">
				<cfset item=iterator.next()>
				<cfset closingDateTime = item.getValue('callClosingDate')>
				<cfset timeRemaining = fcUtils.getPretifiedDateDiff(now(),closingDateTime)>
				<cfset status = "">
				<cfset callThemeStr = "">
				<cfset callThemeArray = listToArray(item.getValue('callTheme'), ',')>
	            <cfset arrLen = arrayLen(callThemeArray)>
	        	<cfloop from="1" to="#arrLen#" index="i">
	        		<cfset callThemeStr &= '<a href="/callThemeLinks/#fcUtils.formatFilename(callThemeArray[i])#" target="_blank" title="Opens in new window">#callThemeArray[i]#</a>'>
	        		<cfif i neq arrLen>
	        			<cfset callThemeStr &= ', '>
	        		</cfif>
				</cfloop>
				
				<cfif item.getValue('callOpenDate') GT now()>
					<cfset status = 'Future'>
				<cfelseif closingDateTime LT now()>
					<cfset status = 'Closed'>
				<cfelse>
					<cfset status = 'Open'>
				</cfif>
				<article class="listing">
					<h1><a href="#item.getURL()#"><cfif isUserLoggedIn()>ID: #item.getValue('callUniqueID')# - </cfif>#item.getValue('title')#</a></h1>
					<ul class="meta">
						<cfif timeRemaining NEQ 'Closed'>
				            <li class="timeLeft">Time remaining : #fcUtils.getPretifiedDateDiff(now(),closingDateTime)#</li>
						</cfif>
						<li class="status">Status: #status#</li>
						<li class="issue">Issue date: #dateformat(item.getValue('callIssueDate'), 'dd/mm/yyyy')#</li>
			            <li class="open">Open date: #dateformat(item.getValue('callOpenDate'), 'dd/mm/yyyy')#</li>
			            <li class="closing">Closing date: #fcUtils.getCallClosingTimeString(closingDateTime, showTimeZone)#</li>
			            <li class="type">Call type: #item.getValue('callType')#</li>
			            <li class="related">Call themes: #callThemeStr#</li>
					</ul>
		            #item.getValue('summary')#
				</article>
			</cfloop>
			<cfif isNumeric($.event('currPage'))> 
				<cfset iterator.setPage($.event('currPage'))> 
				<cfset paginationHTML = fcUtils.makePagination(iterator.pageCount(), $.event('currPage'), 'bottom', $)>
			<cfelse>
				<cfset paginationHTML = fcUtils.makePagination(iterator.pageCount(), 1, 'bottom', $)>
			</cfif>
			<p class="paginationContainer bottom">
				#paginationHTML#
			</p>
		<cfelse>
			<input type="hidden" name="fcPerPage" value="#listFirst($.event('fcPerPage'))#">
			<p>Sorry, there were no matches for your filter criteria, please try again.</p>
		</cfif>
	</section>
</div>
<aside>
	<h2 class="FCfilters">Filter funding calls</h2>
	
	<p class="showAllFundingCalls"><a href="##" onclick="clearBoxes('aside','filters');">Show all funding calls</a></p>
		<section id="callYear">
			<h2 class="FCfilters">Year<span class="clearForm"><a href="##" onclick="clearBoxes('##callYear','filters');">Clear</a></span></h2>
			<cfset yearPart = datePart("YYYY", now())>
			<cfset yearPart = yearPart + $.content().getValue('callsFilterOptionYears')>
			<cfset noOfYears = 3 + $.content().getValue('callsFilterOptionYears')>
			<cfloop from="1" to="#noOfYears#" index="i">
				<input type="checkbox" name="callYear" value="#yearPart#" <cfif findnocase(yearPart, $.event('callYear'))>checked </cfif>onclick="this.form.submit();disableFurtherInput();">#yearPart#<cfif i eq noOfYears> and before</cfif><br />
				<cfset yearPart -= 1>
			</cfloop>
			<br />
		</section>
		<section id="callStatus">
			<h2 class="FCfilters">Status<span class="clearForm"><a href="##" onclick="clearBoxes('##callStatus','filters');">Clear</a></span></h2>
				<input type="checkbox" name="callStatus" value="Open" <cfif findNoCase('open', $.event('callStatus'))>checked <cfelseif not len($.event('callStatus')) and not len($.event('filtersSubmitted'))> checked </cfif>onclick="this.form.submit();disableFurtherInput();">Open<br />
				<input type="checkbox" name="callStatus" value="Closed" <cfif findNoCase('closed', $.event('callStatus'))>checked </cfif>onclick="this.form.submit();disableFurtherInput();">Closed<br />
				<input type="checkbox" name="callStatus" value="Future" <cfif findNoCase('future', $.event('callStatus'))>checked </cfif>onclick="this.form.submit();disableFurtherInput();">Future<br />
				<br />
		</section>
		<section id="callTypes">
			<h2 class="FCfilters">Call Types<span class="clearForm"><a href="##" onclick="clearBoxes('##callTypes','filters');">Clear</a></span></h2>
			<cfloop index="i" from="1" to="#arrayLen(callTypeOptionArray)#">
				<input type="checkbox" name="callType" value="#callTypeOptionArray[i]#" <cfif findnocase(callTypeOptionArray[i],$.event('callType'))>checked </cfif>onclick="this.form.submit();disableFurtherInput();">#callTypeOptionLabelArray[i]#<br />
			</cfloop>
			<br />
		</section>
		<section id="callThemes">
			<h2 class="FCfilters">Related themes<span class="clearForm"><a href="##" onclick="clearBoxes('##callThemes','filters');">Clear</a></span></h2>
			<cfloop index="i" from="1" to="#arrayLen(callThemeOptionArray)#">
				<input type="checkbox" name="callTheme" value="#callThemeOptionArray[i]#" <cfif findnocase(callThemeOptionArray[i],$.event('callTheme'))>checked </cfif>onclick="this.form.submit();disableFurtherInput();">#callThemeOptionLabelArray[i]#<br />
			</cfloop>
			<br />
		</section>
		<div class="submitButton">
			<input type="submit" value="Search">
		</div>
	</form>
	#$.dspObjects(3)#
</aside>
<div class="clear"></div>

</cfoutput>

<script>
	function disableFurtherInput()
	{
		$('body').css('cursor', 'progress'); 
		$("input").attr("disabled", true);
		$("select").attr("disabled", true);
	}
	function clearBoxes(boxSection,formID)
	{
		$(boxSection + ' :checked').removeAttr('checked');
		document.getElementById(formID).submit();
		disableFurtherInput();
	}
	function setAndClearBoxes(boxSection,formID,setSection)
	{
		$(boxSection + ' :checked').removeAttr('checked');
		$(setSection + ' input').attr('checked','checked');
		document.getElementById(formID).submit();
		disableFurtherInput();
	}
	$( document ).ready(function() {
		var $selects=$('.top,.bottom').change(function(){
		    $selects.not(this).val( $(this).val() );
		    document.getElementById("filters").submit();
		    disableFurtherInput();
		})
		$('.submitButton').hide();
		$('.clearForm').show();
		$('.showAllFundingCalls').show();
		$('#content aside section h2').css('width', '100%');
	})
</script>


<cfscript>
	 public any function getFundingCallFeed($){
	 	
		
		  
		var feed = getBean("feed");

        feed.setSiteID(session.siteid);
        feed.setMaxItems(0);
		feed.addParam(field="tcontent.parentid", criteria="#$.content('contentID')#");
		  
        if (len($.event('callSortBy'))){
        	feed.setSortBy($.event('callSortBy'));
        } else {
        	feed.setSortBy('callClosingDate'); 
        };
        if (len($.event('callSortOrder'))){
	        feed.setSortDirection($.event('callSortOrder'));
	    }else{
		    feed.setSortDirection('asc');
        };
        
        
        
        if (len($.event('callType'))) {
            feed.addParam(relationship="and"
	          ,field="callType"
	          ,criteria=trim($.event('callType'))
	          ,condition="IN"
	          ,dataType="varchar")
        }
        if ( len($.event('callTheme')) ) {
			feed.addParam(relationship="andOpenGrouping"); 
			var i = 0;
			var callThemesArray = ListToArray($.event('callTheme'), ',');
			var l = arrayLen(callThemesArray);
			for (i = 1; i lte l; i = i + 1)
				{
					feed.addParam(relationship="or"
			        	,field="callTheme"
						,criteria=trim(callThemesArray[i])
						,condition="CONTAINS"
						,dataType="varchar")
			    }
			feed.addParam(relationship="closeGrouping");
			}
        if (len($.event('callYear')) ) {
            feed.addParam(relationship="andOpenGrouping"); 
			var i = 0;
			var callYearsArray = ListToArray($.event('callYear'), ',');
			var l = arrayLen(callYearsArray);
			for (i = 1; i lte l; i = i + 1)  
				{
					if (trim(callYearsArray[i]) eq (datePart("YYYY", now())-2)){
					feed.addParam(relationship="or"
			        	,field="callIssueDate"
						,criteria=trim(callYearsArray[i]+1)
						,condition="LT"
						,dataType="varchar")	
					}
					else
					{
					feed.addParam(relationship="or"
			        	,field="callIssueDate"
						,criteria=trim(callYearsArray[i])
						,condition="contains"
						,dataType="varchar")
					}
			    }
			feed.addParam(relationship="closeGrouping");
			}
		if (len($.event('callStatus'))) {
			if( not(findnocase('Future', $.event('callStatus')) and findnocase('Open', $.event('callStatus')) and findnocase('Closed', $.event('callStatus')) )){
				feed.addParam(relationship="andOpenGrouping");
				if(findnocase('Open', $.event('callStatus'))){
					feed.addParam(relationship="OpenGrouping");
						feed.addParam(relationship="and"
					        	,field="callOpenDate"
								,criteria=createODBCDateTime(now())
								,condition="LTE"
								,dataType="date")
							feed.addParam(relationship="and"
						        	,field="callClosingDate"
									,criteria=createODBCDateTime(now())
									,condition="GTE"
									,dataType="timestamp")							
					feed.addParam(relationship="closeGrouping");
				}
				if(findnocase('Future', $.event('callStatus'))){
					feed.addParam(relationship="or"
				        	,field="callOpenDate"
							,criteria=createODBCDateTime(now())
							,condition="GT"
							,dataType="date")
				}
				if(findnocase('Closed', $.event('callStatus'))){
					feed.addParam(relationship="or"
				        	,field="callClosingDate"
							,criteria=now()
							,condition="LT"
							,dataType="date")
				}
				feed.addParam(relationship="closeGrouping");
			}
		}
		elseif (not len($.event('filtersSubmitted')))
		{
			feed.addParam(relationship="andOpenGrouping");
				feed.addParam(relationship="and"
			        	,field="callOpenDate"
						,criteria=createODBCDateTime(now())
						,condition="LT"
						,dataType="date")
				feed.addParam(relationship="and"
			        	,field="callClosingDate"
						,criteria=createODBCDateTime(now())
						,condition="GT"
						,dataType="timestamp")
			feed.addParam(relationship="closeGrouping");
		}

     return feed;
     
     }
</cfscript>




