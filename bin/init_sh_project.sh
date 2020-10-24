#!/bin/bash
#Copyright (c) 2020 Jan Magrot

#Permission is hereby granted, free of charge, to any person obtaining a
#copy of this software and associated documentation files (the
#'Software'), to deal in the Software without restriction, including
#without limitation the rights to use, copy, modify, merge, publish,
#distribute, sublicense, and/or sell copies of the Software, and to
#permit persons to whom the Software is furnished to do so, subject to
#the following conditions:
#The above copyright notice and this permission notice shall be included
#in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS
#OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
#CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

PROJDIR=~/projects/sh_projects/
TITLE=:
PROTOTYP=~/projects/sh_projects/init_sh_project/lib/sh_proto_project/

clear
if [ ! -d $PROJDIR ]
then
	echo
	echo Neexistuje složka pro projekty $PROJDIR.
	echo Ukončuji.
	exit 1
fi

echo Zadejte název projektu:
read -r TITLE

cd $PROJDIR || exit 1
mkdir "$TITLE"
cd "$TITLE" || exit 1
cp -rf $PROTOTYP* .
cp -rf $PROTOTYP. .
cp -rf app ./"$TITLE" && rm -rf app

year=$(date +'%Y')
app=".sh"
echo -e "#!/bin/bash\n#Copyright (c) $year Jan Magrot" > "$TITLE$app"

echo "
#Permission is hereby granted, free of charge, to any person obtaining a
#copy of this software and associated documentation files (the
#'Software'), to deal in the Software without restriction, including
#without limitation the rights to use, copy, modify, merge, publish,
#distribute, sublicense, and/or sell copies of the Software, and to
#permit persons to whom the Software is furnished to do so, subject to
#the following conditions:
#The above copyright notice and this permission notice shall be included
#in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS
#OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
#CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

exit 0
" >>"$TITLE$app"

chmod 755 "$TITLE$app"


echo "
				$TITLE 0.1.0

Syntax for changelog:
	1.x.x - Marks major change of application. Previous APIs are no longer usable.
	x.1.x - Marks added functionality to application.
	x.x.1 - Marks minor changes and improvements of an application.

	1.0.0 - Marks first usable complete version of an applications.
	< 1.0.0 - Marks development of new application
	> 1.0.0 - Marks upgrades of an existing functional application

	Each 1.x.x and x.1.x changelog record is previously and equaly planned in ROADMAP
	and has equal tests in ./tests directory.


" > changelog

# git init
git init
git add .
git commit -m "Initial commit."




connectgithub () {
	echo "connecting to $1"
	git remote add origin "$1"
	git remote -v
	git push origin master && \
	echo "
	Úspěšně napojeno na $1.
	" && touch .github || \
	echo "
	Nepodařilo se napojit na $1 !
	"
}

sleep1
while true; do
	clear
	echo "

	Chcete napojit projekt na github.com? y/n

	"
	read -r answer

	case $answer in
	y|Y)
		echo "

		Vytvořte na github.com nový repozitář bez README, License atd. a zadejte jeho URL:

		"
		read -r url
		connectgithub "$url" &&
		break
		;;
	n|N)
		:
		break
		;;
	*)
		echo "

		Neplatný znak! Prosím znovu.

		"
		sleep 1s
		;;
	esac
done

exit 0

