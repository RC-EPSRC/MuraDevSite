<cfoutput> 
	<cfset latestfeed=$.getBean("feed").loadBy(name="Latest Updates")>
	<cfset latestIterator=latestFeed.getIterator()>
	
	<cfif latestIterator.hasNext()>
			<div class="wrap">
			<h2>Latest Updates</h2>
				<div class="flexslider" id="latestupdates">
					<div class="slides">
						<div class="luwrap">
							<cfloop condition="latestIterator.hasNext()">
								<cfset latestItem=latestIterator.next()>
								<div class="events luitem">
									<h1><a href="#latestItem.getURL()#">#HTMLEditFormat(latestItem.getTitle())#</a></h1>
									<cfif len(latestItem.getImageURL(width=220, height=145))>
										<div class="image-wrap">
											<div data-alt="" data-picture="">
												<div data-src="#latestItem.getImageURL(width=220, height=145)#"></div>
							                    <div data-media="screen and (min-width: 1200px)" data-src="#latestItem.getImageURL(width=220, height=145)#"></div>
							                    <div data-media="(max-width: 767px)" data-src="#latestItem.getImageURL(width=220, height=145)#"></div>
							                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="#latestItem.getImageURL(width=220, height=145)#"></div>
							                    <noscript>
							                      <img alt="" src="#latestItem.getImageURL(width=220, height=145)#" />
							                    </noscript>
							                </div> <!-- picture -->
							                <!---<span></span>--->
										</div> <!-- image-wrap -->
									</cfif>
									<p>#latestItem.getSummary()#</p>
									<p class="meta">#dateFormat(latestItem.getValue('releaseDate'), 'dd mmm')#</p>
								</div> <!-- luitem -->
							</cfloop>
						</div> <!-- luwrap -->
					</div> <!-- slides -->
				</div> <!-- flexslider/latestupdates -->
				<div class="clear"></div>
			</div> <!-- wrap -->
	</cfif>
</cfoutput>

<cffunction name="getLuitemClass" returnType="string">

</cffunction>

<cffunction name="getItemMeta" returnType="string">

</cffunction>

<!---
<div class="primary">
      <div class="wrap">
        <h2>Latest Updates</h2>
        <div id="latestupdates" class="flexslider">
          <div class="slides">
            <div class="luwrap">

              <div class="events luitem">
                <h1><a href="#">£200m capital funding for universities</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-one.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-one.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-one.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-one.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-one.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>EPSRC Chief welcomes additional £200m of Government money for the Research Partnership Investment Fund to support university capital…</p>
                <p class="meta">22 Oct | Event</p>
              </div>
              <div class="multimedia luitem">
                <h1><a href="#">Technology to transform TV news</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-two.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-two.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-two.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-two.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-two.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>EPSRC-funded research into multi-source audiovisual production technology could revolutionise the way public-captured images…</p>
                <p class="meta">22 Oct | Press Release</p>
              </div>
              <div class="regions luitem">
                <h1><a href="#">Pioneer Magazine &ndash; 8th edition</a></h1> 
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-three.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-three.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-three.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-three.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-three.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>Research news, including using steel plant heat in Sheffield homes, predicting hit records, detecting underground pipes and testing whisky authenticity.</p> 
                <p class="meta">14 Oct | Press Release</p> 
              </div>
              <div class="sectors luitem">
                <h1><a href="#">Watson heads research at UKERC</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-one.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-one.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-one.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-one.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-one.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>Distinguished research academic Professor Jim Watson is appointed Research Director of the UK Energy Research Centre (UKERC).</p>
                <p class="meta">08 Oct | Video</p>
              </div>
              <div class="case-study luitem">
                <h1><a href="#">Technology to transform TV news</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-two.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-two.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-two.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-two.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-two.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>EPSRC-funded research into multi-source audiovisual production technology could revolutionise the way public-captured images…</p>
                <p class="meta">22 Oct | Press Release</p>
              </div>
              <div class="multimedia luitem">
                <h1><a href="#">Pioneer Magazine &ndash; 8th edition</a></h1> 
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-three.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-three.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-three.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-three.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-three.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>Research news, including using steel plant heat in Sheffield homes, predicting hit records, detecting underground pipes and testing whisky authenticity.</p> 
                <p class="meta">14 Oct | Press Release</p> 
              </div>
              <div class="studentships luitem">
                <h1><a href="#">£200m capital funding for universities</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-one.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-one.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-one.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-one.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-one.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>EPSRC Chief welcomes additional £200m of Government money for the Research Partnership Investment Fund to support university capital…</p>
                <p class="meta">22 Oct | Event</p>
              </div>
              <div class="collaborators luitem">
                <h1><a href="#">Watson heads research at UKERC</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-one.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-one.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-one.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-one.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-one.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>Distinguished research academic Professor Jim Watson is appointed Research Director of the UK Energy Research Centre (UKERC).</p>
                <p class="meta">08 Oct | Video</p>
              </div>
              <div class="sectors luitem">
                <h1><a href="#">Pioneer Magazine &ndash; 8th edition</a></h1> 
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-three.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-three.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-three.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-three.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-three.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>Research news, including using steel plant heat in Sheffield homes, predicting hit records, detecting underground pipes and testing whisky authenticity.</p> 
                <p class="meta">14 Oct | Press Release</p> 
              </div>
              <div class="events luitem">
                <h1><a href="#">£200m capital funding for universities</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-one.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-one.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-one.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-one.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-one.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>EPSRC Chief welcomes additional £200m of Government money for the Research Partnership Investment Fund to support university capital…</p>
                <p class="meta">22 Oct | Event</p>
              </div>
              <div class="news luitem">
                <h1><a href="#">Technology to transform TV news</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-two.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-two.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-two.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-two.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-two.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>EPSRC-funded research into multi-source audiovisual production technology could revolutionise the way public-captured images…</p>
                <p class="meta">22 Oct | Press Release</p>
              </div>
              <div class="research-outcomes luitem">
                <h1><a href="#">Watson heads research at UKERC</a></h1>
                <div class="image-wrap">
                  <div data-alt="" data-picture="">
                    <div data-src="/content/images/template/desktop/normal/primary-one.jpg"></div>
                    <div data-media="screen and (min-width: 1200px)" data-src="/content/images/template/desktop/wide/primary-one.jpg"></div>
                    <div data-media="(max-width: 767px)" data-src="/content/images/template/mobile/low-res/primary-one.jpg"></div>
                    <div data-media="(max-width: 768px) and (min-device-pixel-ratio: 1.5) and (-webkit-min-device-pixel-ratio: 1.5)" data-src="/content/images/template/mobile/high-res/primary-one.jpg"></div>
                    <noscript>
                      <img alt="" src="/content/images/template/desktop/normal/primary-one.jpg">
                    </noscript>
                  </div>
                  <span></span>
                </div>
                <p>Distinguished research academic Professor Jim Watson is appointed Research Director of the UK Energy Research Centre (UKERC).</p>
                <p class="meta">08 Oct | Video</p>
              </div>

            </div>
          </div>
        </div>
        
        <div class="clear"></div>
      </div>
    </div>


--->