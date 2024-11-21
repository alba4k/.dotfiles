#!/bin/python

import commentjson
import git
import os
import shutil
import stat
import sys

# ANSI escape codes for colors
BOLD = "\033[1m"
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
RESET = "\033[0m"

path = "~/.dotfiles"
path = os.path.expanduser(path)

with open(path+"/to_save.jsonc", 'r') as file:
    to_save = commentjson.load(file)

for file in to_save["files"]:
    if(os.path.exists(os.path.expanduser(file)) and os.path.isdir(os.path.expanduser(file)) == False):
        destination = path + file.replace("~", "/userhome")
        os.makedirs(os.path.dirname(destination), exist_ok=True)
        shutil.copy(os.path.expanduser(file), destination)
        
        # /etc/doas.conf causes issues sooo
        permissions = os.stat(destination).st_mode
        os.chmod(destination, permissions | stat.S_IWUSR)
        
        print(f" > {YELLOW}Successfully copied {file}{RESET}")
    else:
        print(f" > {RED}Couldn't copy {file}{RESET}")


for directory in to_save["directories"]:
    if(os.path.exists(os.path.expanduser(directory)) and os.path.isdir(os.path.expanduser(directory)) == True):
        destination = path + directory.replace("~", "/userhome")
        os.makedirs(os.path.dirname(destination), exist_ok=True)
        shutil.copytree(os.path.expanduser(directory), destination, dirs_exist_ok=True)
        
        print(f" > {YELLOW}Successfully copied {directory}{RESET}")
    else:
        print(f" > {RED}Couldn't copy {directory}{RESET}")


commit_message = "committed automatically from update.py"
if(len(sys.argv) > 1):
    commit_message = sys.argv[1];

repo = git.Repo(path)
if repo.is_dirty(untracked_files=True):
    repo.git.add(all=True)
    repo.index.commit(commit_message)
    
    print(f"> {BLUE}Committed changes{RESET}")

origin = repo.remote(name="origin")
origin.push()
print(f"> {BLUE}Pushed changes{RESET}")

print(f"{BOLD}{GREEN}Everything is now up to date! :D{RESET}")
