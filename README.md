<h3>Init_sh_project - <em>script for initialization of Your bash project</em></h3>
<p>After clonning this project, if You type 'make deploy', in Your homedir will be made following <br>
directories, if not presented: ~/bin, ~/lib, ~/projects/sh_projects.<br>
 
<em>Meke menu of this project:</em>
<pre>help:  		 This help dialog.
tests_bash:  	 Run bash scripts tests
commit:  	 Test and commit changes to git and push on github
deploy:		 Deploys script and its library to the system
</pre>
  ... type 'make deploy' to deploy on Your system

To ~/bin will be copied init_sh_project.sh script from ./bin and to ~/lib will be copied sh_proto_project from ./lib.<br>
After we type in terminal init_sh_project.sh, we will be asked for project name and permision to<br>
connect it to github.com which is voluntary. In ~/projects/sh_projects/ will be created project folder with<br>
initial setup and copied initial content from ~/lib/sh_proto_project.</p>

<p><em>Initial project folder:</em></p>

<pre><font color="#729FCF"><b>.project_directory</b></font>
├── <font color="#729FCF"><b>.devbin</b></font>
│   ├── <font color="#8AE234"><b>bigcommit.sh</b></font>
│   └── <font color="#8AE234"><b>shtests.sh</b></font>
├── dev_requirements.apt
├── .github
├── <font color="#8AE234"><b>.gitignore</b></font>
├── changelog
├── <font color="#8AE234"><b>Makefile</b></font>
├── README.md
├── ROADMAP
├── <font color="#8AE234"><b>project_name.sh</b></font>
└── TODO
</pre>

>- .devbin/ - contains scripts for development
>- bigcommit.sh - script that check git status, makes tests and performs local and remote commit
>- shtest.sh - script that runs set -xvn and shellcheck tests
>- dev_requirements.apt - contains packages that needs to be installed for development, installs via Makefile
>- .github - if presented remote commits to github are performed when commiting via Makefile
>- .gitignore
>- changelog - is filled up when performing commit via Makefile.
>- README.md
>- ROADMAP - contains plan and steps for development, marked in x.x.x format for debian changelog
>- projectname.sh - initial project bash script
>- TODO
>- Makefile - Initialy contains those options:
> <pre>help:  		 This help dialog.
> tests_bash:  	 Run bash scripts tests
> commit:  	 Test and commit changes to git and push on github
> </pre>

