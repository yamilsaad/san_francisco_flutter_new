import 'package:flutter/material.dart';

class InputCelWidget extends StatefulWidget {
  final TextEditingController celularController;

  const InputCelWidget({Key? key, required this.celularController})
      : super(key: key);

  @override
  _InputCelWidgetState createState() => _InputCelWidgetState();
}

class _InputCelWidgetState extends State<InputCelWidget> {
  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Clave del formulario
  bool _isPhoneNumberValid =
      true; // Variable para almacenar el estado de validación

  @override
  void dispose() {
    widget.celularController.dispose();
    super.dispose();
  }

  // Función de validación personalizada
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un número de teléfono';
    }
    if (value.length < 10) {
      return 'El número de teléfono debe tener al menos 10 dígitos';
    }
    return null; // La validación es exitosa
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey, // Asigna la clave del formulario
        autovalidateMode: AutovalidateMode
            .onUserInteraction, // Muestra errores al interactuar con el campo
        child: Column(
          children: [
            TextFormField(
              controller: widget.celularController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Número de teléfono',
                border: OutlineInputBorder(),
                hintText: '0264 155000000',
              ),
              validator:
                  _validatePhoneNumber, // Asigna la función de validación
              onChanged: (value) {
                // Restablece el estado de validación al cambiar el texto
                setState(() {
                  _isPhoneNumberValid = true;
                });
              },
            ),
            if (!_isPhoneNumberValid)
              Text(
                'Ingrese un número de teléfono válido',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
