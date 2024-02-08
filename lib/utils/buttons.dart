
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String? buttonText;

  MyButton({this.color, this.textColor, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(offset: Offset(2, 2),color: Colors.black.withOpacity(0.4),blurRadius: 2)]
        ),
              // color: color,
              child: Center(child: Text(buttonText!,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
    );
  }
}
