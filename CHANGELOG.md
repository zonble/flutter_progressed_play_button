# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2024-12-19

### Added
- Comprehensive documentation with detailed README including:
  - Introduction and use cases
  - Installation instructions
  - Quick start guide
  - Complete API reference
  - Usage examples and best practices
- Enhanced CHANGELOG with better formatting and detailed change descriptions

### Changed
- **BREAKING**: Updated Flutter SDK constraints to support Flutter 3.24+ (`>=3.5.0 <4.0.0`)
- Updated deprecated `headline6` text theme to `titleLarge` for Flutter 3.24+ compatibility
- Improved example app with better theme integration

### Fixed
- Fixed CI workflow with updated GitHub Actions and latest stable Flutter version
- Resolved deprecation warnings for modern Flutter versions

### Infrastructure
- Updated development dependencies to latest versions
- Enhanced GitHub Actions workflow for better CI/CD

## [0.2.0] - 2023-06-15

### Changed
- Updated to support Flutter 3.10.x
- Improved compatibility with latest Flutter stable release
- Enhanced widget performance and rendering

### Fixed
- Resolved compatibility issues with Flutter 3.10.x
- Fixed potential rendering issues on different screen densities

## [0.1.0+1] - 2022-03-15

### Changed
- Updated example application with better user interface
- Improved documentation in example code
- Enhanced demo with interactive slider for testing different progress values

### Fixed
- Minor bug fixes in example application
- Improved widget documentation comments

## [0.1.0] - 2022-03-01

### Added
- Initial release of `flutter_progressed_play_button`
- Core `ProgressedPlayButton` widget with customizable progress indicator
- Support for two display modes:
  - Simple play button without progress
  - Play button with circular progress arc
- Customizable properties:
  - `showProgress`: Toggle progress display
  - `progress`: Set completion percentage (0.0 to 1.0)
  - `onPressed`: Handle tap events
  - `icon`: Custom icon (defaults to play arrow)
  - `iconColor`: Custom icon color
  - `backgroundColor`: Custom background color
  - `iconSize`: Adjustable icon size
  - `tooltip`: Accessibility support
- Example application demonstrating widget usage
- Flutter Web demo deployment
- MIT License
- Basic documentation and README

### Technical Details
- Built with Flutter SDK 2.x compatibility
- Uses `CustomPainter` for efficient progress arc rendering
- Implements `StatelessWidget` for optimal performance
- Supports Material Design theming integration
- Includes comprehensive example and documentation
