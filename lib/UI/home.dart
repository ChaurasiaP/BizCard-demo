import 'package:biz_card/Util/HexColor.dart';
import 'package:flutter/material.dart';
import '/model/Question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("Is Paris the capital city of France?", true),
    Question.name(
        "Did William Shakespeare write the play \"Romeo and Juliet\"?", true),
    Question.name("Is Saturn known as the \"Red Planet\"?", false),
    Question.name("Is the chemical symbol for water H2O?", true),
    Question.name("Is the Blue Whale the largest mammal on Earth?", true),
    Question.name("Did Picaso paint the Mona Lisa?", false),
    Question.name("Is the currency of India the Rupee?", true),
    Question.name(
        "Did Albert Einstein develop the theory of relativity?", true),
    Question.name(
        "Is Mount Kiliminjaro the tallest mountain in the world?", false),
    Question.name("Are there seven continents on Earth?", true),
  ];

  List imgList = [
    Image.asset("img/1.jpg"),
    Image.asset("img/2.jpg"),
    Image.asset("img/3.jpg"),
    Image.asset("img/4.jpg"),
    Image.asset("img/5.jpg"),
    Image.asset("img/6.jpg"),
    Image.asset("img/7.png"),
    Image.asset("img/8.jpg"),
    Image.asset("img/9.jpg"),
    Image.asset("img/10.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Nation"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 30.0),
                      width: 300,
                      height: 200,
                      child: imgList[_currentQuestionIndex]),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    height: 150,
                    width: 350,
                    margin: EdgeInsets.all(18.0),
                    padding: EdgeInsets.all(30.0),
                    alignment: Alignment.center,
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _prevQuestion(),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    ElevatedButton(
                        onPressed: () => _checkAnswer(true),
                        child: Text(
                          "True",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    ElevatedButton(
                        onPressed: () => _checkAnswer(false),
                        child: Text(
                          "False",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    ElevatedButton(
                      onPressed: () => _nextQuestion(),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    )
                  ],
                )
              ],
            )));
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("Correct Answer");
      final snackBar = SnackBar(
          content: Text("Correct Answer!", style: TextStyle(fontSize: 20)),
          padding: EdgeInsets.all(30.0),
          backgroundColor: Colors.green.shade400,
          duration: Duration(milliseconds: 500));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        _currentQuestionIndex =
            (_currentQuestionIndex + 1) % questionBank.length;
      });
    } else {
      final snackBar = SnackBar(
          content: Text(
            "Incorrect Answer!",
            style: TextStyle(fontSize: 20),
          ),
          padding: EdgeInsets.all(30.0),
          backgroundColor: Colors.red.shade400,
          duration: Duration(milliseconds: 500));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      debugPrint("Incorrect Answer");
    }
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}
