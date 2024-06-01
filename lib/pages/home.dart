import 'package:flutter/material.dart';
import 'package:manyinone/pages/app_drawer.dart';
import 'app_drawer.dart'; // Import the AppDrawer

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 in 1'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: AppDrawer(), // Use the AppDrawer here
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
