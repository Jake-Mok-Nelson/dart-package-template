#!/bin/bash

set -euo pipefail

# Script to tag the repository

# Check if the pubspec.yaml file exists
if [ ! -f "pubspec.yaml" ]; then
  echo "pubspec.yaml file not found. Please run this script from the root of the Dart package."
  exit 1
fi

# Get the current version from pubspec.yaml
CURRENT_VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}')

# Ensure the version is only major-minor-patch
if [[ ! "$CURRENT_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "The version in pubspec.yaml ($CURRENT_VERSION) is not in the format major.minor.patch."
  exit 1
fi

# Create a git tag with the semver tag from pubspec.yaml
git tag $CURRENT_VERSION

# Push the tag to the remote repository
git push origin $CURRENT_VERSION

echo "Repository tagged with '$CURRENT_VERSION' successfully."
