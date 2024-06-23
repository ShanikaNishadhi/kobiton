#!/bin/bash

read -p "Are you sure you want to push the current version to prod? (y/n) " -n 1 -r
echo    # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# Get the current working directory
CURRENT_DIR=$(basename "$PWD")

# Check if the current directory is synmax-hyperion-v3-docs
if [ "$CURRENT_DIR" != "synmax-hyperion-v3-docs" ]; then
    echo "Please run this script from the synmax-hyperion-v3-docs directory."
    exit 1
fi
echo "Building sphinx files locally..."
sphinx-build -b html source build

# Navigate to build directory
cd build 

# Initialize git
# git init . 

# Add all files to git
git add . --all

# Commit with today's date
TODAYS_DATE=$(date +%Y-%m-%d)
git commit -m "commit on ${TODAYS_DATE}"

echo "Committing..."

# Add remote
git remote add apidocs-production git@git.wpengine.com:apidocssynmaxc.git

echo "Adding connection to production remote..."

# Push to remote
git push -v -o remove-empty-dirs apidocs-production master

echo "Pushing local to production..."

# Navigate back
cd ..

echo "Removing local files..."

# Print success message
echo "SUCCESSFULLY BUILT"