import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCam extends StatefulWidget {
  const ImageCam({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCam> createState() => _ImageCamState();
}

class _ImageCamState extends State<ImageCam> {
  List<File?> _images = [null, null, null, null, null];

  final picker = ImagePicker();

  Future getImage(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _images[index] = File(pickedFile.path);
      } else {
        print('No se seleccionó ninguna imagen.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 230,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => getImage(0),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 250,
                  height: 180,
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
                  child: _images[0] == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/camara.png'),
                            image: AssetImage('assets/camara.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _images[0]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              GestureDetector(
                onTap: () => getImage(1),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 250,
                  height: 180,
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
                  child: _images[1] == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/camara.png'),
                            image: AssetImage('assets/camara.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _images[1]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              GestureDetector(
                onTap: () => getImage(2),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 250,
                  height: 180,
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
                  child: _images[2] == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/camara.png'),
                            image: AssetImage('assets/camara.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _images[2]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              GestureDetector(
                onTap: () => getImage(3),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 250,
                  height: 180,
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
                  child: _images[3] == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/camara.png'),
                            image: AssetImage('assets/camara.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _images[3]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              GestureDetector(
                onTap: () => getImage(4),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 250,
                  height: 180,
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
                  child: _images[4] == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/camara.png'),
                            image: AssetImage('assets/camara.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _images[4]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
