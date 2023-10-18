import 'package:math_calculater/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    // used to check if the result contains a decimal
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          leading: const Icon(Icons.settings, color: Colors.black),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text('DEG', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(result,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 70))),
                          // const Icon(Icons.more_vert,
                          //     color: Colors.blue, size: 30),
                          const SizedBox(width: 20),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(equation,
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                )),
                          ),
                          IconButton(
                            icon: const Icon(Icons.backspace_outlined,
                                color: Colors.blue, size: 30),
                            onPressed: () {
                              buttonPressed("⌫");
                            },
                          ),
                          const SizedBox(width: 20),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('AC', Colors.blue, () => buttonPressed('AC')),
                  calcButton('%', Colors.blue, () => buttonPressed('%')),
                  calcButton('÷', Colors.blue, () => buttonPressed('÷')),
                  calcButton("×", Colors.blue, () => buttonPressed('×')),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('7', Colors.black, () => buttonPressed('7')),
                  calcButton('8', Colors.black, () => buttonPressed('8')),
                  calcButton('9', Colors.black, () => buttonPressed('9')),
                  calcButton('-', Colors.blue, () => buttonPressed('-')),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('4', Colors.black, () => buttonPressed('4')),
                  calcButton('5', Colors.black, () => buttonPressed('5')),
                  calcButton('6', Colors.black, () => buttonPressed('6')),
                  calcButton('+', Colors.blue, () => buttonPressed('+')),
                ],
              ),
              const SizedBox(height: 10),
              // calculator number buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
//mainAxisAlignment: MainAxisAlignment.spaceAround
                    children: [
                      Row(
                        children: [
                          calcButton(
                              '1', Colors.black, () => buttonPressed('1')),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          calcButton(
                              '2', Colors.black, () => buttonPressed('2')),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          calcButton(
                              '3', Colors.black, () => buttonPressed('3')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // calcButton('+/-', Colors.lightBlueAccent,
                          //         () => buttonPressed('+/-')),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          calcButton(
                              '0', Colors.black, () => buttonPressed('0')),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          calcButton(
                              '.', Colors.black, () => buttonPressed('.')),
                        ],
                      ),
                    ],
                  ),
                  calcButton('=', Colors.orange, () => buttonPressed('=')),
                ],
              )
            ],
          ),
        ));
  }
}