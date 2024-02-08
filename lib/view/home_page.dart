import 'package:calculator/utils/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var buttonText=[
    'C','DEL','%','/',
    '9','8','7','x',
    '6','5','4','-',
    '3','2','1','+',
    '0','.','ANS','=',
  ];

  var problome='question';
  var answer='answer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.deepPurple[50],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                      child: Text(problome)),
                  Container(
                    padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(answer))
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child:GridView.builder(
                    itemCount: buttonText.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context, index) {
                    if (index==0){
                     return MyButton(
                        buttonText: buttonText[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    }else if(index==1){
                     return MyButton(
                        buttonText: buttonText[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }else
                     return  MyButton(
                        buttonText: buttonText[index],
                        color: isOperator(buttonText[index])?Colors.amber[600]: Colors.white,
                        textColor: Colors.black,
                      );
                  },)
                )),
          ],
        ),
      ),
    );
  }
  bool isOperator(String x){
    if(x=='%'|| x=='+'|| x=='-'|| x=='+'|| x=='='|| x=='x'|| x=='/'|| x=='%'){
      return true;
    }else
      return false;
  }
}
