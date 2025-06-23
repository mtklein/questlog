class QuestStep {
  final String title;
  bool completed;

  QuestStep(this.title, {this.completed = false});
}

class Quest {
  final String title;
  final List<QuestStep> steps;

  Quest(this.title, this.steps);
}
