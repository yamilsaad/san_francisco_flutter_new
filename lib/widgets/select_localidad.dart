import 'package:flutter/material.dart';

class SelectLocalidad extends StatefulWidget {
  final Function(String) onLocalidadSelected; // agregamos esta propiedad

  const SelectLocalidad({Key? key, required this.onLocalidadSelected})
      : super(key: key);

  @override
  _SelectLocalidadState createState() => _SelectLocalidadState();
}

class _SelectLocalidadState extends State<SelectLocalidad> {
  String _selectedOption = 'Pocito';
  List<String> options = ['Pocito', 'San Juan', 'Rawson', 'Albardon'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sucursal:'),
        DropdownButton<String>(
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
              widget.onLocalidadSelected(
                  _selectedOption); // llamamos al método onLocalidadSelected y le pasamos la nueva selección
            });
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Text(
          'Opción seleccionada: $_selectedOption',
        ),
      ],
    );
  }
}
