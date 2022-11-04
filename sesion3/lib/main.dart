import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'StatefulWidget example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatefulWidget example'),
        ),
        body: const Center(child: Counter()),
      )));
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        Text('Contador: $_counter'),
      ],
    );
  }
}
