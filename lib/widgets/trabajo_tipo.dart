import 'package:flutter/material.dart';

class TrabajoTipoWidget extends StatefulWidget {
  @override
  State<TrabajoTipoWidget> createState() => _TrabajoTipoWidgetState();
}

class _TrabajoTipoWidgetState extends State<TrabajoTipoWidget> {
  String _selectedOption = 'AUH';
  // variable para almacenar la opción seleccionada
  List<String> _options = [
    'AUH',
    'EMPLEADO',
    'MONOTRIBUTISTA',
    'RESPONSABLE INSCRIPTO',
  ];
  // opciones del menú desplegable
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Selecciona una opción',
          border: OutlineInputBorder(),
          filled: true,
        ),
        value: _selectedOption,
        items: _options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedOption = newValue!;
          });
        },
      ),
    );
  }
}
