class QuestStep {
  final String title;
  bool completed;

  const QuestStep(this.title, {this.completed = false});
}

class Quest {
  final String title;
  final List<QuestStep> steps;

  const Quest(this.title, this.steps);
}
