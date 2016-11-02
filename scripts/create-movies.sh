#grep -v "_self"  ../docs/kannada-movies.html | grep -Po '(?<=href=")[^"]*' | while read movieFileName; do movieName=$(basename $movieFileName | sed 's|\.html||Ig'); git rm -f ../docs/$movieName*; done;
git rm -f ../docs/kannada-movies.html; tempFile=$(mktemp --suffix=kan-mov); curl -Ls http://www.topbestsite.com/kannada-movies | awk '/<h2/,/\/h2>/' | sed ':a;N;$!ba;s/\n//g' | sed 's|><a href|>\n<a href|Ig;s|<\/a><\/h2>|<\/a>\n<\/h2>|Ig' | grep -v h2 | grep -Po '(?<=href=")[^"]*' | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; rm -f $tempFile; touch $tempFile; echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-kannada||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/kannada-movies.html; done; echo \<a target=\"_self\" href=\"a-to-i.html\"\>A-to-I\</a\>\<br\> >> ../docs/kannada-movies.html
git rm -f ../docs/a-to-i.html; tempFile=$(mktemp --suffix=kan-mov-a-to-i); for alphabet in {a..i}; do curl -Ls http://www.topbestsite.com/$alphabet--alphabet-kannada-movies.html | awk '/<h2/,/h2>/' | grep -Po '(?<=href=")[^"]*'; done | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep kannadamovies | uniq | `sed 's|^|curl -Ls |Ig'` | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe | sed 's|\\/|/|Ig;s|\\"|"|Ig;s|">.*<|\"><|Ig' >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html && rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-kannada||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/a-to-i.html; done; echo \<a target=\"_self\" href=\"j-to-r.html\"\>J-to-R\</a\>\<br\> >> ../docs/a-to-i.html
git rm -f ../docs/j-to-r.html; tempFile=$(mktemp --suffix=kan-mov-j-to-r); for alphabet in {j..r}; do curl -Ls http://www.topbestsite.com/$alphabet--alphabet-kannada-movies.html | awk '/<h2/,/h2>/' | grep -Po '(?<=href=")[^"]*'; done | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep kannadamovies | uniq | `sed 's|^|curl -Ls |Ig'` | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe | sed 's|\\/|/|Ig;s|\\"|"|Ig;s|">.*<|\"><|Ig' >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html && rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-kannada||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/j-to-r.html; done; echo \<a target=\"_self\" href=\"s-to-z.html\"\>S-to-Z\</a\>\<br\> >> ../docs/j-to-r.html
git rm -f ../docs/s-to-z.html.html; tempFile=$(mktemp --suffix=kan-mov-s-to-z); for alphabet in {s..z}; do curl -Ls http://www.topbestsite.com/$alphabet--alphabet-kannada-movies.html | awk '/<h2/,/h2>/' | grep -Po '(?<=href=")[^"]*'; done | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep kannadamovies | uniq | `sed 's|^|curl -Ls |Ig'` | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe | sed 's|\\/|/|Ig;s|\\"|"|Ig;s|">.*<|\"><|Ig' >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html && rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-kannada||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/s-to-z.html; done
curl -Ls http://www.topbestsite.com/123--numerical-kannada-movies.html | awk '/<h2/,/h2>/' | grep -Po '(?<=href=")[^"]*' | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep kannadamovies | uniq | `sed 's|^|curl -Ls |Ig'` | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe | sed 's|\\/|/|Ig;s|\\"|"|Ig;s|">.*<|\"><|Ig' >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html && rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-kannada||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/s-to-z.html; done
git rm -f ../docs/hindi-movies.html; tempFile=$(mktemp --suffix=hin-mov); curl -Ls http://www.topbestsite.com/hindi-movies | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep -E "http.*kannadamovies" | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-hindi||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/hindi-movies.html; done
git rm -f ../docs/tamil-movies.html; tempFile=$(mktemp --suffix=tam-mov); curl -Ls http://recenttamilmovie.weebly.com/tamil-movies | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep -E "http.*kannadamovies" | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-tamil||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/tamil-movies.html; done
git rm -f ../docs/telugu-movies.html; tempFile=$(mktemp --suffix=tel-mov); curl -Ls http://telugumv.weebly.com/telugu-movies | sed 's| class="blog-title-link blog-link"||Ig;s| title=""||Ig' | sed ':a;N;$!ba;s/\n//g' | sed 's|<h2|\n<h2|Ig;s|\/h2>|\/h2>\n|Ig' | awk '/<h2 /,/h2>/' | sed 's| target="_blank"||Ig;s|<strong>||Ig;s|<\/font><\/strong>||Ig;s|<\/span>||Ig' | perl -0777 -pe 's/<h2.*?>/<h2>/gs' | perl -0777 -pe 's/<span.*?>//gs' | perl -0777 -pe 's/<font.*?>//gs' | sed 's/.*href="\([^"]*\).*/\1/p' | grep -E "http.*kannadamovies" | uniq | while read -r episodeUrl ; do episodeName=$(basename $episodeUrl | sed 's|\.html||Ig'); curl -Ls $episodeUrl | grep '\/embed' | sed 's|<iframe|\n<iframe|Ig;s|iframe>|iframe>\n|Ig;s|> <|><|Ig' | grep iframe >> $tempFile; git rm -f ../docs/$episodeName.html; grep dailymotion $tempFile | grep -n src | sed "s|^|<p>Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; grep hqq $tempFile | grep -n src | sed "s|^|<p>Alternate_Part_|Ig" | sed 's|:<iframe|<\/p><iframe|Ig;s|\/iframe>|\/iframe><br>|Ig' >> ../docs/$episodeName.html; rm -f $tempFile && touch $tempFile && echo \<a href=\"$episodeName.html\"\>`echo $episodeName | sed 's|-telugu||Ig;s|-full||Ig;s|-movie||Ig;s|-dvdrip||Ig;s|-dvdscr||Ig;s|-dthrip||Ig;s|-hdrip||Ig;s|-dvdscr1||Ig'`\</a\>\<br\> >> ../docs/telugu-movies.html; done

