url=http://www.topbestsite.com/reality-shows.html; rm -f ../docs/reality-shows.html; curl -Ls $url | awk '/\"\/reality-/,/hows>>/' | sed -n 's/.*href="\([^"]*\).*/\1/p' | sed 's|^\/|http://www.topbestsite.com/|Ig;/shows\.html$/d' | while read showUrl; do showNameUrl=$(basename $showUrl | sed 's|\.html||g'); echo '<a href="'$showNameUrl'_01.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows.html; i=1; curl -Ls $showUrl | awk '/<h2\s/,/h2>/' | sed -n 's/.*href="\([^"]*\).*/\1/p' | cut -f1 | paste -d "," - - - - - | while read episodes; do printf -v j "%02d" $i; rm -f ../docs/${showNameUrl}_${j}.html; echo $episodes | tr "," "\n" | sed '/^\s*$/d' | while read episodeUrl; do [ "$episodeUrl" == "stop" ] && { break; } ; episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | sed -n 's/.*\ssrc="\([^?]*\).*/\1/p' | while read -r dailymotionurl ; do youtube-dl --no-warnings -q -i -s $dailymotionurl 2>/dev/null; if [ $? -eq 0 ]; then grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/${showNameUrl}_${j}.html; fi; done; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/${showNameUrl}_${j}.html; rm -f y; done; printf -v k "%02d" $(( i + 1 )); echo '<a target="_self" href="'${showNameUrl}_${k}'.html">'${showNameUrl}_${k}'</a><br>' >> ../docs/${showNameUrl}_${j}.html; i=$(( i + 1 )); done; sed -i '/_self/d' ../docs/`ls -t ../docs/. | awk '{printf("%s",$0);exit}'`; done
#awk '/Recently/,/8\.html/'
#url=http://zeekannada.weebly.com/murali-military-hotel; showNameUrl=$(basename $url | sed 's|\.html||g'); i=1; curl -Ls $url | awk '/<h2\s/,/h2>/' | sed -n 's/.*href="\([^"]*\).*/\1/p' | cut -f1 | paste -d "," - - - - - | while read episodes; do printf -v j "%02d" $i; rm -f ../docs/${showNameUrl}_${j}.html; echo $episodes | tr "," "\n" | sed '/^\s*$/d' | while read episodeUrl; do [ "$episodeUrl" == "stop" ] && { break; } ; episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | sed -n 's/.*\ssrc="\([^?]*\).*/\1/p' | while read -r dailymotionurl ; do youtube-dl --no-warnings -q -i -s $dailymotionurl 2>/dev/null; if [ $? -eq 0 ]; then grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/${showNameUrl}_${j}.html; fi; done; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/${showNameUrl}_${j}.html; rm -f y; done; printf -v k "%02d" $(( i + 1 )); echo '<a target="_self" href="'${showNameUrl}_${k}'.html">'${showNameUrl}_${k}'</a><br>' >> ../docs/${showNameUrl}_${j}.html; i=$(( i + 1 )); done; sed -i '/_self/d' ../docs/`ls -t ../docs/. | awk '{printf("%s",$0);exit}'`
#url=http://www.topbestsite.com/action-star.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/action-star.html
#url=http://www.topbestsite.com/dance-dance.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/dance-dance.html
#url=http://www.topbestsite.com/super-minute--season-2.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/super-minute--season-2.html
#url=http://www.topbestsite.com/sa-re-ga-ma-pa-season-11.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/sa-re-ga-ma-pa-season-11.html
#url=http://www.topbestsite.com/weekend-with-ramesh-season-2.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/weekend-with-ramesh-season-2.html
#url=http://www.topbestsite.com/bigg-boss-kannada--season-3.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/bigg-boss-kannada--season-3.html
#url=http://topbestsite1.weebly.com/sye-to-dance; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/sye-to-dance.html
#url=http://www.topbestsite.com/super-jodi8236.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/super-jodi8236.html
#url=http://topbestsite1.weebly.com/bengaluru-benne-dose; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/bengaluru-benne-dose.html
#url=http://www.topbestsite.com/sa-re-ga-ma-pa-lil-champs-season-10.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/sa-re-ga-ma-pa-lil-champs-season-10.html
#url=http://www.topbestsite.com/majaa-talkies.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/majaa-talkies.html
#url=http://www.topbestsite.com/halli-hyda-pyateg-banda-season-2; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/halli-hyda-pyateg-banda-season-2.html
#url=http://www.topbestsite.com/putani-pantru-season-2.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/putani-pantru-season-2.html
#url=http://www.topbestsite.com/simpallagondu-singing-show.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/simpallagondu-singing-show.html
#url=http://www.topbestsite.com/dancing-star-junior; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/dancing-star-junior.html
#url=http://www.topbestsite.com/nam-deshad-kathe.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/nam-deshad-kathe.html
#url=http://www.topbestsite.com/dancing-star-2.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/dancing-star-2.html
#url=http://www.topbestsite.com/nirbhaya.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/nirbhaya.html
#url=http://www.topbestsite.com/indias-got-talent-6.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/indias-got-talent-6.html
#url=http://www.topbestsite.com/swalpa-adjust-madkoli.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/swalpa-adjust-madkoli.html
#url=http://www.topbestsite.com/life-super-guru--all-videos.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/life-super-guru--all-videos.html
#url=http://www.topbestsite.com/divided.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/divided.html
#url=http://www.topbestsite.com/khatron-ke-khiladi-season-6.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/khatron-ke-khiladi-season-6.html
#url=http://www.topbestsite.com/bigg-boss-kannada--2.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/bigg-boss-kannada--2.html
#url=http://www.topbestsite.com/pyate-hudgir-halli-life.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/pyate-hudgir-halli-life.html
#url=http://www.topbestsite.com/super-minute--season-2.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/super-minute--season-2.html
#url=http://www.topbestsite.com/bigg-boss-8.html; showNameUrl=$(basename $url | sed 's|\.html||g'); echo '<a href="'$showNameUrl'.html">'$showNameUrl'</a><br>' >> ../docs/reality-shows-completed.html; curl -Ls $url | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep http | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed -n 's|.*\(<iframe[^<]*</iframe>\)|\1|p' | sed 's|<\/div>||Ig' >> y; grep dailymotion y | grep -n src | sed "s|^|<p>${episodeName}_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; grep hqq y | grep -n src | sed "s|^|<p>${episodeName}_Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig'; rm -f y; done >> ../docs/bigg-boss-8.html
