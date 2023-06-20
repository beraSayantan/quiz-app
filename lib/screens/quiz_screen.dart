import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custom_btn.dart';
import 'package:lottie/lottie.dart';

import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String? name;
  QuizScreen(this.name);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var score = 0;
  var n = 0;

  final List _questions = [
    Question(
      question: "What is a duel between three people called?",
      options: ["Tri-duel", "Duel of 3", "Truel", "None of the above"],
      answer_idx: 2,
    ),
    Question(
      question: "Which ocean surrounds the Maldives?",
      options: ["Indian Ocean", "Atlantic Ocean", "Southern Ocean", "None of the above"],
      answer_idx: 0,
    ),
    Question(
      question: "In Harry Potter, which spell levitates objects?",
      options: ["Levitato", "Expecto Patronum", "Obliviate", "Wingardium Leviosa"],
      answer_idx: 3,
    ),
    Question(
      question: "How long is New Zealand’s Ninety Mile Beach?",
      options: ["99 miles", "55 miles", "90 miles", "45 miles"],
      answer_idx: 1,
    ),
    Question(
      question: "Which animal can be seen on the Porsche logo?",
      options: ["Horse", "Jaguar", "Cheetah", "Unicorn"],
      answer_idx: 0,
    ),
  ];

  void checkAnswer(int choice) {
    if (choice == _questions[n].answer_idx) {
      score++;
      final snackbar = SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (n < _questions.length - 1) {
        n++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(resultScore: score, name: widget.name,)),
        );
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE6E6Fa),
          foregroundColor: Colors.black54,
          title: Text(
            "It's Quiz Time!",
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Card(
            elevation: 30,
            color: Color(0xFFE6E6Fa),
            shadowColor: Colors.white70,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Score : $score/${_questions.length} ",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: reset,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      child: Text(
                        "Reset ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xFFffc0cb),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Question Number ${n + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black),
                    color: Color(0xFFffe5b4),
                  ),
                  child: Text(
                    _questions[n].question,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                CustomBtn(
                  text: _questions[n].options[0],
                  onPressed: () => checkAnswer(0),
                ),
                CustomBtn(
                  text: _questions[n].options[1],
                  onPressed: () => checkAnswer(1),
                ),
                CustomBtn(
                  text: _questions[n].options[2],
                  onPressed: () => checkAnswer(2),
                ),
                CustomBtn(
                  text: _questions[n].options[3],
                  onPressed: () => checkAnswer(3),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Lottie.asset(
                    'assets/animations/106817-cat-thinking-animation.json',
                    height: 200
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
