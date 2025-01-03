#!/bin/bash

set -euo pipefail

# Script to publish a Dart package

# Check if the pubspec.yaml file exists
if [ ! -f "pubspec.yaml" ]; then
  echo "pubspec.yaml file not found. Please run this script from the root of the Dart package."
  exit 1
fi

# Get the current version from pubspec.yaml
CURRENT_VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}')

# Get the latest git tag
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))

# Check if the latest git tag and the version in pubspec match
if [ "$CURRENT_VERSION" != "$LATEST_TAG" ]; then
  echo "The latest git tag ($LATEST_TAG) does not match the version in pubspec.yaml ($CURRENT_VERSION)."
  exit 1
fi

# Publish the package to pub.dev
dart pub publish

echo "Dart package published successfully."
