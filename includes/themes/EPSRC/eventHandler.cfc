<!--- Be sure to reload Mura after making any changes or adding methods here. A site's local eventHandler.cfc does not need to be reinitialized via appreload, only theme-specific ones (like this) --->
<cfcomponent extends="mura.cfobject" output="false">

	<cffunction name="onRequestStart" output="false">
		<cfargument name="$" hint="mura scope" />
		<cfscript>
			// http://dominicwatson.github.com/cfstatic/full-guide.html
			// minifyMode: none,file,package,all
			// if in production, set checkForUpdates=false
			arguments.$.static(
				outputDirectory = 'compiled'
				, minifyMode = 'package' 
				, checkForUpdates = arguments.$.siteConfig('cache')
			);
		</cfscript>
	</cffunction>

	<cffunction name="onRenderStart" output="false">
		<cfargument name="$" hint="mura scope" />
		<cfscript>
			var renderer = arguments.$.getContentRenderer();

			// general vars
			renderer.jsLibLoaded = true;
			renderer.generalWrapperClass = 'well';

			// heading vars
			renderer.headline = 'h1';
			renderer.subHead1 = 'h2';
			renderer.subHead2 = 'h3';
			renderer.subHead3 = 'h4';
			renderer.subHead4 = 'h5';
			renderer.subHead5 = 'h6';

			// nav and list item vars
			renderer.navWrapperClass = 'well';
			renderer.liHasKidsClass = '';
			renderer.liHasKidsCustomString = '';
			renderer.liCurrentClass = 'active';
			renderer.liCurrentCustomString = '';
			renderer.aHasKidsClass = '';
			renderer.aHasKidsCustomString = '';
			renderer.aCurrentClass = 'active';
			renderer.aCurrentCustomString = '';
			renderer.ulTopClass = 'nav nav-list';
			renderer.ulNestedClass = 'nav nav-list';
			renderer.ulNestedCustomString = '';
			renderer.liNestedClass = '';

			// pagination vars
			renderer.ulPaginationClass = '';
			renderer.ulPaginationWrapperClass = 'pagination';

			// form vars
			renderer.formWrapperClass = 'well';
		</cfscript>
	</cffunction>
	
	<cffunction name="onPageEventBodyRender">
	<cfargument name="$">
	<!--- <cfset $.addToHTMLHeadQueue('jquery_ui.cfm')> <!--- Dynamically load the associated CSS and javascript defined in this file --->
	<cfset $.loadShadowBoxJS()> <!--- Load the shadowbox javascript for our associated image --->
	--->
	<cfoutput> 
	<!--- Now output the following extended attributes using this markup. The <cfif>'s are used to make sure a value exists before outputting it. No value = no output. --->
		<section class="event-data">
          <dl>
	          <cfif len($.content('displayStop'))>
	            <dt>Start:</dt>
	            <dd>#dateformat($.content('displayStart'),'dd mmm yyyy')# </dd>
	            <dt>End:</dt>
	            <dd>#dateformat($.content('displayStop'),'dd mmm yyyy')#</dd>
	          <cfelse>
	          	<dt>Date:</dt>
	            <dd>#dateformat($.content('displayStart'),'dd mmm yyyy')# </dd>          
	            </cfif>  
	          <cfif len($.content('venue'))>
	            <dt>Venue:</dt>
	            <dd>#$.content('venue')#</dd>
	          </cfif>
            <dt>Type:</dt>
            <dd>#$.content('eventType')#</dd>
            <cfif len($.content('tags'))>
	            <dt>Related Themes:</dt>
	            <dd>#$.content('tags')#</dd>
            </cfif>
          </dl>
        </section>

		<section class="event-tabs">
			<ul class="the-tabs">
				<li class="overview"><span>Overview</span></li>
				<li class="location"><span>Location</span></li>
				<li class="agenda"><span>Agenda</span></li>
			</ul>
			<div class="overview">
				<h2>Overview</h2>
				<cfif len($.content('overview'))>#$.content('overview')#</cfif>
			</div>
			<div class="location">
				<h2>Location</h2>
				<cfif len($.content('location'))>#$.content('location')#</cfif>
			</div>
			<div class="agenda">
				<h2>Agenda</h2>
				<cfif len($.content('agenda'))>#$.content('agenda')#</cfif>
			</div>		
		</section>
	</cfoutput>
</cffunction>

	<cffunction name="onPageStaffBodyRender">
	<cfargument name="$">
	<cfoutput> 
	<!--- Now output the following extended attributes using this markup. The <cfif>'s are used to make sure a value exists before outputting it. No value = no output. --->
		<section class="contact detail">
		<img src="#$.content().getImageURL(height=152,width=205)#"  alt="" style="float:left;"/>
          <dl class="staff">
            <dt>Job title:</dt>
            <dd>#$.content('jobTitle')# </dd>
            <dt>Department:</dt>
            <dd>#$.content('department')#</dd>
            <dt>Job functions:</dt>
            <dd>#$.content('jobFunctions')#</dd>
            <dt>Tel:</dt>
            <dd>#$.content('telNo')#</dd>
            <dt>Email:</dt>
            <dd>#$.content('emailAddress')#</dd>
            <cfif len($.content('skypeName'))>
	            <dt>Skype:</dt>
	            <dd>#$.content('skypeName')#</dd>
            </cfif>
          </dl>
        </section>

		<section>
			<cfif len($.content('body'))>
				<h2> Biography</h2>
				#$.content('body')#
			</cfif>
		</section>
	</cfoutput>
</cffunction>

	<cffunction name="onPageDefaultBodyRender" output="true" returntype="void">
		<cfargument name="$"  hint="mura scope" />

		<cfoutput>#parseForLinks($.setDynamicContent($.content("body")))#</cfoutput>
	</cffunction>

	<cffunction name="parseForLinks" output="false" returntype="string">
		<cfargument name="str" hint="the body as a string"/>
		<cfset var body = arguments.str>
		<cfset body = '<div id="XYZ123">' & body & '</div>' />
		<cfreturn body/>
	</cffunction>


<cfscript>
	public any function onBeforePageFundingCallSave($) {
		var newBean = arguments.$.event('newBean');
		var oldBean = arguments.$.event('contentBean');		
		if (len(newBean.getValue('callIssueDate')) eq 10){
			var IssueDate = LSParseDateTime(newBean.getValue('callIssueDate'));
		    var OpenDate = LSParseDateTime(newBean.getValue('callOpenDate'));
			var ClosingDate = LSParseDateTime(newBean.getValue('callClosingDate'));
		}else{
			var IssueDate = newBean.getValue('callIssueDate');
		    var OpenDate = newBean.getValue('callOpenDate');
			var ClosingDate = newBean.getValue('callClosingDate');
		};
		var errors = {};
		if (issueDate lte openDate and openDate lt closingDate){
			///all OK
		} else {
			var errors = {
			'Error1': 'Please check your issue/open/closing dates to ensure they are chronological'
			};
		}
		if (not(len(newBean.getValue('callTheme')))){
			errors = {
			'Error2': 'Please select at least one call theme'
			};
		}	
		if (len(newBean.getValue('callClosingTime')) NEQ 5 or 
			findnocase(':',newBean.getValue('callClosingTime')) neq 3 or 
			not(isNumeric(left(newBean.getValue('callClosingTime'), 2))) or
			not(isNumeric(right(newBean.getValue('callClosingTime'), 2)))){
			errors = {
			'Error3': 'Please check your call closing time is entered in 24H format (HH:MM), including a separating colon (:)'
			};
		}
		
		if ( !StructIsEmpty(errors) ) {
			for ( error in errors ) {
				arguments.$.event('contentBean').getErrors()[error] = errors[error];
			}
		} else {
			if(len(newBean.getValue('callClosingDate')) eq 10){
				closingDateTime = LSParseDateTime(newBean.getValue('callClosingDate'));
			}else{
				closingDateTime = newBean.getValue('callClosingDate');
			}
			closingDateTime = dateadd('H',listfirst(newBean.getValue('callClosingTime'), ':'), closingDateTime);
			closingDateTime = dateadd('n',listlast(newBean.getValue('callClosingTime'), ':'), closingDateTime);
			newBean.setValue('callClosingDate',closingDateTime);
		}
	}
</cfscript>


</cfcomponent>