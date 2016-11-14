#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
      then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
cd ../
git push origin master
git subtree push --prefix=docs/public git@github.com:mingrammer/go-codelab.git gh-pages
