import 'package:calculator/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/share_value.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void numClick(String buttonText) {
    if (buttonText == 'AC') {
      setState(() {
        exp = '';
        history = '';
      });
      num1 = 0;
      num2 = 0;
    } else if (buttonText == 'C') {
      setState(() {
        exp = '';
      });
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/' ||
        buttonText == '%') {
      setState(() {
        op = buttonText;
        num1 = double.parse(exp);
        exp = '';
        history = num1.toString();
        history += buttonText;
      });
    } else if (buttonText == '.') {
      if (exp.contains('.')) {
      } else {
        setState(() {
          exp += buttonText;
        });
      }
    } else if (buttonText == "=") {
      num2 = double.parse(exp);
      history += exp;
      switch (op) {
        case "+":
          {
            exp = (num1 + num2).toString();
          }
          break;
        case "-":
          {
            exp = (num1 - num2).toString();
          }
          break;
        case "*":
          {
            exp = (num1 * num2).toString();
          }
          break;
        case "%":
          {
            exp = (num1 % num2).toString();
          }
          break;
        case "/":
          {
            num2 == 0 ? "unveiled operation" : exp = (num1 / num2).toString();
          }
          break;
        default:
          break;
      }
      setState(() {
        exp;
      });
    } else {
      setState(() {
        exp += buttonText;
      });
    }
  }

  String op = '';
  String exp = '';
  String history = '';
  double num1 = 0;
  double num2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Switch(
              value: Share.switchTheme!,
              onChanged: (nweSwitch) {
                setState(() {
                  Share.switchTheme = nweSwitch;
                });
              }),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '$history',
              style: Constants.style1,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '$exp',
              style: Constants.style2,
            ),
          ),
          Row(
            children: [
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.blue,
                buttonText: "AC",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.teal,
                buttonText: "C",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.red,
                buttonText: "%",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.yellow,
                buttonText: "/",
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.blue,
                buttonText: "7",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.teal,
                buttonText: "8",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.red,
                buttonText: "9",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.yellow,
                buttonText: "*",
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.blue,
                buttonText: "4",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.teal,
                buttonText: "5",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.red,
                buttonText: "6",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.yellow,
                buttonText: "-",
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.blue,
                buttonText: "1",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.teal,
                buttonText: "2",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.red,
                buttonText: "3",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.yellow,
                buttonText: "+",
              ),
            ],
          ),
          Row(
            children: [
              CustomButton(
                callBack: numClick,
                buttonFlex: 2,
                buttonColor: Colors.blue,
                buttonText: "0",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.teal,
                buttonText: ".",
              ),
              CustomButton(
                callBack: numClick,
                buttonColor: Colors.red,
                buttonText: "=",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
