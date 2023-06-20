import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final String? hintText;
  TextEditingController? controller;
  CustomInput({this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    String? name;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "Hint Text...",
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          )
        ),
        controller: controller,
      ),
    );
  }
}
