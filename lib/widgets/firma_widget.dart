import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'dart:typed_data';

class FirmaWidget extends StatefulWidget {
  const FirmaWidget({Key? key}) : super(key: key);

  @override
  _FirmaWidgetState createState() => _FirmaWidgetState();

  Uint8List? obtenerFirmaData() {}
}

class _FirmaWidgetState extends State<FirmaWidget> {
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
  );

  Uint8List? firmaData; // Variable para almacenar los datos de la firma

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Signature(
                controller: controller,
                width: 350,
                height: 200,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                controller.toPngBytes().then((firma) {
                  setState(() {
                    firmaData =
                        firma; // Guardar los datos de la firma en la variable
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Firma guardada')),
                  );
                });
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: Icon(
                Icons.cancel_presentation,
                size: 35,
                color: Colors.red,
              ),
            ),
            Divider(
              height: 10,
            )
          ],
        )
      ],
    );
  }

  Uint8List? obtenerFirmaData() {
    return firmaData;
  }
}
