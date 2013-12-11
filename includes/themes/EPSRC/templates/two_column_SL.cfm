<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">
    
    	<div class="main_container"><!-- encompasses whole browser window eg for control of this area if needed-->

                    <div class="container"><!-- Page proper starts -->
                    
						<cfinclude template="inc/navbar.cfm" />
            
<!-- ---------------------------------------------------------- CENTRAL CONTENT ---------------------------------------------------------------- -->
            			<div class="clear"></div>
 <!-- -------------------------------------------------------- START LEFTHAND NAV  -------------------------------------------------------------- -->
                        <div class="wrap">
                        	<nav class="tertiary col-md-3">
                            	<ul>
                                	<li><a href="##">Level 1 &##160; </a>
                                    	<ul>
                                        	<li><a href="##">Level 2</a>
                                            	<ul>
                                                	<li><a href="##">Level 3</a>
														<ul>
                                                        	<li><a href="##">Level 4</a>
                                                            	<ul>
                                                                	<li><a href="##">Level 5</a>
                                                                    	<ul>
                                                                        	<li><a href="##" class="open">Level 6</a>
                                                                            	<ul class="subpages">
                                                                                	<li><a href="##">Subpage 1</a></li>
                                                                                    <li><a href="##">Subpage 2</a></li>
                                                                                </ul>
                                                                        		<ul>
                                                                    				<li><a href="##" class="active ">Level 7</a></li>
                                                                				</ul>
                                                            				</li>
                                                                        </ul>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div> <!-- End of .wrap DIV -->
   <!-- --------------------------------------------------------- END LEFTHAND NAV  ----------------------------------------------------------- -->  
                       </div><!-- end container center -->
                    
            		<div class="push"></div><!-- div needed for sticky footer -->
        </div><!-- end main_container (encompasses whole browser window eg for control of this area if needed) -->          
            
			<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>