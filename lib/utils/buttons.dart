
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String? buttonText;
  final tapResult;

  MyButton({this.color, this.textColor, this.buttonText,this.tapResult});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: tapResult,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(offset: Offset(1,1),color: Colors.black.withOpacity(0.4),blurRadius: 3)]
          ),
                // color: color,
                child: Center(child: Text(buttonText!,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 18),)),
              ),
      ),
    );
  }
}
