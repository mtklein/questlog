# QuestLog

QuestLog is a mobile application inspired by role-playing games. It blends a journal of quests with an interactive map to help users explore the real world with a sense of adventure.

Quests consist of a quest with a list of steps beneath it, keeping the hierarchy simple.

QuestLog targets iOS and macOS. Android support is nice to have but not required.

## MVP Goals
 - **Quest Journal**: Create quests, edit their steps, and check them off. All quests persist locally in a JSON file.
 - **Interactive Map**: A dedicated tab will show an interactive map with markers for quest locations. On unsupported platforms a placeholder message is shown.
- **Navigation and Routing**: Quests can define routes and waypoints so you can follow them on the map.
- **User Customization**: Define major and minor locations to keep the map focused and meaningful.
- **Simple Navigation**: A bottom navigation bar lets you switch between the journal and the map.

## Future Features
- **Compass Integration**: Use features like iOS Dynamic Island or Android foreground services for persistent guidance.
- **Meaningful Feedback**: Provide haptic vibrations and sounds when discovering important locations.
- **On‑Device AI**: Employ Core ML on iOS and TensorFlow Lite on Android for personalized suggestions and natural language quest creation.
- **Optional Objectives**: Support optional or side quests to make journeys feel layered without adding competitive gamification.

## Philosophy
QuestLog borrows the vocabulary of RPGs without turning life into a game. The goal is to encourage daily adventure and progress in real life, not to chase points or achievements.

We do not yet have design assets or wireframes, so interface decisions rely on best judgement. The code is released under the MIT License.

## Development
Run `source ./deps.sh` to fetch dependencies and run tests. A native version implemented with SwiftUI is available in the `swiftui` directory.


## Running on macOS
1. Install Xcode from the Mac App Store.
2. Run `source ./deps.sh` to set up Flutter.
3. Launch the app with `flutter run -d macos`.
4. To try the SwiftUI sample, open the `swiftui` folder in Xcode and press Run.
