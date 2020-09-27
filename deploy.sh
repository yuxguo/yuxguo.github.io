set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

hugo -t hugo-coder

git add *
msg="$(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

printf "commit message is: \033[0;32m$msg\033[0m\n"

git commit -m "$msg"

git push origin master
