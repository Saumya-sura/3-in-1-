import'package:flutter/material.dart';
import 'package:manyinone/pages/app_drawer.dart';
import 'package:translator/translator.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  var language = ['hindi','English','Marathi'];
  var destination = "To";
  var origin = "From ";
  var output= "";
  TextEditingController lang = TextEditingController();
  void translate(String src, String dest,String input )async{
    GoogleTranslator translator = new GoogleTranslator();
    var trans = await translator.translate(input,from: src,to: dest);
    setState(() {
      output = trans.text.toString();

    });
    if(src == '--'|| dest == '--'){
        setState(() {
          output = "Please select the language";
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Translator"),
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
      body: Center( 
        child: SingleChildScrollView( 
          child: Column( 
            children: [ 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  DropdownButton(
                      focusColor: Colors.white,
                      iconDisabledColor: Colors.yellow,
                      iconEnabledColor: Colors.red,

                      hint: Text(origin),
                      icon: Icon(Icons.arrow_drop_down),
                    items: language.map((dropDownStringItem){
                    return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,);

                  }).toList(), onChanged: (String?value){
                    setState(() {
                      origin = value!;

                    });
                  }),

                  SizedBox(width: 20),
                    Icon(Icons.keyboard_arrow_right),
                    SizedBox(width: 20),

                      DropdownButton( 
                        focusColor: Colors.white,
                        iconDisabledColor: Colors.yellow,
                        iconEnabledColor: Colors.red,
                        hint: Text(destination),
                        icon: Icon(Icons.arrow_drop_down),
                        items: language.map((dropDownStringItem){
                          return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,);

                        }).toList(), onChanged: (String?value){
                          setState(() {
                            destination = value!;
                          });
                        }),
                      

                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField( 
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white ),
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
                controller: lang,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter some text";
                  }
                },
                
              ),
              ElevatedButton(    
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), 
                onPressed: (){ 
                 // translate(src, dest, input)
                }, child: Text("Translate")),
            ],
          ),
        ),
      ),
    );
  }
}