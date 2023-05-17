import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUsuario extends StatefulWidget {
  const ImageUsuario({super.key});

  @override
  State<ImageUsuario> createState() => _ImageUsuarioState();
}

class _ImageUsuarioState extends State<ImageUsuario> {
  List<File?> _images2 = [null];

  final picker = ImagePicker();

  Future getImage(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _images2[index] = File(pickedFile.path);
      } else {
        print('No se seleccionó ninguna imagen.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => getImage(0),
        child: Container(
          margin: EdgeInsets.all(5),
          width: 350,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: _images2[0] == null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/usuario.png'),
                    image: AssetImage('assets/usuario.png'),
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    _images2[0]!,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
