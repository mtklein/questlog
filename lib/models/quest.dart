import 'dart:convert';

class QuestStep {
  String title;
  bool completed;
  double? latitude;
  double? longitude;

  QuestStep(this.title,
      {this.completed = false, this.latitude, this.longitude});

  QuestStep.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        completed = json['completed'] ?? false,
        latitude = (json['latitude'] as num?)?.toDouble(),
        longitude = (json['longitude'] as num?)?.toDouble();

  Map<String, dynamic> toJson() => {
        'title': title,
        'completed': completed,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      };
}

class Quest {
  String title;
  List<QuestStep> steps;
  bool active;

  Quest(this.title, this.steps, {this.active = false});

  Quest.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        active = json['active'] ?? false,
        steps =
            (json['steps'] as List).map((e) => QuestStep.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        'title': title,
        'active': active,
        'steps': steps.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() => jsonEncode(toJson());
}
