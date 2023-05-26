import 'package:flutter/material.dart';

class ButtonSend {
  void _sendData(DateTime dateTime) {
    // Código para enviar los datos
    // Aquí puedes utilizar la variable `dateTime`
    // para realizar el envío de datos con la fecha y hora actual
    print('Enviando datos: $dateTime');
  }

  TextButton buttonSend(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.green),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text('¿Está seguro de enviar la información?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    // Cerrar el diálogo de confirmación
                    Navigator.of(context).pop();

                    // Obtener la fecha y hora actual
                    DateTime now = DateTime.now();

                    // Agregar la fecha y hora actual a la información enviada
                    _sendData(now);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text(
        'Enviar',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
