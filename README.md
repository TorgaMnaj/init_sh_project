<p>Init_sh_project is script that prepares Your bash project. Its placed in ./bin/ and its prototyp<br>
folder placed in ./lib/sh_proto_project/. Every time we call init_sh_project.sh new folder in <br>
~/projects/sh_projects / under given name is created with automatic setup.</p>

<p><em>What it does:</em></p>

>- Creates neccesarry directories if not presented (~/bin, ~/projects, ~/projects/sh_projects, ~/lib)
>- Make folder in ~/sh_projects with given project name and creates bash script with project name in it.
>- Fills up ptoject directory with necessary files and connect it to github.
>- Makefile contains those options:
>>- help - shows hlep dialog
>>- tests_bash - runs tests via set -xvn and shellcheck
>>- commit - shows git status, runs tests and performs commit to local git and github.com if connected

