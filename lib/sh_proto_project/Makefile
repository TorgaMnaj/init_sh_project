#! /usr/bin/make -f

help:  		## This help dialog.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

tests_bash:  	## Run bash scripts tests
	bash ./.devbin/shtests.sh

commit:  	## Test and commit changes to git and push on github
	bash ./.devbin/bigcommit.sh
