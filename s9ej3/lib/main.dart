// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba conectividad',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String connectionStatus = "----";
  late StreamSubscription subscription;
  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('nueva conexion:  +$result');
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicacion para conexion'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: checkStatus,
              child: const Text('Verificar conexion'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(connectionStatus),
          ],
        ),
      ),
    );
  }

  void checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("usted esta conectado a datos del movil");
      setState(() {
        connectionStatus = "usted esta conectado a datos del movil";
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("usted esta conectado al wifi del movil");
      setState(() {
        connectionStatus = "usted esta conectado al wifi del movil";
      });
    }
  }
}
