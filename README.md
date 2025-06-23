# QuestLog

QuestLog is a lightweight journal for real-world adventures. It blends a list of quests with an interactive map so you can explore with a sense of purpose.

Quests consist of a quest and a list of steps beneath it. The app targets iOS and macOS; Android is a nice-to-have but not required.

## MVP Goals
- **Quest Journal**: Create quests, edit their steps and check them off. Quests persist locally in a JSON file.
- **Interactive Map**: View quest locations on a map using MapKit.
- **Navigation and Routing**: Quests can define routes and waypoints so you can follow them on the map.
- **User Customization**: Define major and minor locations to keep the map focused and meaningful.
- **Simple Navigation**: A bottom navigation bar lets you switch between the journal and the map.

## Future Features
- **Compass Integration**: Use features like iOS Dynamic Island for persistent guidance.
- **Meaningful Feedback**: Provide haptic vibrations and sounds when discovering important locations.
- **On‑Device AI**: Employ Core ML for personalized suggestions and natural language quest creation.
- **Optional Objectives**: Support optional or side quests to make journeys feel layered without adding competitive gamification.

## Philosophy
QuestLog borrows the vocabulary of RPGs without turning life into a game. The goal is to encourage daily adventure and progress in real life, not to chase points or achievements.

We do not yet have design assets or wireframes, so interface decisions rely on best judgement. The code is released under the MIT License.

## Development
Open `Package.swift` in Xcode. Xcode will generate a project automatically. Build and run on macOS or an iOS simulator. Quest data is saved to `quests.json` in your documents folder.
If you are building from the command line, run `./deps.sh` to check for a Swift toolchain.

## Running on macOS
1. Install Xcode from the Mac App Store.
2. Open `Package.swift` in Xcode.
3. Choose "My Mac" or an iOS simulator and press **Run**.
