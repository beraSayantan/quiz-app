import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {

  final String? text;
  final Function()? onPressed;
  CustomBtn({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFf5f5dc),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Text (
            text ?? "Text",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
