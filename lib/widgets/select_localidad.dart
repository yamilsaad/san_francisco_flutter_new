import 'package:flutter/material.dart';

class SelectLocalidad extends StatefulWidget {
  @override
  _SelectLocalidadState createState() => _SelectLocalidadState();
}

class _SelectLocalidadState extends State<SelectLocalidad> {
  String _selectedOption = 'Pocito';
  List<String> options = ['Pocito', 'San Juan', 'Rawson', 'Albardon'];
  // variable de estado para manejar la selección del usuario

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sucursal:'),
        DropdownButton<String>(
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption =
                  newValue!; // actualiza la variable de estado con la nueva selección
            });
          },
          items: <String>['Pocito', 'San Juan', 'Rawson', 'Albardon']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Text(
            'Opción seleccionada: $_selectedOption'), // muestra la opción seleccionada actualmente
      ],
    );
  }
}
