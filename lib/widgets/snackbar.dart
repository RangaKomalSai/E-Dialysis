import 'package:flutter/material.dart';

void showSnackBar( BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 16.0, color: Colors.white),
      ),
      backgroundColor: Colors.redAccent, // Background color
      elevation: 6.0, // Shadow elevation
      behavior: SnackBarBehavior.floating, // Floating behavior
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0), // Rounded corners
      ),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}