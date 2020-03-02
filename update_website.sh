#!/usr/bin/env bash

# This script automates two things.
# 1. Update Academic-Theme repo
# 2. Updates the Alexander-Weinberg.github.io website.
#     - Hugo's to make the html.
#     - pushes to the github pages repo
#
# See here for more details: https://sourcethemes.com/academic/docs/deployment/
# Command: bash ./update_website.sh

# Check for prerequisites.
if [ ! -d .git ]; then
  echo "ERROR: This tool is for Git repositories only."
  exit 1;
fi

function update_local_repo () {
  git add .
  git commit -m "Update Website"
  git push -u origin master
}

# Function to update Academic
function update_gh_pages_repo () {
  hugo          # make html
  cd public
  git add .
  git commit -m "Build website"
  git push origin master
  cd ..
}


# Display available updates
update_local_repo

# Apply any updates
update_gh_pages_repo
