
pandoc -s chinese-index.md -t html5 -o index.html -c style.css  --include-in-header build\head.html --include-before-body build\author.html --include-before-body build\share.html --include-after-body build\stats.html --title-prefix 'BackboneApplication' --normalize --smart --toc

pause
