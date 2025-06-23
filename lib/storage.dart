import 'dart:convert';
import 'dart:io';

import 'models/quest.dart';

class QuestStorage {
  final String fileName;
  QuestStorage({this.fileName = 'quests.json'});

  Future<File> _file() async {
    final directory = Directory.current;
    return File('${directory.path}/$fileName');
  }

  Future<List<Quest>> load() async {
    final f = await _file();
    if (!await f.exists()) return [];
    final data = jsonDecode(await f.readAsString()) as List<dynamic>;
    return data.map((e) => Quest.fromJson(e)).toList();
  }

  Future<void> save(List<Quest> quests) async {
    final f = await _file();
    await f.writeAsString(jsonEncode(quests.map((e) => e.toJson()).toList()));
  }
}
