import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
          child: Container(
        child: Text('Map'),
      )),
    );
  }
}
