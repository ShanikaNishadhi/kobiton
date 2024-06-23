#!/bin/bash

echo removing build directory if exists...

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
git remote add apidocs-staging git@git.wpengine.com:apidocssynmstg.git 

echo "Adding connection to development remote..."

# Push to remote
git push -v -o remove-empty-dirs apidocs-staging master


# Navigate back
cd ..

echo "Removing local files..."

# Print success message
echo "Successfully built and pushed to development."
echo "See latest changes here: http://apidocssynmstg.wpenginepowered.com/"
