import 'package:flutter/material.dart';
import 'package:quiz_app/screens/intro_screen.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  final int resultScore;
  final String? name;

  const ResultScreen({required this.resultScore, this.name});

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore == 5) {
      resultText = 'You are awesome!';
    } else if (resultScore >= 3) {
      resultText = 'Well done';
    } else {
      resultText = 'Work hard! All the best!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6Fa),
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Lottie.asset(
                "assets/animations/136496-confetti-elipses.json",
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name ?? 'No Name? Strange!',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    resultPhrase,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Score ' '$resultScore',
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ), //Text
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IntroScreen()),
                      );
                    },
                    child: Container(
                      color: Color(0xFFffc0cb),
                      padding: const EdgeInsets.all(14),
                      child: const Text(
                        'Restart',
                        style: TextStyle(color: Colors.black87, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
