import 'package:calculator/widgets/share_value.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Share.switchTheme == true ? ThemeData.dark() : ThemeData.light(),
        home: HomeScreen());
  }
}
