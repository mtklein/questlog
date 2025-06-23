# Development Plan

This repository will implement **QuestLog** as a single HTML page using plain JavaScript and CSS. The goal is a lightweight demo that runs entirely in the browser with no external build step.

## TODO
- [ ] Create `index.html` with two main sections: **Journal** and **Map**.
- [ ] Add a bottom navigation bar to switch between sections.
- [ ] Store quests in `localStorage` using a JSON structure.
- [ ] Build UI to add, edit, and check off quests with nested steps.
- [ ] Integrate Leaflet via CDN for the interactive map.
- [ ] Allow quests to define locations and display markers on the map.
- [ ] Draw simple routes to quest locations with polylines.
- [ ] Distinguish major vs minor locations with different marker icons.
- [ ] Experiment with a basic "fog of war" overlay that clears as the user moves.
- [ ] Apply minimal styling so the page feels like an RPG journal/map.

Completed tasks should be removed from this list as development progresses.
