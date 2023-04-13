import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuracion'),
      ),
      body: Center(
          child: Container(
        child: Text('Configuración'),
      )),
    );
  }
}
