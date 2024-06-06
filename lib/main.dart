import 'package:flutter/material.dart';
import 'package:manyinone/pages/checklist.dart';
import 'package:manyinone/pages/encrypt.dart';
import 'package:manyinone/pages/home.dart';
import 'package:manyinone/pages/splash.dart';
import 'package:manyinone/pages/tanslator.dart';
import 'package:manyinone/pages/todo.dart';
  // Corrected import statement

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2 in 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark, // Uses the system theme mode (light/dark)
      initialRoute: '/',
      routes: {
        //'/':(context) => Splash(),
        '/': (context) => Home(),
        '/checklist': (context) => Checklist(),
        '/todo': (context) => TodoHomePage(),
        '/encrypt': (context) => Encryption(),
        '/translator': (context) => Translate(),
      },
    );
  }
}
