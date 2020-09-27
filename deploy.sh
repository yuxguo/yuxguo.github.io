set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t hugo-coder # if using a theme, replace with `hugo -t <YOURTHEME>`

# Add changes to git.
git add *

# Input git password
password="no password input!"

if [ -n "$1" ]; then
	password="$1"
fi

# Commit changes.
msg="update the site at $(date)"
if [ -n "$2" ]; then
	msg="${*:2}"
fi

printf "commit message is: \033[0;32m$msg\033[0m\n"
printf "ssh password is: \033[0;32m$password\033[0m\n"

git commit -m "$msg"

# Push source and build repos.
git push origin master
