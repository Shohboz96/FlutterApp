import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/question.dart';

class QuizeApp extends StatefulWidget {
  const QuizeApp({Key? key}) : super(key: key);

  @override
  _QuizeAppState createState() => _QuizeAppState();
}

class _QuizeAppState extends State<QuizeApp> {
  int currentQuestionIndex = 0;
  List questionBank = [
    Question.name("This is Uzbekistan", true),
    Question.name("This is Italian", false),
    Question.name("This is Indian", true),
    Question.name("This is American", false),
    Question.name("This is Mexican", true),
    Question.name("This is Russian", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder:(BuildContext context) =>  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                "assets/image1.jpg",
                width: 250,
                height: 180,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Text(
                    questionBank[currentQuestionIndex].questionText,
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => prevAnswer(),
                    color: Colors.blueGrey.shade700,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  RaisedButton(
                    onPressed: () => checkAnswer(true,context),
                    color: Colors.blueGrey.shade700,
                    child: Text("True" , style: TextStyle(color: Colors.white),),
                  ),
                  RaisedButton(
                    onPressed: () => checkAnswer(false,context),
                    color: Colors.blueGrey.shade700,
                    child: Text("False", style: TextStyle(color: Colors.white),),
                  ),
                  RaisedButton(
                    onPressed: () => nextAnswer(),
                    color: Colors.blueGrey.shade700,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(bool userChoice,BuildContext context) {

    if(userChoice == questionBank[currentQuestionIndex].isCorrect){
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
        duration: Duration(microseconds: 1000
        ),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackbar);
    }else{
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
          duration: Duration(microseconds: 1000),
          content: Text("Wrong!"));
      Scaffold.of(context).showSnackBar(snackbar);
    }
    nextAnswer();
  }

  nextAnswer() {
    setState(() {
      currentQuestionIndex  = (currentQuestionIndex + 1) % questionBank.length;
    });

  }

  prevAnswer() {
    setState(() {
      currentQuestionIndex  = (currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
