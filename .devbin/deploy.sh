#!/bin/bash
(
if [[ ! -d ~/bin ]]
then
  mkdir ~/bin
fi
if [[ ! -d ~/lib ]]
then
  mkdir ~/lib
fi
if [[ ! -d ~/projects/ ]]
then
  mkdir ~/projects
fi
if [[ ! -d ~/projects/sh_projects/ ]]
then
  mkdir ~/projects/sh_projects/
fi

if [[ -e ~/bin/init_sh_project.sh ]]
then
  rm -f ~/bin/init_sh_project.sh
fi
if [[ -d ~/lib/sh_proto_project/ ]]
then
  rm -rf ~/lib/sh_proto_project/
fi

cp -f ./bin/init_sh_project.sh ~/bin/ && chmod 755 ~/bin/init_sh_project.sh
cp -rf ./lib/sh_proto_project ~/lib/ && chmod 755 ~/lib/sh_proto_project/*
)

exit 0
