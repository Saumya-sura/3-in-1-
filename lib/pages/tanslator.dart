import 'package:flutter/material.dart';
import 'package:manyinone/pages/app_drawer.dart';
import 'package:translator/translator.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  final List<String> languages = ['English', 'Hindi', 'Marathi'];
  String destination = "To";
  String origin = "From";
  String output = "";
  TextEditingController langController = TextEditingController();

  void translate(String src, String dest, String input) async {
    if (src == '--' || dest == '--') {
      setState(() {
        output = "Please select the language";
      });
      return;
    }

    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text;
    });
  }

  String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Hindi':
        return 'hi';
      case 'Marathi':
        return 'mr';
      default:
        return '--';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translator"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.yellow,
                    iconEnabledColor: Colors.red,
                    hint: Text(origin),
                    icon: Icon(Icons.arrow_drop_down),
                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        origin = value!;
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.keyboard_arrow_right),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.yellow,
                    iconEnabledColor: Colors.red,
                    hint: Text(destination),
                    icon: Icon(Icons.arrow_drop_down),
                    items: languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destination = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Enter Text",
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                controller: langController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  translate(
                    getLanguageCode(origin),
                    getLanguageCode(destination),
                    langController.text,
                  );
                },
                child: Text("Translate"),
              ),
              SizedBox(height: 20),
              Text(
                "\n$output",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
