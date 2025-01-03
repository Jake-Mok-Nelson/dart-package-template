#!/bin/bash
set -e

# Script to create a new Dart package in the repository root

# Check if a package name is provided
if [ -z "$1" ]; then
  # Extract the repository name from the current directory
  REPO_NAME=$(basename $(git rev-parse --show-toplevel))
  echo "No package name provided. Using repository name '$REPO_NAME' as the package name."
else
  PACKAGE_NAME=$1
fi

# Create a new Dart package
if [ -z "$PACKAGE_NAME" ]; then
  echo "Creating a new Dart package in the repository root."
  dart create -t package . --force
  PACKAGE_NAME=$(basename $(pwd))
else
  echo "Creating a new Dart package '$PACKAGE_NAME' in the repository root."
  dart create -t package $PACKAGE_NAME .
fi

# Get the repository URL minus the .git extension
REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//')
if [ -z "$REPO_URL" ]; then
  echo "Failed to get the repository URL. Please set the remote origin URL."
  exit 1
fi

# If the repository URL is an SSH URL, convert it to an HTTPS URL
if [[ $REPO_URL == git@* ]]; then
  REPO_URL=$(echo $REPO_URL | sed 's/^git@/https:\/\//' | sed 's/:/\//')
fi

DART_VERSION=$(dart --version 2>&1 | awk '{print $4}')


# Update dependencies and dev_dependencies in pubspec.yaml
cat <<EOL >> pubspec.yaml
name: $PACKAGE_NAME
description: A starting point for Dart libraries or applications.
version: 1.0.0
repository: $REPO_URL

environment:
  sdk: ^$DART_VERSION


# Add regular dependencies here.
dependencies:

dev_dependencies:
  lints: '>= 4.0.0'
  test: '>=1.24.0'
  flutter_lints: '>= 4.0.0'
  build_runner: '>= 2.4.13'
  custom_lint: '>= 0.7.0'
  mockito: '>= 5.0.0'
EOL

# Get the dependencies
dart pub get

echo "Dart package '$PACKAGE_NAME' created successfully."
