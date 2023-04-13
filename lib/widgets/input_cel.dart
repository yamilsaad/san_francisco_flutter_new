import 'package:flutter/material.dart';

class InputCelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TextEditingController _controller = TextEditingController(text: '+549');

    return Container(
      margin: EdgeInsets.all(
          16.0), // margen de 16 puntos en todos los lados del contenedor
      child: TextField(
        //controller: _controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: 'Número de teléfono',
            border: OutlineInputBorder(),
            hintText: '0264 155000000'),
      ),
    );
  }
}
