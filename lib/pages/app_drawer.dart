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
          ListTile( 
            title:  Text("Toss"),
            leading: Icon(Icons.flip),
            onTap: (){
              Navigator.pushNamed(context, '/toss');
            },
          ),
          ListTile( 
            title: Text("Calculator"),
            leading: Icon(Icons.calculate),
            onTap: (){
              Navigator.pushNamed(context, '/Cal');
            },
          )
        ],
      ),
    );
  }
}
