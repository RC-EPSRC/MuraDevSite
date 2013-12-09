<cfoutput><form name="searchFrm" id="svSearchForm"  method="get" action="#$.content().getURL()#" >
<#variables.$.getHeaderTag('subHead1')#>
<label for="search">Search this folder</label>
</#variables.$.getHeaderTag('subHead1')#>
<input id="search" class="text" name="keywords" type="text" value="#HTMLEditFormat(request.keywords)#" alt="search"/>
<input name="newSearch" value="true" type="hidden"/>
<input type="hidden" name="searchSectionID" value="#$.content().getContentID()#"/>
<input type="hidden" name="display" value="search"/>
<input type="hidden" name="nocache" value="1"/>
<input type="submit" value="Go" class="submit"/>
</form>
</cfoutput>