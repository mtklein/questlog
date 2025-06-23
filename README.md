# QuestLog

Open `index.html` in a modern browser to try it out.

QuestLog is a lightweight journal for real-world adventures. This repository hosts a proof-of-concept implemented as a single HTML file. The page stores quests locally and blends a quest list with an interactive map so you can explore with a sense of purpose directly in the browser.

## MVP Goals
- **Quest Journal**: Create quests, add nested steps and edit them. All progress persists locally using `localStorage`.
- **Interactive Map**: View quest locations on a map with a simple fog of war effect.
- **Navigation and Routing**: Quests draw basic routes between their steps on the map.
- **User Customization**: Define major and minor locations to keep the map focused and meaningful.
- **Simple Navigation**: A bottom navigation bar lets you switch between the journal and the map.

## Future Features
- **Compass Integration**: Use features like iOS Dynamic Island for persistent guidance.
- **Meaningful Feedback**: Provide haptic vibrations and sounds when discovering important locations.
- **On‑Device AI**: Employ Core ML for personalized suggestions and natural language quest creation.
- **Optional Objectives**: Support optional or side quests to make journeys feel layered without adding competitive gamification.
- **Fog of War**: persistent exploration tracking that reveals visited areas over time.

## Philosophy
QuestLog borrows the vocabulary of RPGs without turning life into a game. The goal is to encourage daily adventure and progress in real life, not to chase points or achievements.

We do not yet have design assets or wireframes, so interface decisions rely on best judgement. The code is released under the MIT License.
