import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                scale: 6,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Actividad de profundización',
                style: TextStyle(color: Colors.purple),
              ),
            ],
          ),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Ingrese un numero'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Ingrese su telefono'),
              keyboardType: TextInputType.phone,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Ingrese su correo'),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
