# flutter_progressed_play_button

A Flutter package that provides a play button widget with a progress indicator drawn as an arc around the icon. The widget supports two states: showing progress or displaying as a simple play button.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Flutter Setup and Dependencies
- Install Flutter 3.32.0 (version specified in `.fvmrc`):
  - Download: `cd /tmp && wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.32.0-stable.tar.xz`
  - Extract: `tar xf flutter_linux_3.32.0-stable.tar.xz && sudo mv flutter /opt/flutter`
  - Configure: `export PATH="/opt/flutter/bin:$PATH"`
  - Setup: `flutter doctor --accept-licenses` -- NEVER CANCEL: Initial setup takes 5-15 minutes. Set timeout to 20+ minutes.
- Install dependencies for the package:
  - `cd /path/to/flutter_progressed_play_button`
  - `flutter pub get` -- takes 30-90 seconds. NEVER CANCEL: Set timeout to 3+ minutes.
- Install dependencies for the example app:
  - `cd example`
  - `flutter pub get` -- takes 30-90 seconds. NEVER CANCEL: Set timeout to 3+ minutes.

### Building and Testing
- Run all tests: `flutter test` -- takes 15-45 seconds. NEVER CANCEL: Set timeout to 3+ minutes.
- Run package analysis: `flutter analyze` -- takes 10-30 seconds. Set timeout to 2+ minutes.
- Format code: `dart format .` -- takes under 1 second. VALIDATED: Works correctly.
- Build example for web: 
  - `cd example`
  - `flutter config --enable-web` -- takes 5-15 seconds
  - `flutter build web` -- NEVER CANCEL: Build takes 3-8 minutes. Set timeout to 15+ minutes.

### Running the Example Application
- Run example app in debug mode:
  - `cd example`
  - `flutter run -d web-server --web-hostname=0.0.0.0 --web-port=8080` -- NEVER CANCEL: Initial run takes 2-5 minutes. Set timeout to 10+ minutes.
- The example app demonstrates the widget with interactive controls to adjust progress
- Access the running app at `http://localhost:8080` (or the displayed URL)

## Validation

### Manual Testing Requirements
- ALWAYS test widget functionality after making changes to the core library
- Run the example app and verify:
  - Play button renders correctly with default appearance
  - Progress indicator draws properly when `showProgress: true`
  - Slider control updates the progress value in real-time (0.0 to 1.0)
  - Button responds to tap events correctly
  - Different icon sizes and colors work as expected
- ALWAYS run `flutter test` and ensure all tests pass before committing
- ALWAYS run `flutter analyze` to check for code quality issues before committing
- ALWAYS run `dart format .` to ensure consistent code formatting

### Testing Scenarios
After making changes, validate these scenarios in the example app:
1. **Basic functionality**: Widget renders with default settings (blue circle with white play icon)
2. **Progress display**: Progress arc appears and updates correctly as slider moves
3. **Custom properties**: Test with custom icons (Icons.pause), colors (red icon, blue background), and sizes (48.0)
4. **Interaction**: Click button and verify onPressed callback fires
5. **Theme integration**: Widget respects theme colors when backgroundColor/iconColor not specified

### Validation Commands
Run these commands before any commit:
```bash
# Format code (takes <1 second)
dart format . --set-exit-if-changed

# Analyze code (requires Flutter environment, takes 10-30 seconds)
flutter analyze

# Run tests (requires Flutter environment, takes 15-45 seconds)
flutter test

# Build example to verify no build errors (takes 3-8 minutes)
cd example && flutter build web
```

## Common Tasks

### Repository Structure
```
├── lib/
│   └── flutter_progressed_play_button.dart  # Main widget implementation
├── test/
│   └── flutter_progressed_play_button_test.dart  # Widget tests
├── example/
│   ├── lib/main.dart                         # Demo application
│   ├── test/widget_test.dart                 # Example app tests
│   └── web/                                  # Web build configuration
├── .github/
│   ├── workflows/dart.yml                    # CI/CD pipeline for web deployment
│   └── copilot-instructions.md               # This file
├── analysis_options.yaml                     # Dart linting configuration
├── .fvmrc                                    # Flutter version specification
└── pubspec.yaml                              # Package dependencies and metadata
```

### Key Files and Their Purpose
- `lib/flutter_progressed_play_button.dart`: Contains the `ProgressedPlayButton` widget and custom painter `_Painter`
- `test/flutter_progressed_play_button_test.dart`: Comprehensive tests covering widget creation, properties, and interactions
- `example/lib/main.dart`: Demo app showing widget usage with interactive controls
- `.github/workflows/dart.yml`: Builds and deploys the example to GitHub Pages automatically

### Development Workflow
1. Make changes to `lib/flutter_progressed_play_button.dart` for widget modifications
2. Update tests in `test/flutter_progressed_play_button_test.dart` if adding new functionality
3. Test changes using the example app: `cd example && flutter run -d web-server`
4. Run test suite: `flutter test`
5. Check code quality: `flutter analyze`
6. Format code: `dart format .`

### CI/CD Pipeline
- GitHub Actions automatically builds and deploys the example to GitHub Pages on push to master
- The workflow runs: `flutter upgrade`, `flutter config --enable-web`, `flutter packages get`, `flutter build web`
- Live demo available at: https://zonble.github.io/flutter_progressed_play_button/

### Expected Command Outputs
```bash
# dart format . (successful, no changes)
$ dart format .
Formatted 2 files (0 changed) in 0.26 seconds.

# flutter test (successful)
$ flutter test
00:02 +3: All tests passed!

# flutter analyze (successful)
$ flutter analyze
Analyzing flutter_progressed_play_button...
No issues found! (ran in 2.1s)

# flutter doctor (successful setup)
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.32.0, on Linux, locale en_US.UTF-8)
[✓] Linux toolchain - develop for Linux desktop
[✓] Chrome - develop for the web
```

### Widget Usage Examples
```dart
// Basic usage
ProgressedPlayButton()

// With progress indicator
ProgressedPlayButton(
  showProgress: true,
  progress: 0.5,
)

// Fully customized
ProgressedPlayButton(
  showProgress: true,
  progress: 0.7,
  icon: Icons.pause,
  iconSize: 48.0,
  iconColor: Colors.red,
  backgroundColor: Colors.blue,
  onPressed: () => print('Button pressed!'),
  tooltip: 'Play/Pause',
)
```

### Package Dependencies
- **Runtime**: Only depends on Flutter SDK (no external packages)
- **Development**: Uses `flutter_test` and `flutter_lints ^6.0.0` for testing and code quality
- **Minimum SDK**: Dart >=3.5.0 <4.0.0 (specified in pubspec.yaml)
- **Flutter Version**: 3.32.0 (specified in .fvmrc)

### Troubleshooting
- **Flutter installation issues**: If `flutter doctor` fails, try downloading the exact version from Google's servers
- **Network issues**: If download fails, the Flutter binary may be temporarily unavailable
- **Dart analysis failures**: Requires full Flutter environment; `dart analyze` alone will fail with missing Flutter dependencies
- **Test failures**: Check that you haven't broken existing widget functionality; all existing tests must pass
- **Build failures**: Ensure web support is enabled with `flutter config --enable-web`
- **Example app issues**: Ensure you're in the `example/` directory when running the demo app

### Flutter Download Alternative
If the primary download fails, try these alternatives:
```bash
# Alternative 1: Direct GitHub clone
cd /opt && sudo git clone https://github.com/flutter/flutter.git -b stable

# Alternative 2: Snap installation (if available)
sudo snap install flutter --classic

# Alternative 3: Manual download
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.32.0-stable.tar.xz
```

### Performance Notes
- Widget uses CustomPainter for efficient rendering of progress arc
- Example app includes multiple widget instances to demonstrate performance
- No external dependencies minimize package size and improve load times
- Progress updates are smooth due to efficient painting implementation