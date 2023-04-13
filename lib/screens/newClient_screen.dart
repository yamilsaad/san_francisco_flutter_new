import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../widgets/widget.dart';

class NewClienScreen extends StatefulWidget {
  @override
  State<NewClienScreen> createState() => _NewClienScreenState();
}

class _NewClienScreenState extends State<NewClienScreen> {
  String _data = "";

  _scan() async {
    String scannedData = await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Cancel", true, ScanMode.BARCODE);

    // Separar la cadena de texto en un array usando "@" como separador
    List<String> dataValues = scannedData.split("@");

    // Construir la nueva cadena con el formato deseado
    String formattedData =
        "Tramite: ${dataValues[0]}, Apellido: ${dataValues[1]}, Nombre: ${dataValues[2]} Sexo: ${dataValues[3]}-DNI: ${dataValues[4]}, Clase: ${dataValues[5]}, Fecha de vencimiento: ${dataValues[6]} - ${dataValues[7]}, Numero: ${dataValues[8]}";

    // Actualizar el estado con la cadena formateada
    setState(() => _data = formattedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //TODO:AGREGAR UN BOTON PARA LIMPIAR PANTALLA!
          toolbarHeight: 80,
          title: Text('Nuevo Cliente'),
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
                              style:
                                  TextStyle(fontSize: 25, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        //*Select con localidad:
                        SelectLocalidad(),
                        SizedBox(height: 5),
                        //*Numero celular:
                        InputCelWidget(),
                        SizedBox(height: 5),
                        //*Tipo de Trabajo:
                        TrabajoTipoWidget(),
                        SizedBox(height: 5),
                        //*Información Scaneada:
                        InfoDniWidget(data: _data),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                'Foto de Cliente, Recibo de sueldo, Boleta de Srevicio y DNI',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.blue),
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
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.green),
                      ),
                      onPressed: () {},
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
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () => _scan(),
              child: Icon(
                Icons.qr_code,
                size: 40,
              ),
            ),
          ),
        ));
  }
}


/*
class ScanerInfo extends StatefulWidget {
  @override
  State<ScanerInfo> createState() => _ScanerInfoState();
}

class _ScanerInfoState extends State<ScanerInfo> {
  String _data = "";

  _scan() async {
    return await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Cancel", true, ScanMode.BARCODE).then((value) => setState(()=>_data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:FloatingActionButton(
          onPressed: () => _scan(),
        ),
    );
  }
}
*/