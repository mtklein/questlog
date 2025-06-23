import 'package:flutter/material.dart';
import 'models/quest.dart';

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

  final List<Widget> _pages = [
    QuestListScreen(),
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
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
  QuestListScreen({Key? key}) : super(key: key);

  final List<Quest> quests = [
    Quest('Visit the Temple', [
      QuestStep('Buy tickets'),
      QuestStep('Take the train'),
      QuestStep('Explore the grounds'),
    ]),
    Quest('Daily Workout', [
      QuestStep('Warm-up'),
      QuestStep('Run 5k'),
      QuestStep('Stretch'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuestLog')),
      body: ListView(
        children: quests.map((q) => QuestWidget(quest: q)).toList(),
      ),
    );
  }
}

class QuestWidget extends StatefulWidget {
  final Quest quest;
  const QuestWidget({Key? key, required this.quest}) : super(key: key);

  @override
  State<QuestWidget> createState() => _QuestWidgetState();
}

class _QuestWidgetState extends State<QuestWidget> {
  @override
  Widget build(BuildContext context) {
    final quest = widget.quest;
    return ExpansionTile(
      title: Text(quest.title),
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

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Map placeholder'),
    );
  }
}
