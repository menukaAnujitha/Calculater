import 'package:flutter/material.dart';
import 'package:project_six/widgets/button.dart';


void main() {
   runApp(CalculatorApp());
  }



class CalculatorApp  extends StatefulWidget {
  
   const CalculatorApp({super.key});


  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
  
}

class  _CalculatorAppState extends State<CalculatorApp> {
  
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;


void btnOnClick(String btnVal){
  print(btnVal);

  
  if( btnVal == 'C' ){
    textToDisplay = '';
    firstNum = 0;
    secondNum = 0;
    res = '';

  } else if( btnVal == 'AC' ){
    textToDisplay = '';
    firstNum = 0;
    secondNum = 0;
    res = '';
    history = '';
  
  
  } else if( btnVal == '+/-' ){
    if( textToDisplay[0] != '-'){
      res = '-'+textToDisplay;
    }else{
      res = textToDisplay.substring(1);
    }
  
  
  } else if( btnVal == '<' ){
    res = textToDisplay.substring(0, textToDisplay.length - 1);
  
  
  } else if( btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/'){

    firstNum = int.parse(textToDisplay);
    res = '';
    operation = btnVal;
  
  
  }else if (btnVal == '='){

    secondNum = int.parse(textToDisplay);
    if ( operation == '+' ){
      res =(firstNum + secondNum).toString();
      history = firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if ( operation == '-' ){
      res =(firstNum - secondNum).toString();
      history = firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if ( operation == 'X' ){
      res =(firstNum * secondNum).toString();
      history = firstNum.toString() + operation.toString() + secondNum.toString();
    }

    if ( operation == '/' ){
      res =(firstNum / secondNum).toString();
      history = firstNum.toString() + operation.toString() + secondNum.toString();
    }

    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState((){
      textToDisplay = res;
    });
  
  

}
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Calculater',

      theme: ThemeData(primarySwatch: Colors.blueGrey),

      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculater (create by menuka)'),

        ),
        
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                child: Padding(padding: EdgeInsets.only(right: 12),
                child: Text(
                        history,
                        style: TextStyle(fontSize: 24, color: Colors.blueGrey,), 
                        
                      ),),
                  alignment: Alignment(1.0, 1.0),
              ),

              Container(
                child: Padding(padding: EdgeInsets.all(12),
                child: Text(
                        textToDisplay,
                        style: TextStyle(fontSize: 48, color: Colors.black,), 
                        
                      ),),
                  alignment: Alignment(1.0, 1.0),
              ),
              
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  CalculatorButton(text: 'AC', callback: btnOnClick),
                  CalculatorButton(text: 'C', callback: btnOnClick),
                  CalculatorButton(text: '<', callback: btnOnClick),
                  CalculatorButton(text: '/', callback: btnOnClick),
                  
                  ],),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  CalculatorButton(text: '9', callback: btnOnClick),
                  CalculatorButton(text: '8', callback: btnOnClick),
                  CalculatorButton(text: '7', callback: btnOnClick),
                  CalculatorButton(text: 'X', callback: btnOnClick),
                  
                  ],),

                  
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  CalculatorButton(text: '6', callback: btnOnClick),
                  CalculatorButton(text: '5', callback: btnOnClick),
                  CalculatorButton(text: '4', callback: btnOnClick),
                  CalculatorButton(text: '-', callback: btnOnClick),
                  
                  ],),

                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  CalculatorButton(text: '3', callback: btnOnClick),
                  CalculatorButton(text: '2', callback: btnOnClick),
                  CalculatorButton(text: '1', callback: btnOnClick),
                  CalculatorButton(text: '+', callback: btnOnClick),
                  
                  ],),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  CalculatorButton(text: '+/-', callback: btnOnClick),
                  CalculatorButton(text: '0', callback: btnOnClick),
                  CalculatorButton(text: '00', callback: btnOnClick),
                  CalculatorButton(text: '=', callback: btnOnClick),
                  
                  ],),
                ],        
        ),

            

          ),
        ),
      
        
    );
    
  }
}