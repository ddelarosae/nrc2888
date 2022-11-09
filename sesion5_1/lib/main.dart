import 'package:flutter/material.dart';

//ajustes menores
void main() {
  try {
    throw ('todo bien');
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
