import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniProject',
      home:Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => new CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String output = "";
  String _output = "";
  int num1 = 0;
  int num2 = 0;
  String operand = "";
  buttonPressed(String buttonText){
    if(buttonText == "C"){
      _output = "";
      num1 = 0;
      num2 = 0;
      operand = "0";
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
      num1 = int.parse(output);
      operand = buttonText;
      _output = "";
    }
    else if (buttonText == "="){
      num2 = int.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        if(num2==0) {
          _output = "Error";
          }
        else {
          _output = (num1 / num2).toString();
        }
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = _output.toString();
    });
  }
  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding:  EdgeInsets.all(24.0),
        child: Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator by Ronnakorn Pophet 6035512049'),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding:EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child:Text(output, style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,

                    ))),
                Expanded(
                  child:Divider(),
                ),
                Column(children: [
                  Row(children: [
                    buildButton("9"),
                    buildButton("8"),
                    buildButton("7"),
                    buildButton("+")
                  ]),

                  Row(children: [
                    buildButton("6"),
                    buildButton("5"),
                    buildButton("4"),
                    buildButton("-")
                  ]),

                  Row(children: [
                    buildButton("3"),
                    buildButton("2"),
                    buildButton("1"),
                    buildButton("X")
                  ]),

                  Row(children: [
                    buildButton("C"),
                    buildButton("0"),
                    buildButton("="),
                    buildButton("/")
                  ]),

                ])
              ],
            )));
  }
}