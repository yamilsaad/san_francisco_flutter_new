import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalRecibo extends StatefulWidget {
  final TextEditingController totalreciboController;

  const TotalRecibo({Key? key, required this.totalreciboController})
      : super(key: key);

  @override
  State<TotalRecibo> createState() => _TotalReciboState();
}

class _TotalReciboState extends State<TotalRecibo> {
  GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  bool _istotalReciboValid = true;

  @override
  void dispose() {
    widget.totalreciboController.dispose();
    super.dispose();
  }

  //validacion
  String? _validateReciboTotal(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el total en pesos del recibo';
    }
    if (value.length < 5) {
      return 'El monto total debe tener al menos 5 dígitos';
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
              controller: widget.totalreciboController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.monetization_on_outlined),
                labelText: 'Total en pesos del recibo de sueldo',
                border: OutlineInputBorder(),
                hintText: '00000',
              ),
              validator: _validateReciboTotal,
            ),
            if (!_istotalReciboValid)
              Text(
                'Ingrese un número válido',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
