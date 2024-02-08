import 'package:calculator/view/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
