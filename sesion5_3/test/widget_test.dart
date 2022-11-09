import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget manejando alarma', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget());

    expect(find.text("Alarm off"), findsOneWidget);

    // Tap the add button.
    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    expect(find.text("Alarm on"), findsOneWidget);
  });
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _alarmState = false;

  @override
  Widget build(BuildContext comtext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget testing demo',
      home: Scaffold(
          appBar: AppBar(title: const Text('Tapping test')),
          body: Center(child: Text(_alarmState ? 'Alarm on' : 'Alarm off')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _alarmState = !_alarmState;
              });
            },
            child: const Icon(Icons.access_alarm),
          )),
    );
  }
}
