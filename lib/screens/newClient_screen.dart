import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

import '../widgets/widget.dart';

class NewClienScreen extends StatefulWidget {
  @override
  State<NewClienScreen> createState() => _NewClienScreenState();
}

class _NewClienScreenState extends State<NewClienScreen> {
  bool _isContainerVisible = false;

  String _data = "";

  String selectedLocalidad = '';
  TextEditingController celularController = TextEditingController();
  String selectedTrabajo = '';

  final TextEditingController _textFieldController = TextEditingController();

  void _clearData() {
    setState(
      () => _data = "",
    );
  }

  void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _searchCustomer() async {
    final customerNumber = _textFieldController.text.trim();
    if (customerNumber.isEmpty) {
      _showAlertDialog('Número de cliente o DNI vacío',
          'Ingrese un número de cliente o DNI válido');
      return;
    }

    final url = Uri.parse(
        'http://192.168.1.226:8080/datasnap/rest/TSFHWebSvr/cliente/$customerNumber');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final name = jsonResponse['name'];
      final lastName = jsonResponse['lastName'];
      final address = jsonResponse['address'];

      final customerInfo =
          'Nombre: $name\nApellido: $lastName\nDomicilio: $address';
      _showAlertDialog('Cliente encontrado', customerInfo);
    } else if (response.statusCode == 404) {
      _showAlertDialog('Cliente no encontrado',
          'El cliente con el número $customerNumber no existe.');
    } else {
      _showAlertDialog('Error', 'Ha ocurrido un error al buscar el cliente.');
    }
  }

  //TODO...........................................
  void _sendData(DateTime fechaHora) async {
    //!Ingresar Web Service!!!!!!!!!
    final url =
        Uri.parse('http://192.168.1.226:8080/datasnap/rest/TSFHWebSvr/usuario');
    final headers = {'Content-Type': 'application/json'};
    final body = {
      'localidad':
          selectedLocalidad, // remplaza selectedLocalidad con la variable que contiene el valor seleccionado en tu SelectLocalidad
      'celular': celularController.text,
      'trabajo':
          selectedTrabajo, // remplaza selectedTrabajo con la variable que contiene el valor seleccionado en tu TrabajoTipoWidget
      'infoDni': _data,
      'fotos':
          [], // aquí puedes agregar las rutas de las fotos que hayas tomado en tu app
      'fecha': DateTime.now().toString() // incluye la fecha y hora actual
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      // El web service respondió correctamente
      print('Información enviada correctamente');
    } else {
      // El web service respondió con un error
      print('Error al enviar la información');
    }
  }
//TODO.................................

  Future<void> _scan() async {
    try {
      String scannedData = await FlutterBarcodeScanner.scanBarcode(
          "#000000", "Cancel", true, ScanMode.BARCODE);
      if (scannedData != "-1") {
        // Se verifica si no se ha cancelado la operación
        List<String> dataValues = scannedData.split("@");
        String formattedData =
            "Tramite: ${dataValues[0]}, Apellido: ${dataValues[1]}, Nombre: ${dataValues[2]} Sexo: ${dataValues[3]}-DNI: ${dataValues[4]}, Clase: ${dataValues[5]}, Fecha de vencimiento: ${dataValues[6]} - ${dataValues[7]}, Numero: ${dataValues[8]}";
        setState(() => _data = formattedData);
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // El usuario ha rechazado el permiso
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Error"),
            content:
                Text("El permiso para acceder a la cámara ha sido denegado."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        // Error desconocido
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Error"),
            content:
                Text("Ha ocurrido un error al intentar escanear el código."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _celularController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Nuevo Cliente'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: _clearData,
                icon: Icon(
                  Icons.delete_sweep,
                  size: 40,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        child: Center(
                          child: Text(
                            'Informacion Nuevo Cliente',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SearchClient(),
                      ),

                      SizedBox(height: 10),
                      //*Select con localidad:
                      SelectLocalidad(onLocalidadSelected: (String localidad) {
                        selectedLocalidad = localidad;
                      }),
                      SizedBox(height: 5),
                      //*Numero celular:
                      InputCelWidget(celularController: _celularController),
                      SizedBox(height: 5),
                      //*Tipo de Trabajo:
                      TrabajoTipoWidget(
                        onTrabajoSelected: (String selectedTrabajo) {
                          // Aquí puedes hacer lo que necesites con el valor seleccionado
                        },
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              '#1 Scanear DNI',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      //*Información Scaneada:
                      Visibility(
                          visible: _isContainerVisible,
                          child: InfoDniWidget(data: _data)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              '#2 Foto de Cliente, Recibo de sueldo, Boleta de Srevicio y DNI',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      //*Fotos sacadas:
                      ImageCam(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  width: double.infinity,
                  height: 200,
                ),
                SizedBox(height: 30),
                //Botón ENVIAR con un ALERT:
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title:
                                Text('¿Está seguro de enviar la información?'),
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
                                  // Obtener la fecha y hora actual
                                  DateTime now = DateTime.now();

                                  // Agregar la fecha y hora actual a la información enviada
                                  _sendData(now);

                                  Navigator.of(context).pop();
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
                  ),
                ),
                SizedBox(height: 0),
              ],
            ),
          ],
        ),
      ),
      //*Barra inferior con botón de Scanner
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade700,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
            elevation: 5,
            hoverElevation: 5.0,
            highlightElevation: 12.0,
            backgroundColor: Colors.orange.shade700,
            onPressed: () {
              // Ejecutar alguna acción que debe hacer visible el Container
              setState(() {
                _isContainerVisible = true;
              });
              _scan();
            },
            child: Icon(
              Icons.qr_code,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  TextField SearchClient() {
    return TextField(
      controller: _textFieldController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Número de cliente o DNI',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                _searchCustomer;
              },
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.green,
              ))),
    );
  }
}
