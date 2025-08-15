# flutter_progressed_play_button

[![pub package](https://img.shields.io/pub/v/flutter_progressed_play_button.svg)](https://pub.dev/packages/flutter_progressed_play_button)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple yet elegant Flutter widget that presents a customizable play button with a progress indicator drawn as an arc around the icon. Perfect for audio and video applications where you need to show playback progress in an intuitive way.

![Different button states](buttons.png)

## Introduction

`ProgressedPlayButton` is a Flutter widget designed specifically for multimedia applications. It combines a play button with a visual progress indicator, making it ideal for:

- **Audio Players**: Show how much of a song or playlist has been played
- **Video Players**: Display video playback progress
- **Podcast Apps**: Indicate episode progress
- **Audio Books**: Show chapter or book completion
- **Any Media App**: Where visual progress feedback enhances user experience

The widget elegantly handles two distinct states:
1. **Simple Play Button**: When no progress tracking is needed
2. **Progress-Enabled Button**: With a circular arc showing completion percentage

Originally developed for the "KKBOX Kids" app, this widget has proven effective in real-world production applications.

## Live Demo

Experience the widget in action with our [interactive Flutter Web demo](https://zonble.github.io/flutter_progressed_play_button/).

## Installation

Add this package to your Flutter project by adding the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_progressed_play_button: ^0.3.0
```

Then run:

```bash
flutter pub get
```

Import the package in your Dart code:

```dart
import 'package:flutter_progressed_play_button/flutter_progressed_play_button.dart';
```

## Quick Start

### Basic Usage

Create a simple play button without progress:

```dart
ProgressedPlayButton(
  onPressed: () {
    // Handle play button tap
    print('Play button tapped!');
  },
)
```

### With Progress Indicator

Show a play button with progress (50% complete):

```dart
ProgressedPlayButton(
  showProgress: true,
  progress: 0.5, // 50% complete
  onPressed: () {
    // Handle play button tap
  },
)
```

### Custom Styling

Customize colors and icon:

```dart
ProgressedPlayButton(
  showProgress: true,
  progress: 0.75,
  icon: Icons.pause, // Use pause icon instead
  iconColor: Colors.white,
  backgroundColor: Colors.red,
  iconSize: 48.0,
  onPressed: () {
    // Toggle play/pause
  },
)
```

## API Reference

### Constructor Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `showProgress` | `bool` | `false` | Whether to display the progress arc |
| `progress` | `double` | `1.0` | Progress value from 0.0 to 1.0 |
| `onPressed` | `VoidCallback?` | `null` | Callback when button is tapped |
| `icon` | `IconData?` | `Icons.play_arrow` | Icon to display in the button |
| `iconColor` | `Color?` | `Colors.white` | Color of the icon |
| `backgroundColor` | `Color?` | `Theme.primaryColor` | Background color of the button |
| `iconSize` | `double` | `32.0` | Size of the icon |
| `tooltip` | `String?` | `null` | Tooltip text for accessibility |

### Widget States

The widget supports different visual states based on the `showProgress` and `progress` values:

| State | `showProgress` | `progress` | Visual Result |
|-------|----------------|------------|---------------|
| **Not Started** | `false` | - | Solid background circle with icon |
| **Started (0%)** | `true` | `0.0` | Circle outline with icon |
| **In Progress** | `true` | `0.1` to `0.9` | Partial arc showing progress |
| **Complete** | `true` | `1.0` | Full circle arc completed |

## Usage Examples

### Audio Playlist Progress

```dart
class PlaylistButton extends StatefulWidget {
  final double playlistProgress;
  final bool isPlaying;
  final VoidCallback onPlayPause;

  const PlaylistButton({
    Key? key,
    required this.playlistProgress,
    required this.isPlaying,
    required this.onPlayPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: ProgressedPlayButton(
        showProgress: playlistProgress > 0,
        progress: playlistProgress,
        icon: isPlaying ? Icons.pause : Icons.play_arrow,
        onPressed: onPlayPause,
        tooltip: isPlaying ? 'Pause' : 'Play',
      ),
    );
  }
}
```

### Interactive Progress Control

```dart
class InteractiveExample extends StatefulWidget {
  @override
  _InteractiveExampleState createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  double _progress = 0.0;
  bool _showProgress = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          child: ProgressedPlayButton(
            showProgress: _showProgress,
            progress: _progress,
            onPressed: () {
              // Handle play action
            },
          ),
        ),
        SizedBox(height: 20),
        Slider(
          value: _progress,
          onChanged: (value) => setState(() => _progress = value),
          min: 0.0,
          max: 1.0,
        ),
        SwitchListTile(
          title: Text('Show Progress'),
          value: _showProgress,
          onChanged: (value) => setState(() => _showProgress = value),
        ),
      ],
    );
  }
}
```

### Custom Themed Buttons

```dart
// Dark theme variant
ProgressedPlayButton(
  showProgress: true,
  progress: 0.3,
  backgroundColor: Colors.grey[800],
  iconColor: Colors.white,
  iconSize: 40.0,
)

// Colorful variant
ProgressedPlayButton(
  showProgress: true,
  progress: 0.7,
  backgroundColor: Colors.purple,
  iconColor: Colors.yellow,
  icon: Icons.music_note,
)
```

## Best Practices

1. **Progress Values**: Always ensure progress values are between 0.0 and 1.0. Values outside this range will be clamped automatically.

2. **Accessibility**: Use the `tooltip` parameter to provide meaningful descriptions for screen readers.

3. **Responsive Design**: Wrap the widget in a `Container` with explicit dimensions for consistent sizing across different screen sizes.

4. **State Management**: Consider using state management solutions (Provider, Bloc, etc.) for complex applications with multiple media controls.

5. **Performance**: The widget uses `CustomPainter` for efficient rendering, but avoid rebuilding unnecessarily in lists.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

This package was originally developed for the "KKBOX Kids" app and is maintained by [Weizhong Yang](https://github.com/zonble).
