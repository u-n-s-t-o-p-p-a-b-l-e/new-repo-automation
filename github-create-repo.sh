#! /bin/bash

# Created by @u-n-s-t-o-p-p-a-b-l-e
# https://github.com/u-n-s-t-o-p-p-a-b-l-e

# Usage: ./github-create-repo.sh repo_name

# Check if a repository name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 repo_name"
  exit 1
fi

# Get the project name as the first argument
repo_name="$1"

# Change this to your github username
username="u-n-s-t-o-p-p-a-b-l-e"

# Change this with your git token inside ""
git_token="YoUr_t0keN_h3re"

pass_command="Enter host password for user '$username':"

# Choose for public or private repository
echo "Is this repositary public? (Y/n)"

read -r -p "Your choice: " choice

choice="${choice,,}"

choice=${choice:-y}

if [ "$choice" == "y" ] || [ "$choice" == "yes"  ]; then
	echo "You choose public repository..."
	# Create public repository
	curl -u "$username:$git_token" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

elif [ "$choice" == "n" ] || [ "$choice" == "no" ]; then
	echo "You choose private repository..."
	# Create private reposiroty
	curl -u "$username:$git_token" https://api.github.com/user/repos -d "{ \"name\": \"$repo_name\", \"private\":\"true\" }"

else
	echo "Invalid choice. Please enter 'y' or 'n'. "
	echo "'yes' or 'no' will also be accepted. "
fi


# Create new directory on your local machine
mkdir "$repo_name"

# Change into newly created directory
cd "$repo_name"

# Initialize this directory with git
git init

# Create new readme file
#touch README.md

# Adding text in readme file
# You can change it to whatever you want
echo "# $repo_name" > README.md

# just adding '=' as underline
equals_string=$(printf "%-${#repo_name}s" "=")
echo "$equals_string" >> README.md

# Adding newly created file
git add .

# Add origin to link git to github repo that just made
# This will work only if SSH keys has been setup properly
git remote add origin https://$git_token@github.com/$username/$repo_name.git

# Git commit
git commit -m "Initial commit"

git branch -M main


# Push for the first time with Upstream 
# 'main' also will be your next git push branch
git push -u origin main

# Showing the git log
git log



