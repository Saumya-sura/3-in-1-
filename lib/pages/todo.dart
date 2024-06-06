import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:manyinone/pages/app_drawer.dart';
import 'package:http/http.dart' as http;

class TodoHomePage extends StatefulWidget {
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Description"),
            minLines: 2,
            maxLines: 8,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submit,
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }

  void submit() async {
    final title = titleController.text;
    final description = descriptionController.text;

    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    final url = 'http://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);

    final res = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (res.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Todo added successfully")),
      );
      titleController.clear();
      descriptionController.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Add()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add Todo")),
      );
    }
  }
}

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List items = [];

  Future<void> fetchTodo() async {
    final url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    } else {
      print("Failed to fetch todos");
    }
  }

  Future<void> deleteByID(String id) async {
    final url = 'http://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final res = await http.delete(uri);
    if (res.statusCode == 200) {
      final filteredItems = items.where((element) => element['id'] != id).toList();
      setState(() {
        items = filteredItems;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Todo deleted successfully")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete Todo")),
      );
    }
  }

  @override
  void initState() {
    fetchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
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
      body: RefreshIndicator(
        onRefresh: fetchTodo,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index] as Map;
            final id = item['_id'];
            return ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(item['title']),
              subtitle: Text(item['description']),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  if (value == "Edit") {
                    // Add edit functionality here
                  } else if (value == "Delete") {
                    deleteByID(id);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Edit"),
                    value: "Edit",
                  ),
                  PopupMenuItem(
                    child: Text("Delete"),
                    value: "Delete",
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoHomePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
