import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.buttonFlex,
      required this.callBack,
      required this.buttonColor,
      required this.buttonText})
      : super(key: key);
  Color buttonColor;
  Function(String text) callBack;
  String buttonText;
  int? buttonFlex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: buttonFlex == null ? 1 : buttonFlex!,
      child: GestureDetector(
        onTap: () {
          callBack(buttonText);
        },
        child: Container(
          width: 70,
          height: 80,
          child: Text(buttonText, style: Constants.buttonStyle),
          margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
