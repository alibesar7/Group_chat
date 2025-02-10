
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final Function(String) onChange;
  final String? hintText;

  const CustomFormTextField({required this.onChange, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "Please enter some text";
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
