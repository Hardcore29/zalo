import 'package:flutter/material.dart';

//text field
// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final dynamic errorText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
      ),
      style: const TextStyle(fontSize: 18, color: Colors.black),
    );
  }
}

class MsgDialog {
  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          ElevatedButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(MsgDialog);
            },
          ),
        ],
      ),
    );
  }
}


