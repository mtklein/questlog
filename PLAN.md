# Development Plan

## Completed
- Added initial documentation files based on the project kickoff conversation.
- Clarified requirements: one-level quest hierarchy, free map providers, no design assets, MIT license.
- Created minimal Flutter project with basic quest journal UI and tests.
- Added a setup script to install Flutter for local development.
- Updated setup script for Linux and macOS environments.
- Configured Git to trust the installed Flutter directory to avoid dubious ownership warnings.
- Pre-caches Flutter artifacts and runs `flutter pub get` so tests pass offline.
- Fixed compilation errors in `main.dart` so the widget test runs successfully.
- Added a bottom navigation bar with a map tab placeholder.
- Connected the map tab to OpenStreetMap using a WebView.
- Documented how to run the app on macOS and iPhone.
- Documented that `flutter create --platforms=macos,linux,windows .` generates
  desktop platform folders and added the command to the setup script.


## Next Steps
- Expand tests and refactor UI code as features grow.
- Explore on-device AI for quest suggestions.
