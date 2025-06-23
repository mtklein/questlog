import 'package:flutter_test/flutter_test.dart';
import 'package:questlog/main.dart';

void main() {
  testWidgets('Quest list loads', (WidgetTester tester) async {
    await tester.pumpWidget(const QuestLogApp());
    expect(find.text('QuestLog'), findsOneWidget);
  });
}
