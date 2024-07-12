import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color; 
final textcolor;
final String buttonText;
final buttonTapped;
MyButton({ this.color, this.textcolor, required this.buttonText, this.buttonTapped, required Color textColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(  
      onTap:  buttonTapped,
      child:  Padding ( 
        padding:  EdgeInsets.all(10.0),
          child:  ClipRRect( 
            child: Container (  
              color:  color,
              child:  Center ( 
                child: Text ( 
                  buttonText,
                  style: TextStyle( 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ),
      
    );
  }
}