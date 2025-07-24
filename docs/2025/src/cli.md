# Command-Line Interface

*In the beginning, was the command-line...*

```                                                                             
$ toilet command-line
                                               #   ""#      "                 
  mmm    mmm   mmmmm  mmmmm   mmm   m mm    mmm#     #    mmm    m mm    mmm  
 #"  "  #" "#  # # #  # # #  "   #  #"  #  #" "#     #      #    #"  #  #"  # 
 #      #   #  # # #  # # #  m"""#  #   #  #   # """ #      #    #   #  #"""" 
 "#mm"  "#m#"  # # #  # # #  "mm"#  #   #  "#m##     "mm  mm#mm  #   #  "#mm"
```

- A command-line interface (CLI) is a means of interacting with software via commands 
  - each formatted as a line of text
- CLIs emerged in the mid-1960s, on computer terminals, as an interactive alternative to punched cards
- Alternatives to a CLI include a GUI (Graphical User Interface) but GUI is not conducive to **automating programs**
- CLI and GUI are interfaces around the same thing and can be used interchangeably
  - except that CLI is much faster and reliable when managing a cluster or server farm
- Resources for deeper dives:
  - READ: [https://en.wikipedia.org/wiki/Command-line_interface](https://en.wikipedia.org/wiki/Command-line_interface)
  - YouTry **Shells in Action** at: [freecodecamp](https://www.freecodecamp.org/news/the-command-line-1fdbc692b3bf/) 

# Let's Try Together Now!


Let's try the following commands on our command-line interface (CLI), also known as shell or terminal now.
 
The commands are adapted from [Wallace Preston's Ultimate Terminal Cheatsheet - Your Key to Command Line Productivity](https://gist.githubusercontent.com/wallacepreston/180194b3799bc936e3a035449b8c06ac/raw/257c90f3be3eae1f30bc69cc7b63015e91dc1dea/ultimate-terminal-cheatsheet.md).

Bookmark [https://cheatsheetindex.com/](https://cheatsheetindex.com/) for many more tools.

## Master the Terminal and Rule the Command Line Kingdom!
Welcome to the Ultimate Terminal Cheatsheet! We know the command line can be intimidating, like trying to navigate a maze blindfolded. But fear not, for this cheatsheet will be your trusty guide, like a GPS for your terminal. From manipulating files to networking to version control, we've got you covered. Let's power up our keyboards and get ready to conquer the command line!

## Basic Terminal Commands
- Command line
  - See where I am `pwd`
  - list files `ls`
  - list hidden files `ls -a`
  - change directory `cd <directory-name>`
  - Open whole directory in VS Code `code .`
  - shorthand for current and previous folder
    - `ls .` lists current folder
    - `ls ..` lists previous folder
    - `cd ..` moves up a folder
  - home vs root
    - `~` is short for home
    - `cd ~` brings you home
    - `/` is short for root
    - `cd /` brings to you root
  - absolute vs relative paths
    - **Absolute**: `touch /folder-name/file-name.txt` goes to the root folder, into `folder-name`, makes a file inside of that folder
    - **Relative**: `touch ./folder-name/file-name.txt` goes into `folder-name` from current level, makes a file inside of that folder
    - `touch ~/folder-name/file-name.txt` goes into your home directory (usually looks like `/home/username`)
  - Files
    - create files `touch file-name.txt`
    - remove a file `rm file-name.txt`
    - rename a file `mv file-name.txt new-file-name.txt`
    - move a file `mv this.txt target-folder/`
  - Folders
    - create folders `mkdir folder-name`
    - remove a folder `rm folder-name -R`
    - rename a folder `mv folder-name new-folder-name`
    - move a folder `mv folder-name ../../target-folder`
  - `grep`
    - search recursively for a pattern in a directory: `grep -r <pattern> <directory>`
    - search for a pattern in a file: `grep <pattern> <file>`
    - search for a pattern in multiple files: `grep <pattern> <file1> <file2> <file3>`
    - ignore case when searching: `grep -i <pattern> <file>`
    - count the number of occurrences of a pattern: `grep -c <pattern> <file>`
    - print the line number for each match: `grep -n <pattern> <file>`
    - print the lines before or after the matching line: `grep -A <num_lines> <pattern> <file>` or `grep -B <num_lines> <pattern> <file>`
    - print the matching line and a few lines before and after it: `grep -C <num_lines> <pattern> <file>`

## ports/processes
- Show what is running on a port `lsof -i:<port-number>`
- Kill a process `kill <process-id>`
- Example of above two steps
```sh
$ lsof -i:3000
COMMAND   PID    USER   FD   TYPE            DEVICE SIZE/OFF NODE NAME
node     78070 myuser   24u  IPv6 0xdc9d8g07c355e5f      0t0  TCP *:hbci (LISTEN)

$ kill 78070
```
- Show list of all node processes `ps -ef | grep node`
- Kill all node processes `pkill -f node`

## VIM
  - Insert mode: `i`
  - Normal mode: `Esc`
  - Write changes to file: `:w`
  - Quit VIM: `:q`
  - Save changes and quit VIM: `:wq`
  - Undo last change: `u`
  - Redo last undone change: `Ctrl + r`

## Git
- Cloning and remotes
  - Clone `git clone <url>`
  - Check where cloning from and committing to `git remote -v`
  - Add a remote repository  `git remote add <remote-name> https://remote-url/repo-name.git`
  - Change the origin `git remote set-url origin <new-git-repo-url>`
- Committing
  - See status of staging area etc `git status`
  - Add all files in the repo to staging area `git add -A`
  - Add just one file to the staging area `git add <filename>`
  - Commit `git commit -m "my-message"`
  - Push `git push`
- Branching
  - Check out to a new branch `git checkout -b <branchname>`
  - Check out to an existing branch `git checkout <branchname>`
  - Delete a branch (cannot be the branch you're on!) `git branch -D <branchname>`
  - Merge another branch into current branch
    1. Move to the branch you want to merge FROM `git checkout dev`
    2. Pull down most recent remote version `git pull`
    3. Move to the branch you want to merge TO `git checkout feature-branch-#25`
    4. Merge the FROM branch (`dev` in this case) into the current branch `git merge dev`
- Logs
  - See log of activity (commits) `git log`
  - See log with limited info (easier to read) `git log --oneline`
- Configs
  - Change git email locally: `git config user.name "Marley McTesterson"`
  - Change git email locally: `git config user.email example@email.com`
  - See git repo config settings (i.e. email username etc): `git config --list`
- Diffs
  - See what is changed currently compared to the most recent commit `git diff`
  - See what has changed in the current working tree vs a specific branch `git diff <branch-name> --`
  - Show the difference between two branches: `git diff <branch1> <branch2>`
- Removing/rebasing changes - Intermediate to Advanced
  - Auto-stash changes before switching branches: `git checkout <branch> --autostash`
  - Remove uncommitted changes (but save them for later, just in case) `git stash`
  - Remove last commit `git reset --hard HEAD^`
  - Squash the last 3 commits into one single commit `git rebase -i HEAD~3`
    - Then in the editor, for any commits you want to keep leave `pick`. For anything you want to "squash" and not include that as a commit, change `pick` to `squash`.
  - Squash everything after <SHA1> `git rebase -i e25340b` where e25340b is the SHA1
    - Repeat next step from above to pick/squash specific  commits.

## cURL
- Methods
  - `GET` request: `curl https://www.google.com/`
  - `POST` request: `curl http://localhost:3000/myroute -H "Content-Type: application/json" -X POST -d '{"key1": "val1", "key2": "val2"}'` (`-H` is a header, in this case setting our content type as json. `-X` is setting the method, post in this case. `-d` is the request body in JSON format.)
  - `PATCH` request: `curl http://localhost:3000/myroute -X PATCH -H 'Content-Type: application/json' -d '{"key1": "val1", "key2": "val2"}'`
  - `DELETE` request: `curl http://localhost:3000/myrouote -X DELETE`
- Setting Authorization header: `curl http://localhost:3000/myroute -H 'Authorization: Bearer <myreallylongtoken>'`
- Basic Auth: Authenticate with a username and password while accessing a URL: `curl -u <username>:<password> <url>`
- Send a POST request with data from a file: `curl -X POST -d @<filename> <url>`
- Fetch only the headers of a URL: `curl -I <url>`
- Download the contents of a URL and save it to a file: `curl -o <output_file> <url>`

## Serverless Framework
  - Create a new serverless project: `serverless create --template <template-name>`
  - Deploy a serverless project: `serverless deploy`
  - Remove a deployed serverless project: `serverless remove`

## Docker
  - List all running containers: `docker ps`
  - Stop a container: `docker stop <container-id>`
  - Remove a container: `docker rm <container-id>`
  - List all available images: `docker images`
  - Remove an image: `docker rmi <image-id>`

## macOS
  - Show hidden files in Finder: `Shift + Command + .`
  - Open a file or folder in Finder from Terminal: `open <file/folder>`
  - Show all running processes: `ps aux`
  - Kill a process: `kill <pid>`
  - Restart the macOS Dock: `killall Dock`

## Linux
  - Update package manager: `sudo apt-get update`
  - Install a package: `sudo apt-get install <package-name>`
  - Remove a package: `sudo apt-get remove <package-name>`
  - Show all running processes: `ps aux`
  - Kill a process: `kill <pid>`

## Windows
  - We can fall back on Linux in this case as we will be running docker.
