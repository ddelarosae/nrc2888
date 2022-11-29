import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../page/home_page.dart';
import '../widget/login_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static const String title = "FireStore Auth Email NRC2293";

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(46),
              textStyle: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        home: const MainPage(),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Existe el siguiente error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginWidget();
            }
          },
        ),
      );
}
