# Dart Package Template

This repository provides a template for creating Dart packages. It includes a Makefile and scripts to help with common tasks such as creating a new Dart package, publishing a package, bumping the semver version, and tagging the repository.

## Usage

### Create a New Dart Package

To create a new Dart package, use the following command:

```sh
make create_package PACKAGE_NAME=<your_package_name>
```

This will create a new Dart package in the repository root with the specified package name.

### Publish a Dart Package

To publish a Dart package to pub.dev, use the following command:

```sh
make publish_package
```

This will publish the Dart package to pub.dev.

### Bump Semver Version

To bump the semver version (major, minor, patch) of the Dart package, use the following command:

```sh
make bump_version VERSION_TYPE=<major|minor|patch>
```

This will bump the version of the Dart package based on the specified version type.

### Tag the Repository

To tag the repository with the semver tag from `pubspec.yaml`, use the following command:

```sh
make tag_repository
```

This will create a git tag with the semver tag from `pubspec.yaml` and push it to the remote repository.

### Generate Dart Docs

To generate Dart documentation, use the following command:

```sh
make docs
```

This will generate the Dart documentation for the package.

### Run Dart Fix

To apply Dart fixes, use the following command:

```sh
make dart_fix
```

This will apply Dart fixes to the package.

### Run Dart Format

To format the Dart code, use the following command:

```sh
make dart_format
```

This will format the Dart code in the package.

### Run Dart Analyze

To analyze the Dart code, use the following command:

```sh
make dart_analyze
```

This will analyze the Dart code in the package.

### Run Build Runner Generate

To generate code using build_runner, use the following command:

```sh
make generate
```

This will generate code using build_runner.

### Run Build Runner Watch

To watch for changes and generate code using build_runner, use the following command:

```sh
make watch
```

This will watch for changes and generate code using build_runner.

### Run Dart Tests

To run Dart tests, use the following command:

```sh
make test
```

This will run the Dart tests in the package.

### Release the Package to pub.dev

To release the package to pub.dev, use the following command:

```sh
make make-release-pub-dev
```

This will call all applicable targets in the correct order and release the package to pub.dev.

### Release the Package to GitHub

To release the package to GitHub, use the following command:

```sh
make make-release-github
```

This will call all applicable targets in the correct order and release the package to GitHub.

### Clean Temp Files

To clean temporary files, use the following command:

```sh
make clean
```

This will clean temporary files in the package.
