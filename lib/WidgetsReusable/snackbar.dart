import 'package:flutter/material.dart';

class ShowSnackbar {
  void show(String message, BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(
          fontSize: 14,
          color: Colors.white
        ),),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
