# Alpine angular-cli 
Alpine image with angular-cli installed

Current build has the following versions:
- node version: v6.2.0
- npm version: 3.10.9
- angular-cli version: 1.0.0-beta.18

User inside container is:
**uid=1000(user) gid=1000(user)**

There is an entrypoint script (_/entrypoint.sh_) which runs `npm install` every time you initiate the container with the default command and then run `ng serve --host 0.0.0.0`.

## How to use it

### How to run my project
* Simply run the container mounting your files inside the it (at **/home/user/src**):
```bash
me@host$ cd /my/project/folder
me@host$ docker run --rm -it -v "$PWD:/home/user/src" -p  4200:4200 -p 49153:49153 pitervergara/angular2_ng-cli
```
* Access [http://localhost:4200/](http://localhost:4200/)

### How to start a new project
If you do not have an angular-cli project yet __and the folder you mount into the container is empty__, them the entrypoint script will create a project for you, so 

* run the following command to have a brand new project

```bash
me@host$ cd /empty/folder
me@host$ docker run --rm -it -v "$PWD:/home/user/src" -p  4200:4200 -p 49153:49153 pitervergara/angular2_ng-cli
```
* Access [http://localhost:4200/](http://localhost:4200/)

If you want more control over project initialization, run a shell inside the container and  once inside it, use ng command at your will:

```bash
me@host$ cd /empty/folder
me@host$ docker run --rm -it -v "$PWD:/home/user/src" pitervergara/angular2_ng-cli /bin/sh

user@container $ ng
Usage: ng <command (Default: help)>

Available commands in angular-cli:
...
```



