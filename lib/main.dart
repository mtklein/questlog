import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'models/quest.dart';
import 'quest_editor.dart';
import 'storage.dart';

void main() => runApp(const QuestLogApp());

class QuestLogApp extends StatelessWidget {
  const QuestLogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuestLog Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _storage = QuestStorage();
  List<Quest> _quests = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final loaded = await _storage.load();
    if (loaded.isEmpty) {
      loaded.addAll([
        Quest('Visit the Temple', [
          QuestStep('Buy tickets', latitude: 35.0, longitude: -120.0),
          QuestStep('Take the train'),
          QuestStep('Explore the grounds', latitude: 35.1, longitude: -120.1),
        ]),
        Quest('Daily Workout', [
          QuestStep('Warm-up'),
          QuestStep('Run 5k'),
          QuestStep('Stretch'),
        ]),
      ]);
    }
    setState(() {
      _quests = loaded;
    });
  }

  Future<void> _save() async => _storage.save(_quests);

  Quest? get _activeQuest {
    for (final q in _quests) {
      if (q.active) return q;
    }
    return null;
  }

  void _setActive(Quest quest) {
    setState(() {
      for (final q in _quests) {
        q.active = q == quest;
      }
    });
    _save();
  }

  Future<void> _addQuest() async {
    final quest = await Navigator.of(context)
        .push<Quest>(MaterialPageRoute(builder: (_) => const QuestEditor()));
    if (quest != null) {
      setState(() {
        _quests.add(quest);
      });
      _save();
    }
  }

  Future<void> _editQuest(int index) async {
    final quest = _quests[index];
    final updated = await Navigator.of(context).push<Quest>(
        MaterialPageRoute(builder: (_) => QuestEditor(quest: quest)));
    if (updated != null) {
      setState(() {
        _quests[index] = updated;
      });
      _save();
    }
  }

  void _deleteQuest(int index) {
    setState(() {
      _quests.removeAt(index);
    });
    _save();
  }

  Widget _pageForIndex(int index) {
    switch (index) {
      case 0:
        return QuestListScreen(
          quests: _quests,
          onAdd: _addQuest,
          onEdit: _editQuest,
          onDelete: _deleteQuest,
          onSetActive: _setActive,
        );
      case 1:
        return MapScreen(activeQuest: _activeQuest);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageForIndex(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Quests'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        ],
      ),
    );
  }
}

class QuestListScreen extends StatelessWidget {
  final List<Quest> quests;
  final VoidCallback onAdd;
  final void Function(int) onEdit;
  final void Function(int) onDelete;
  final void Function(Quest) onSetActive;

  const QuestListScreen({
    Key? key,
    required this.quests,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
    required this.onSetActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestLog'),
        actions: [
          IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: quests.length,
        itemBuilder: (context, index) {
          final quest = quests[index];
          return QuestWidget(
            quest: quest,
            onEdit: () => onEdit(index),
            onDelete: () => onDelete(index),
            onSetActive: () => onSetActive(quest),
          );
        },
      ),
    );
  }
}

class QuestWidget extends StatefulWidget {
  final Quest quest;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetActive;
  const QuestWidget({
    Key? key,
    required this.quest,
    required this.onEdit,
    required this.onDelete,
    required this.onSetActive,
  }) : super(key: key);

  @override
  State<QuestWidget> createState() => _QuestWidgetState();
}

class _QuestWidgetState extends State<QuestWidget> {
  @override
  Widget build(BuildContext context) {
    final quest = widget.quest;
    return ExpansionTile(
      title: Row(
        children: [
          Expanded(child: Text(quest.title)),
          IconButton(icon: const Icon(Icons.edit), onPressed: widget.onEdit),
          IconButton(
              icon: const Icon(Icons.delete), onPressed: widget.onDelete),
          IconButton(
            icon: Icon(quest.active ? Icons.star : Icons.star_border),
            onPressed: widget.onSetActive,
          ),
        ],
      ),
      children: quest.steps
          .map(
            (s) => CheckboxListTile(
              title: Text(s.title),
              value: s.completed,
              onChanged: (value) {
                setState(() {
                  s.completed = value ?? false;
                });
              },
            ),
          )
          .toList(),
    );
  }
}

class MapScreen extends StatefulWidget {
  final Quest? activeQuest;
  const MapScreen({Key? key, this.activeQuest}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final WebViewController _controller;

  String _htmlForQuest(Quest quest) {
    final stepsWithLoc =
        quest.steps.where((s) => s.latitude != null && s.longitude != null);
    final first = stepsWithLoc.isNotEmpty ? stepsWithLoc.first : null;
    final markers = stepsWithLoc
        .map((s) =>
            "L.marker([${s.latitude},${s.longitude}]).addTo(map).bindPopup(${jsonEncode(s.title)});")
        .join();
    final centerLat = first?.latitude ?? 0;
    final centerLng = first?.longitude ?? 0;
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
</head>
<body style="margin:0">
  <div id="map" style="height:100vh;"></div>
  <script>
    var map = L.map('map').setView([$centerLat, $centerLng], 13);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(map);
    $markers
  </script>
</body>
</html>
''';
  }

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    if (widget.activeQuest != null) {
      _controller.loadHtmlString(_htmlForQuest(widget.activeQuest!));
    } else {
      _controller.loadRequest(Uri.parse('https://www.openstreetmap.org'));
    }
  }

  @override
  void didUpdateWidget(covariant MapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeQuest != oldWidget.activeQuest &&
        widget.activeQuest != null) {
      _controller.loadHtmlString(_htmlForQuest(widget.activeQuest!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
