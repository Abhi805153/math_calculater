// import 'package:flutter/material.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   String output = "0";
//   String _output = "0";
//   double num1 = 0;
//   double num2 = 0;
//   String operand = "";
//
//   buttonPressed(String buttontext) {
//     if (buttontext == "CLEAR") {
//       _output = "0";
//       num1 = 0;
//       num2 = 0;
//       operand = "";
//     } else if (buttontext == "+" ||
//         buttontext == "-" ||
//         buttontext == "*" ||
//         buttontext == "/") {
//       num1 = double.parse(output);
//       operand = buttontext;
//       _output = "0";
//     } else if (buttontext == ".") {
//       if (_output.contains(".")) {
//         print("Already contains a decimal");
//       } else {
//         _output = _output + buttontext;
//       }
//     } else if (buttontext == "=") {
//       num2 = double.parse(output);
//       if (operand == "+") {
//         _output = (num1 + num2).toString();
//       }
//       if (operand == "-") {
//         _output = (num1 - num2).toString();
//       }
//       if (operand == "*") {
//         _output = (num1 * num2).toString();
//       }
//       if (operand == "/") {
//         _output = (num1 / num2).toString();
//       }
//       num1 = 0;
//       num2 = 0;
//       operand = "";
//       _output = "";
//     } else {
//       _output = _output + buttontext;
//     }
//     print(_output);
//     setState(() {
//       output = double.parse(_output).toStringAsFixed(0);
//     });
//   }
//
//   Widget buildButton(String buttonText) {
//     return Expanded(
//       child: SizedBox(
//         height: 70.0,
//         child: Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: OutlinedButton(
//             child: Text(
//               buttonText,
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//             onPressed: () => buttonPressed(buttonText),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calculater'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
//               child: Text(
//                 output,
//                 style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Expanded(
//               child: Divider(),
//             ),
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     buildButton("9"),
//                     buildButton("8"),
//                     buildButton("7"),
//                     buildButton("/")
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("4"),
//                     buildButton("5"),
//                     buildButton("6"),
//                     buildButton("*")
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("1"),
//                     buildButton("2"),
//                     buildButton("3"),
//                     buildButton("-")
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     buildButton("."),
//                     buildButton("0"),
//                     buildButton("00"),
//                     buildButton("+")
//                   ],
//                 ),
//                 Row(
//                   children: [buildButton("CLEAR"), buildButton("=")],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
