import 'package:flutter/material.dart';
import 'package:manyinone/pages/app_drawer.dart';

class Checklist extends StatelessWidget {
  
  final TextEditingController add = TextEditingController();
  
  void addd(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: add,
            decoration: InputDecoration(
              hintText: "Enter Things to add in checklist",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Add your logic to add the item here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checklist"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addd(context);
        },
      ),
    );
  }
}
