
pandoc -s chinese-index.md -t html5 -o index.html -c style.css --title-prefix 'Developing Backbone.js Applications'  --include-after-body afterbody.html --normalize --smart --toc

pause
