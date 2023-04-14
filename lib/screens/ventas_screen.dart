import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class VentasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas'),
        toolbarHeight: 80,
      ),
      body: Center(
          child: Container(
        child: GraficoWidget(),
      )),
    );
  }
}
