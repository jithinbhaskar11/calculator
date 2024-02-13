import 'package:calculator/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var buttonText=[
    'C','DEL','%','/',
    '7','8','9','x',
    '4','5','6','-',
    '1','2','3','+',
    '0','00','.','=',
  ];

  var problem='';
  var answer='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                        child: Text(problem,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(answer,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                  ],
                ),
              )),
              Expanded(
                  flex: 3,
                  child: Container(
                    child:GridView.builder(
                      itemCount: buttonText.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context, index) {
                        ///clear button
                      if (index==0){
                       return MyButton(
                         tapResult: (){
                           setState(() {
                             problem='';
                             answer='';
                           });
                         },
                          buttonText: buttonText[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                       ///delete button
                      }else if(index==1){
                       return MyButton(
                         tapResult: (){
                           setState(() {
                             problem=problem.substring(0,problem.length-1);
                           });
                         },
                          buttonText: buttonText[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                       ///equal button
                      }else if(index==buttonText.length-1){
                        return MyButton(
                          tapResult: (){
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttonText[index],
                          color: Colors.amber[600],
                          textColor: Colors.black,
                        );
        
                       //other buttons
                      }else
                       return  MyButton(
                         tapResult: (){
                           setState(() {
                             problem+=buttonText[index];
                           });
                         },
                          buttonText: buttonText[index],
                          color: isOperator(buttonText[index])?Colors.amber[600]: Colors.white,
                          textColor: Colors.black,
                        );
                    },)
                  )),
            ],
          ),
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

  void equalPressed() {
    String finalProblem=problem;
    finalProblem=finalProblem.replaceAll('x', '*');
    finalProblem = finalProblem.replaceAll('%', '/100*');

    Parser p = Parser();
    Expression exp = p.parse(finalProblem);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer=eval.toString();
  }
}
