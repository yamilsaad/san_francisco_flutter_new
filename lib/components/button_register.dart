import 'package:flutter/material.dart';

class ButtonRegister {
  static Widget registerButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: Text(
        'Crear una nueva cuenta',
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}
