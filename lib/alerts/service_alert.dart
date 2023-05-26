import 'package:flutter/material.dart';

class DialogService {
  static Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Agregar cliente"),
        content: Text("Web Service no responde"),
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
