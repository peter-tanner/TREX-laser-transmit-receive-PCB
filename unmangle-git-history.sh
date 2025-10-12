#!/bin/bash
read -p "Enter base email (e.g. user@domain): " base
read -p "Enter new email: " new
read -p "Enter new name: " new_name
if [ -z "$base" ] || [ -z "$new" ] || [ -z "$new_name" ]; then
    echo "Base and new email and new name must be provided."
    exit 1
fi
emails=$(git log --format='%aE' | grep "$base@" | sort -u)
echo "Found emails:"
echo "$emails"
for e in $emails; do
    echo "$e -> $new"
    git filter-branch -f --env-filter "
        if [ \"\$GIT_AUTHOR_EMAIL\" = \"$e\" ]; then
        GIT_AUTHOR_EMAIL=\"$new\"
        GIT_COMMITTER_EMAIL=\"$new\"
        GIT_AUTHOR_NAME=\"$new_name\"
        GIT_COMMITTER_NAME=\"$new_name\"
        fi
    " -- --all
done