import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoWidget extends StatefulWidget {
  const GraficoWidget({Key? key});

  @override
  State<GraficoWidget> createState() => _GraficoWidgetState();
}

class _GraficoWidgetState extends State<GraficoWidget> {
  List<_SalesData> data = [];

  Future<void> _fetchDataBySucursal(String sucursal) async {
    // Realiza una solicitud GET al web service para obtener las ventas por sucursal
    var response = await http.get(Uri.parse(
        'http://192.168.1.230:8080/datasnap/rest/TSFHWebSvr/ventas=$sucursal'));
    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, parsea los datos y actualiza la lista data
      var jsonData = jsonDecode(response.body);
      List<_SalesData> newData = [];
      for (var item in jsonData) {
        newData.add(_SalesData(item['mes'], item['ventas']));
      }
      setState(() {
        data = newData;
      });
    } else {
      // Si la respuesta no es exitosa, muestra un mensaje de error
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('No se pudo obtener los datos de ventas por sucursal.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CircularSeries<_SalesData, String>>[
          PieSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Pocito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Capital',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Rawson',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Albardon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Caucete',
          ),
        ],
        onTap: (int index) {
          // Cuando se toca una de las sucursales en el bottomNavigationBar, llama a _fetchDataBySucursal con el nombre de la sucursal correspondiente
          String sucursal =
              ['Pocito', 'Capital', 'Rawson', 'Albardon', 'Caucete'][index];
          _fetchDataBySucursal(sucursal);
        },
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
