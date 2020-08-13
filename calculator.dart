import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  Widget _button(String number, Function() f){
    return MaterialButton(
      height: 80.0,
      child: Text(
        number,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: f,
    );
  }

  var ansStr = "";
  var ansStr2 = "";
  var op = "";

  void _clear() {
    setState(() {
      ansStr = "0";
    });
  }
  
  void _number(numb) {
      numb = numb.toString();
      setState((){
          if (ansStr == "0") { 
              ansStr = numb;
          } else {
              ansStr += numb;
          }
      });
  }
  
  void _operation(oper) {
      setState((){
          ansStr2 = ansStr;
          ansStr = "0";
          op = oper;
      });
  }

  void _undo() {
    setState(() {
      var l = ansStr.length - 1;
      ansStr = ansStr.substring(0, l);
    });
  }

  void _dot() {
    setState(() {
      if (ansStr == "0") {
        ansStr = "0.";
      } else {
        ansStr += ".";
      }
    });
  }

  void _minus() {
    setState(() {
      if (ansStr == "0") {
        ansStr = "(-";
      } else if(ansStr.startsWith("(")) {
        ansStr = "(-";
      } else {
        ansStr = "(-" + ansStr;
      }
    });
  }

  void _bracket() {
    setState(() {
      if (ansStr == "0") {
        ansStr = "(";
      } else if (ansStr.startsWith("(")){
        ansStr += ")";
      }
    });
  }

  void _dis() {
    setState(() {
      if (op == "+") {
        var ansInt1 = int.parse(ansStr);
        var ansInt2 = int.parse(ansStr2);
        var res = ansInt1 + ansInt2;
        var result = res.toString();
        ansStr = result;
      } else  if (op == "-") {
        var ansInt1 = int.parse(ansStr);
        var ansInt2 = int.parse(ansStr2);
        var res = ansInt1 - ansInt2;
        var result = res.toString();
        ansStr = result;
      } else if (op == "*") {
        var ansInt1 = int.parse(ansStr);
        var ansInt2 = int.parse(ansStr2);
        var res = ansInt1 * ansInt2;
        var result = res.toString();
        ansStr = result;
      } else if (op == "/") {
        var ansInt1 = int.parse(ansStr);
        var ansInt2 = int.parse(ansStr2);
        var res = ansInt1 / ansInt2;
        var result = res.toString();
        ansStr = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
              ),
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text(
                "$ansStr",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("C", _clear),
                _button("()", _bracket),
                _button("<", _undo),
                _button("/", _operation("/")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("7", _number("7")),
                _button("8", _number("8")),
                _button("9", _number("9")),
                _button("*", _operation("*")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("4", _number("4")),
                _button("5", _number("5")),
                _button("6", _number("6")),
                _button("-", _operation("-")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("1", _number("1")),
                _button("2", _number("2")),
                _button("3", _number("3")),
                _button("+", _operation("+")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("+-", _minus),
                _button("0", _number("0")),
                _button(".", _dot),
                _button("=", _dis),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
