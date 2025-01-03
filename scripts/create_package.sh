#!/bin/bash

# Script to create a new Dart package in the repository root

# Check if a package name is provided
if [ -z "$1" ]; then
  echo "Please provide a package name."
  exit 1
fi

PACKAGE_NAME=$1

# Create a new Dart package
dart create -t package $PACKAGE_NAME

# Navigate to the package directory
cd $PACKAGE_NAME

# Update dependencies and dev_dependencies in pubspec.yaml
cat <<EOL >> pubspec.yaml

# Add regular dependencies here.
dependencies:
  freezed_annotation: ^2.4.4

dev_dependencies:
  lints: '>= 4.0.0'
  test: '>=1.24.0'
  flutter_lints: '>= 4.0.0'
  build_runner: '>= 2.4.13'
  custom_lint: '>= 0.7.0'
  freezed: '>= 2.5.7'
  mockito: '>= 5.0.0'

# Get the dependencies
dart pub get

echo "Dart package '$PACKAGE_NAME' created successfully."
