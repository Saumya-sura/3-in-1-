// app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text("DRAWER", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white)),
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text("Checklist"),
            leading: Icon(Icons.check),
            onTap: () {
              Navigator.pushNamed(context, '/checklist');
            },
          ),
          ListTile(
            title: Text("To-do"),
            leading: Icon(Icons.list),
            onTap: () {
              Navigator.pushNamed(context, '/todo');
            },
          ),
          ListTile(
            title: Text("Encrypter"),
            leading: Icon(Icons.no_encryption),
            onTap: () {
              Navigator.pushNamed(context, '/encrypt');
            },
          ),
          ListTile(
            title: Text("Translator"),
            leading: Icon(Icons.translate),
            onTap: () {
              Navigator.pushNamed(context, '/translator');
            },
          ),
        ],
      ),
    );
  }
}
