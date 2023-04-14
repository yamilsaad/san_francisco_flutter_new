import 'package:flutter/material.dart';

class InputCelWidget extends StatefulWidget {
  final TextEditingController celularController;

  const InputCelWidget({Key? key, required this.celularController})
      : super(key: key);

  @override
  _InputCelWidgetState createState() => _InputCelWidgetState();
}

class _InputCelWidgetState extends State<InputCelWidget> {
  @override
  void dispose() {
    widget.celularController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: TextField(
        controller: widget.celularController,
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
