# Makefile for Dart Package Template

# Command to create a new Dart package
create_package:
	sh scripts/create_package.sh

# Command to publish a Dart package
publish_package:
	sh scripts/publish_package.sh

# Command to bump the semver version (major, minor, patch) in the pubspec.yaml
bump_version:
	sh scripts/bump_version.sh

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

# Command to run dart tests
test:
	dart test

# Command to release the package to pub.dev
make-release-pub-dev:
	make clean
	make generate
	make dart_fix
	make dart_format
	make dart_analyze
	make generate
	make test
	make docs
	make bump_version
	make tag_repository
	make publish_package

# Command to release the package to GitHub
make-release-github:
	make clean
	make generate
	make dart_fix
	make dart_format
	make dart_analyze
	make generate
	make test
	make docs
	make bump_version
	make tag_repository

# Command to clean temp files
clean:
	rm -rf .dart_tool/
	rm -rf build/
	rm -rf doc/api/

# Phony targets
.PHONY: create_package publish_package bump_version tag_repository generate_docs dart_fix dart_format dart_analyze build_runner_generate build_runner_watch dart_test make-release-pub-dev make-release-github clean
