# Makefile for Dart Package Template

# Command to create a new Dart package
create_package:
	sh scripts/create_package.sh $(ARGS)

# Command to publish a Dart package
publish_package:
	sh scripts/publish_package.sh

# Command to bump the semver version (major, minor, patch) in the pubspec.yaml
bump_version:
	sh scripts/bump_version.sh  $(ARGS)

# Command to tag the repository with a semver from pubspec.yaml
tag_repository:
	sh scripts/tag_repository.sh

# Command to generate dart docs
docs:
	dart doc

# Command to run dart fix
dart_fix:
	dart fix --apply

# Command to run dart format
dart_format:
	dart format .

# Command to run dart analyze
dart_analyze:
	dart analyze

# Command to run build_runner generate
generate:
	dart run build_runner build

# Command to run build_runner watch
watch:
	dart run build_runner watch

# Command to run dart tests with coverage
test:
	dart test --coverage=coverage

# Command to perform pre-requisite steps to release the package
build:	clean generate dart_fix dart_format dart_analyze docs test

# Command to release the package to GitHub
release-github: test bump_version tag_repository

# Command to release the package to pub.dev
release-pub-dev: release-github


# Command to clean temp files
clean:
	rm -rf .dart_tool/
	rm -rf build/
	rm -rf doc/api/

# Phony targets
.PHONY: create_package publish_package bump_version tag_repository docs dart_fix dart_format dart_analyze generate watch test build release-github release-pub-dev clean