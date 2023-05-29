import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'dart:math';

class ButtonSms {
  TextButton buttonSms(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
      ),
      onPressed: () async {
        String codigoValidacion = generarCodigoValidacion();
        bool numeroExiste = await enviarSms(codigoValidacion);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(numeroExiste
                  ? "Código de Validación"
                  : "Número no existente"),
              content: Text(numeroExiste
                  ? "El código de validación es: $codigoValidacion"
                  : "El número ingresado no existe."),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text(
        'Enviar SMS',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  String generarCodigoValidacion() {
    Random random = Random();
    int codigo = random.nextInt(900000) +
        100000; // Genera un número aleatorio de 6 dígitos
    return codigo.toString();
  }

  Future<bool> enviarSms(String codigoValidacion) async {
    TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'AC1e5a17bda8d531fe21a72a0c59f3d24b',
      authToken: '16697d316d95edbd5ecb82ee09f750ec',
      twilioNumber: '+13158475290',
    );

    try {
      await twilioFlutter.sendSMS(
        toNumber: '+542645748636',
        messageBody: 'Tu código de validación es: $codigoValidacion',
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
