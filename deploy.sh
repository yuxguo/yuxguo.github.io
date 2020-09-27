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
echo "ssh password is: $password"
echo "commit message is: $msg"
git commit -m "$msg"

# Push source and build repos.
echo "$password" | git push origin master
