import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String _docNumber = '';
  bool _isLoading = false;
  String _customerNumber = '';
  String _firstName = '';
  String _lastName = '';
  String _address = '';
  String _phoneNumber = '';
  String _lastUpdated = '';
  String _score = '';

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'http://192.168.1.233:8080/datasnap/rest/TSFHWebSvr/cliente/$_docNumber'));

    setState(() {
      _isLoading = false;
      final data = json.decode(response.body);
      //_customerNumber = data['customerNumber'];
      _firstName = data['NOMBRE'];
      _lastName = data['APELLIDO'];
      _address = data['DOMICILIO1'];
      //_phoneNumber = data['phoneNumber'];
      //_lastUpdated = data['lastUpdated'];
      //_score = data['score'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(fontSize: 22, color: Colors.white);

    return Column(
      children: [
        SizedBox(height: 25),
        TextField(
          onChanged: (value) {
            _docNumber = value;
          },
          decoration: InputDecoration(
            labelText: 'Ingrese número de documento',
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            _fetchData();
          },
          child: Text(
            'Enviar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              textStyle:
                  MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 18)),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
        ),
        SizedBox(height: 20.0),
        _isLoading
            ? CircularProgressIndicator()
            : _lastUpdated.isNotEmpty &&
                    DateTime.now()
                            .difference(DateTime.parse(_lastUpdated))
                            .inDays >
                        180
                ? Text('Actualizar información')
                : Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Número de cliente: $_customerNumber',
                              style: _textStyle),
                          Text('Nombre: $_firstName $_lastName',
                              style: _textStyle),
                          Text('Domicilio: $_address', style: _textStyle),
                          Text('Número de teléfono: $_phoneNumber',
                              style: _textStyle),
                          Text('Última actualización: $_lastUpdated',
                              style: _textStyle),
                          Text('Score: $_score', style: _textStyle),
                        ],
                      ),
                    ),
                  ),
      ],
    );
  }
}
