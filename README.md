# QuestLog

QuestLog is a mobile application inspired by role-playing games. It blends a journal of quests with an interactive map to help users explore the real world with a sense of adventure.

Quests consist of a quest with a list of steps beneath it, keeping the hierarchy simple.

## MVP Goals
- **Quest Journal**: Track ongoing and completed quests in a concise format. Each quest lists its steps.
- **Interactive Map**: Display markers for significant locations such as shops, rest points, or user-defined points of interest. Markers link back to quests in the journal.
- **Navigation and Routing**: Allow quests to include routes and waypoints so users can follow them on the map.
- **User Customization**: Let users define major and minor locations to keep the map focused and meaningful.

## Future Features
- **Compass Integration**: Use features like iOS Dynamic Island or Android foreground services for persistent guidance.
- **Meaningful Feedback**: Provide haptic vibrations and sounds when discovering important locations.
- **On‑Device AI**: Employ Core ML on iOS and TensorFlow Lite on Android for personalized suggestions and natural language quest creation.
- **Optional Objectives**: Support optional or side quests to make journeys feel layered without adding competitive gamification.

## Tech Stack
QuestLog will be built with **Flutter** so the same codebase runs on both iOS and Android. We are experimenting with free map services such as Google Maps and Mapbox, but haven't committed to one yet. The app uses on-device AI models and may integrate with online services such as OpenAI if needed.

## Philosophy
QuestLog borrows the vocabulary of RPGs without turning life into a game. The goal is to encourage daily adventure and progress in real life, not to chase points or achievements.

We do not yet have design assets or wireframes, so interface decisions rely on best judgement. The code is released under the MIT License.

## Development Setup
Run `source ./deps.sh` on Linux or macOS to install Flutter locally and update your `PATH`. The script also configures Git to trust the Flutter directory so `flutter test` works without warnings. Then use `flutter test` and `flutter run` to build the demo app.

