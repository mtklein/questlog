import 'package:flutter/material.dart';
import 'models/quest.dart';

class QuestEditor extends StatefulWidget {
  final Quest? quest;
  const QuestEditor({super.key, this.quest});

  @override
  State<QuestEditor> createState() => _QuestEditorState();
}

class _QuestEditorState extends State<QuestEditor> {
  late TextEditingController _title;
  late List<QuestStep> _steps;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.quest?.title ?? '');
    _steps = widget.quest != null
        ? widget.quest!.steps
            .map((s) => QuestStep(s.title, completed: s.completed))
            .toList()
        : [];
  }

  void _addStep() {
    setState(() {
      _steps.add(QuestStep(''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quest == null ? 'New Quest' : 'Edit Quest'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(
                Quest(_title.text, _steps),
              );
            },
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: const InputDecoration(labelText: 'Quest Title'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  final step = _steps[index];
                  return ListTile(
                    title: TextField(
                      controller: TextEditingController(text: step.title)
                        ..selection =
                            TextSelection.collapsed(offset: step.title.length),
                      onChanged: (val) => step.title = val,
                      decoration:
                          InputDecoration(labelText: 'Step ${index + 1}'),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _steps.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addStep,
              child: const Text('Add Step'),
            ),
          ],
        ),
      ),
    );
  }
}
