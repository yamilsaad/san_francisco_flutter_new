import 'package:flutter/material.dart';

class FechaRecibo extends StatefulWidget {
  final TextEditingController fechareciboController;

  const FechaRecibo({Key? key, required this.fechareciboController})
      : super(key: key);

  @override
  State<FechaRecibo> createState() => _FechaReciboState();
}

class _FechaReciboState extends State<FechaRecibo> {
  GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  bool _isfechaReciboValid = true;

  @override
  void dispose() {
    widget.fechareciboController.dispose();
    super.dispose();
  }

  //validacion
  String? _validateReciboFecha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese Fecha de inicio de actividad';
    }
    if (value.length < 10) {
      return 'Fecha incorrecta';
    }
    return null; // validacion exitosa!
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Form(
        key: _formkey2,
        child: Column(
          children: [
            TextFormField(
              controller: widget.fechareciboController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_month),
                labelText: 'Inicio de actividad dd/mm/aaaa',
                border: OutlineInputBorder(),
                hintText: '01/01/1990',
              ),
              validator:
                  _validateReciboFecha, // Cambié el validador a _validateFechaInicio
            ),
            if (!_isfechaReciboValid)
              Text(
                'Fecha Invalidad',
                style: TextStyle(color: Colors.red),
              ), // Agregué un espacio entre los TextFormField para separarlos
          ],
        ),
      ),
    );
  }
}
