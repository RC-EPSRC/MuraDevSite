<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->

<!--- This outputs peer nav and the sub nav of the page you are on if there is any. 
        It omits top level nav for the sake of redundancy and dead-ends if there is no 
		content below the page you are on. Usually works best when used in conjunction with 
		the breadcrumb nav since it changes as you get deeper into a site. --->
<cfoutput>
	<nav id="navMultilevel"<cfif this.navWrapperClass neq ""> class="#this.navWrapperClass#"</cfif> data-id="multinav-themelevel">
		#dspNestedNav(
			contentID=variables.$.getTopVar("contentID"),
			viewDepth=4,
			currDepth=1,
			aCurrentClass="active",
			aHasKidsClass="more",
			sortBy=variables.$.getTopVar("sortBy"),
			sortDirection=variables.$.getTopVar("sortDirection"),
			subNavExpression="listFindNoCase('Page,Calendar,File',rsSection.type) and 
			                  listFind(variables.$.content('path'),rsSection.contentID) and 
			                  arguments.currDepth lt arguments.viewDepth"
		)#
		<!--- FROM Site-Level.... 
		#dspNestedNav(
		    contentID=variables.$.getTopVar("contentID"),
		    viewDepth=4,
		    currDepth=1,
		    sortBy=variables.$.getTopVar("sortBy"),
		    sortDirection=variables.$.getTopVar("sortDirection"),
		    subNavExpression="listFindNoCase('Page,Calendar',rsSection.type) and 
		    listFind(variables.$.content('path'),rsSection.contentID) and 
			arguments.currDepth lt arguments.viewDepth"
		)#
		 --->
	</nav>
</cfoutput>
<!---
<cfargument name="contentid" type="string" >
<cfargument name="viewDepth" type="numeric" required="true" default="1">
<cfargument name="currDepth" type="numeric"  required="true"  default="1">
<cfargument name="type" type="string"  default="default">
<cfargument name="today" type="date"  default="#now()#">
<cfargument name="class" type="string" default="#this.ulTopClass#">
<cfargument name="querystring" type="string" default="">
<cfargument name="sortBy" type="string" default="orderno">
<cfargument name="sortDirection" type="string" default="asc">
<cfargument name="context" type="string" default="#application.configBean.getContext()#">
<cfargument name="stub" type="string" default="#application.configBean.getStub()#">
<cfargument name="categoryID" type="string" default="">
<cfargument name="relatedID" type="string" default="">
<cfargument name="rs" required="true" default="">
<cfargument name="subNavExpression" required="true" default="">
<cfargument name="liHasKidsClass" required="true" default="#this.liHasKidsClass#">
<cfargument name="liHasKidsCustomString" required="true" default="#this.liHasKidsCustomString#">
<cfargument name="liCurrentClass" required="true" default="#this.liCurrentClass#">
<cfargument name="liCurrentCustomString" required="true" default="#this.liCurrentCustomString#">
<cfargument name="aHasKidsClass" required="true" default="#this.aHasKidsClass#">
<cfargument name="aHasKidsCustomString" required="true" default="#this.aHasKidsCustomString#">
<cfargument name="aCurrentClass" required="true" default="#this.aCurrentClass#">
<cfargument name="aCurrentCustomString" required="true" default="#this.aCurrentCustomString#">
<cfargument name="ulNestedClass" required="true" default="#this.ulNestedClass#">
<cfargument name="ulNestedCustomString" required="true" default="#this.ulNestedCustomString#">
<cfargument name="openCurrentOnly" required="true" default="false">--->


