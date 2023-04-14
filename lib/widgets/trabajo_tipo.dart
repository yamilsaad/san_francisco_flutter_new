import 'package:flutter/material.dart';

class TrabajoTipoWidget extends StatefulWidget {
  final Function(String)
      onTrabajoSelected; // definir un callback para la opción seleccionada

  const TrabajoTipoWidget({Key? key, required this.onTrabajoSelected})
      : super(key: key);

  @override
  _TrabajoTipoWidgetState createState() => _TrabajoTipoWidgetState();
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
          labelText: 'El cliente tiene un recibo de:',
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
            widget.onTrabajoSelected(
                newValue); // llamar al callback con la opción seleccionada
          });
        },
      ),
    );
  }
}
