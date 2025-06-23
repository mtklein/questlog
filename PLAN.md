# Development Plan

## Completed
- Added initial documentation files based on the project kickoff conversation.
- Clarified requirements: one-level quest hierarchy, free map providers, no design assets, MIT license.
- Created a minimal prototype with a quest journal UI and tests.
- Added a setup script for local development.
- Updated setup script for Linux and macOS environments.
- Configured Git to trust the toolchain directory to avoid dubious ownership warnings.
- Pre-cached dependencies so tests pass offline.
- Fixed compilation errors in `main.dart` so the widget test runs successfully.
- Added a bottom navigation bar with a map tab placeholder.
- Connected the map tab to OpenStreetMap using a WebView.
- Documented how to run the app on macOS and iPhone.
- Documented that the tooling can generate desktop platform folders and added the command to the setup script.
- Implemented quest editing: users can add, edit, and delete quests and steps.
- Added ability to choose the active quest and display its steps on the map.
- Stored quests in a local JSON file for rudimentary persistence.
- Rendered map markers for quest steps using Leaflet inside the WebView.
- Handled unsupported platforms by showing a placeholder when WebView isn't available.
- Configured the WebView platform on macOS and iOS so the map loads correctly.
- Created a minimal SwiftUI version of the app for iOS and macOS.
- Simplified the README to focus on features and note that Android support is optional.
- Added instructions in README for running the app on macOS.
- Added a Swift Package manifest so Xcode opens the SwiftUI sample without creating a project manually.
- **Migrated entirely to SwiftUI**: removed the cross-platform demo and promoted the Swift package to the repository root.
- **Ported features**: quest editing, JSON persistence and map markers are now implemented with SwiftUI and MapKit.
- **Updated documentation**: README explains running the SwiftUI app and no longer references the previous approach.
- Renamed package and files to drop the "SwiftUI" suffix and simplified the quest list to compile cleanly.
- Added a helper script (`deps.sh`) to verify a Swift toolchain is available.
- Refactored `QuestListView` into smaller functions so the Swift compiler can type-check it.
- Improved `deps.sh` with checks for Xcode on macOS.

## Next Steps
- Expand tests and refactor UI code as features grow.
- Explore on-device AI for quest suggestions.
