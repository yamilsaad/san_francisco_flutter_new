import 'package:flutter/material.dart';

class AlertScanner {
  static Future<void> showErrorDialog(
      BuildContext context, String errorMessage) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
