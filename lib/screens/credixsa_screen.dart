import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CredixsaScreen extends StatefulWidget {
  const CredixsaScreen({required Key key}) : super(key: key);

  @override
  State<CredixsaScreen> createState() => _CredixsaScreenState();
}

class _CredixsaScreenState extends State<CredixsaScreen> {
  TextEditingController dniController = TextEditingController();
  String dni = '';
  String resultado = '';
  String estado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credexsa'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Ingresar DNI de cliente'),
            SizedBox(height: 10),
            TextField(
              controller: dniController,
              onChanged: (value) {
                setState(() {
                  dni = value;
                });
              },
            ),
            Divider(height: 10),
            ElevatedButton(
              onPressed: () {
                enviarSolicitudPost();
              },
              child: Text('Enviar'),
            ),
            Divider(height: 10),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getColorFromEstado(estado),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                    'Estado: ${_getEstadoText(estado)}'), // Usar _getEstadoText directamente
              ],
            ),
            Divider(height: 10),
            Container(
              child: Text(resultado),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorFromEstado(String estado) {
    switch (estado.toLowerCase()) {
      case 'rojo':
        return Colors.red;
      case 'verde':
        return Colors.green;
      case 'amarillo':
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }

  void enviarSolicitudPost() async {
    var url = Uri.parse('https://webservice.credixsa.com/ws004.php');

    var usuario = '1005751018';
    var clave = 'R6cf8DTR872p';
    var idCliente = dni;
    var nombre = '';

    var requestBody = {
      'wscx_id': idCliente,
      'wscx_usu': usuario,
      'wscx_pas': clave,
      'wscx_nom': nombre,
    };

    var response = await http.post(url, body: requestBody);

    if (response.statusCode == 200) {
      // La solicitud fue exitosa
      var resultado = response.body;
      setState(() {
        this.resultado = procesarRespuesta(
            resultado); // Actualizar el resultado en el estado
      });
    } else {
      // Error al realizar la solicitud
      print('Error: ${response.statusCode}');
    }
  }

  String procesarRespuesta(String resultado) {
    var partes = resultado.split('|');

    var dni = partes[0];
    var numero = partes[5];
    estado = partes[8];
    var estadoFinanciero = partes[9];
    var cuilCuit = partes[11];
    var nombreApellido = partes[12];
    var domicilio = partes[13];
    var provincia = partes[16];
    var fechaNacimiento = partes[17];
    var estadoColor = getColorFromEstado(estado); // Obtener el color del estado

    return 'DNI: $dni\nNúmero: $numero\nEstado: ${_getEstadoText(estado)}\nEstado Financiero: $estadoFinanciero\nCUIT/CUIL: $cuilCuit\nNombre y Apellido: $nombreApellido\nDomicilio: $domicilio\nProvincia: $provincia\nFecha de Nacimiento: $fechaNacimiento';
  }

  String _getEstadoText(String estado) {
    switch (estado.toLowerCase()) {
      case 'rojo':
        return 'Rojo';
      case 'verde':
        return 'Verde';
      case 'amarillo':
        return 'Amarillo';
      default:
        return 'Desconocido';
    }
  }
}
