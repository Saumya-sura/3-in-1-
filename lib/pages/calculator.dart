import'package:flutter/material.dart';
import 'package:manyinone/pages/button.dart';
import 'package:math_expressions/math_expressions.dart';

class Cal extends StatefulWidget {
  const Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  var  userinput = '';
  var  answer = ' ';
  final List<String> button =  [ 
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    '=',
    '+',
  ];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userinput,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: button.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userinput = '';
                            answer = '0';
                          });
                        },
                        buttonText: button[index],
                        color: Colors.blue,
                        textColor: Colors.black, 
                      );
                    }
 
                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: button[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userinput += button[index];
                          });
                        },
                        buttonText: button[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                          });
                        },
                        buttonText: button[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: button[index],
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }
 
                    //  other buttons
                    else {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userinput += button[index];
                          });
                        },
                        buttonText: button[index],
                        color: isOperator(button[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(button[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }


  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }


  void equalPressed(){
      String finaluserinput = userinput;
      finaluserinput = finaluserinput.replaceAll('x', '*');

      Parser p =Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval  =exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
  }
  }