import 'package:flutter/material.dart';

//Display error message to user
void displayErrorMessageToUser(BuildContext context, String message) {
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(message),
  //     backgroundColor: Colors.red,
  //   ),
  // );
  showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message)));
}
