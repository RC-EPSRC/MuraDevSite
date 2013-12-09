<!--
	To add mobile-specific content fields to your Edit Content screen:
	1) Uncomment the extension type='base' node below with the 'Mobile Options' in it
	2) Reload Application
	3) That's it!
-->
<theme>
	<extensions>
		<extension type="Folder" subType="FundingCalls">
			<attributeset name="Settings" container="Basic">
				<attribute 
					name="callsFilterOptionYears"
					label="Number of future years shown in filtering options"
					hint=""
					type="selectbox"
					defaultValue="0"
					required="false"
					validation=""
					regex=""
					message=""
					optionList="0^1^2^3^4^5^6^7^8^9^10"
					optionLabelList="0^1^2^3^4^5^6^7^8^9^10" />
				<attribute 
					name="callsShowTimeZone"
					label="Display timezone information on call closing date"
					hint="When set to 'Yes' GMT or BST will be displayed next to the closing date/time in the call listing and details page"
					type="selectBox"
					defaultValue="false"
					required="false"
					validation=""
					regex=""
					message=""
					optionList="false^true"
					optionLabelList="No^Yes" />
			</attributeset>
		</extension>
		<extension type="Page" subType="FundingCall">
			<attributeset name="Funding call details" container="Basic">
			<attribute 
					name="callIssueDate"
					label="Issue date"
					hint="Enter an issue date for this Fundng Call, normally when the page is published."
					type="textbox"
					defaultValue="[mura]#dateformat(now(), 'dd/mm/yyyy')#[/mura]"
					required="true"
					validation="Date"
					regex=""
					message="Please enter an issue date"
					optionList=""
					optionLabelList="" />
				<attribute 
					name="callOpenDate"
					label="Opening date"
					hint="Enter an opening date for this Funding Call"
					type="textbox"
					defaultValue="[mura]#dateformat(now(), 'dd/mm/yyyy')#[/mura]"
					required="true"
					validation="Date"
					regex=""
					message="Please enter an opening date"
					optionList=""
					optionLabelList="" />
				<attribute 
					name="callClosingDate"
					label="Closing date"
					hint="Enter a closing date for this funding Call"
					type="textbox"
					defaultValue="[mura]#dateformat(now(), 'dd/mm/yyyy')#[/mura]"
					required="true"
					validation="Date"
					regex=""
					message="Please enter a closing date"
					optionList=""
					optionLabelList="" />	
				<attribute 
					name="callClosingTime"
					label="Closing time"
					hint="Please enter a time in 24-hour format (HH:MM) for the time on the above date that the call closes"
					type="textbox"
					defaultValue="17:00"
					required="true"
					validation=""
					regex=""
					message="Please enter a closing time"
					optionList=""
					optionLabelList="" />					
				<attribute 
					name="callType"
					label="Call type"
					hint="Select a type for this Funding Call"
					type="SelectBox"
					defaultValue=""
					required="false"
					validation=""
					regex=""
					message=""
					optionList="Invitation for proposals^Invitation for outlines^Expresion of interest^Call for participants^Call for nominations^Collaborative research^Invitation for tenders"
					optionLabelList="Invitation for proposals^Invitation for outlines^Expresion of interest^Call for participants^Call for nominations^Collaborative research^Invitation for tenders" />
				<attribute 
					name="callTheme"
					label="Call theme"
					hint="Select one or more themes for this call. Use CTRL/CMD-click to select more than one theme."
					type="multiSelectBox"
					defaultValue=""
					required="false"
					validation=""
					regex=""
					message=""
					optionList="Digital economy^Energy^Engineering^Global uncertainties^Healthcare technologies^Information and communication technologies(ICT)^Living with environmental change (LWEC)^Manufacturing the future^Mathematical sciences"
					optionLabelList="Digital economy^Energy^Engineering^Global uncertainties^Healthcare technologies^Information and communication technologies(ICT)^Living with environmental change (LWEC)^Manufacturing the future^Mathematical sciences" />
				<attribute 
					name="callUniqueID"
					label="Unique ID"
					hint="This is used by the CMS admin to reference external systems, such as GoW/RoS."
					type="textbox"
					defaultValue=""
					required="false"
					validation=""
					regex=""
					message=""
					optionList=""
					optionLabelList="" />
			</attributeset>
		</extension>

	</extensions>
</theme>