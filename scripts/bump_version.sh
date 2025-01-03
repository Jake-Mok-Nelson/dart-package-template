#!/bin/bash

# Script to bump the semver version

# Check if a version type (major, minor, patch) is provided
if [ -z "$1" ]; then
  echo "Please provide a version type (major, minor, patch)."
  exit 1
fi

VERSION_TYPE=$1

# Check if the pubspec.yaml file exists
if [ ! -f "pubspec.yaml" ]; then
  echo "pubspec.yaml file not found. Please run this script from the root of the Dart package."
  exit 1
fi

# Get the current version from pubspec.yaml
CURRENT_VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}')
IFS='.' read -r -a VERSION_PARTS <<< "$CURRENT_VERSION"

MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

# Bump the version based on the provided version type
case $VERSION_TYPE in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  *)
    echo "Invalid version type. Please provide one of the following: major, minor, patch."
    exit 1
    ;;
esac

NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Update the version in pubspec.yaml
sed -i '' "s/^version: .*/version: $NEW_VERSION/" pubspec.yaml

echo "Version bumped to $NEW_VERSION successfully."
