import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.hide = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 12),
      decoration: BoxDecoration(
          color: kWhiteBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffDCDCDC),
              offset: Offset(1, 3),
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ]),
      child: TextField(
        controller: controller,
        cursorColor: kMainColor,
        obscureText: hide,
        textAlign: TextAlign.center,
        style: const TextStyle(color: kMainColor, fontSize: 16.0),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0x85666666),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
