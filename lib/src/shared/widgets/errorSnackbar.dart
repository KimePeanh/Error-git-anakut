import 'package:flutter/material.dart';

void errorSnackBar({required String text, required BuildContext context}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
  ));
}
