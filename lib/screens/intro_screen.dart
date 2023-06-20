import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/widgets/custom_input.dart';

import '../widgets/custom_btn.dart';

class IntroScreen extends StatelessWidget {

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Hey there!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset("assets/images/take-a-quiz.png"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Your name here please',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                CustomInput(
                  hintText: "Name",
                  controller: textFieldController,
                ),
                SizedBox(height: 15,),
                Text(
                  'Your contact number',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                CustomInput(
                  hintText: "Contact Number",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomBtn(
                  text: 'Take the quiz',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen(textFieldController.text)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
