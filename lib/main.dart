import 'package:flutter/material.dart';
import 'package:manyinone/pages/checklist.dart';
import 'package:manyinone/pages/encrypt.dart';
import 'package:manyinone/pages/home.dart';
import 'package:manyinone/pages/todo.dart';

import 'pages/tanslator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  '2 in 1',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/checklist': (context) => Checklist(),
        '/todo': (context) => TODO(),
        '/encrypt': (context) => Encryption(),
        '/translator': (context) => Translate(),
      },
    );
  }
}

