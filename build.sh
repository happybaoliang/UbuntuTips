pandoc -f markdown -t rst -o source/0-introduction.rst source/0-introduction.md
pandoc -f markdown -t rst -o source/1-basic.rst source/1-basic.md
pandoc -f markdown -t rst -o source/2-application.rst source/2-application.md
pandoc -f markdown -t rst -o source/3-accademy.rst source/3-accademy.md

make latexpdf
