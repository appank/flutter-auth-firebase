import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final controler;
  final String hintTex;
  final bool obscureText;
  const MyTextFiled(
      {Key? key,
      required this.controler,
      required this.hintTex,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controler,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintTex,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
