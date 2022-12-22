import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  //pass variables with button press
  final String text;
  final Function callback;
  
  const CalculatorButton({
     required this.text,
     required this.callback
  });

// button widget
  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: EdgeInsets.all(10.0),
                    child: SizedBox(
                    width:  50,
                    height: 50,
                    child: TextButton(
                         style: TextButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.blueGrey,
                       ),
                        
                     child: Text(
                        text,
                        style: TextStyle(fontSize: 23), 
                        
                      ),
                      onPressed: () => callback(text),
                    
                      ),
                    ),
                  );
                 
      
  }
}