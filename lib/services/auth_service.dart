import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier {
  final _baseUrl =
      Uri.parse('http://192.168.1.227:8080/datasnap/rest/TSFHWebSvr/usuario');
  //final String _webserviceToken = '';

  Future<bool> authenticate(String email, String password) async {
    print('$_baseUrl/$email/$password');

    try {
      final response = await http.get(Uri.parse('$_baseUrl/$email/$password'),
          headers: {'Content-Type': 'application/json', 'Accept': '*/*'});

      if (response.statusCode == 200) {
        // Autenticación exitosa
        return true;
      } else {
        // Autenticación fallida
        return false;
      }
    } catch (error, stackTrace) {
      // Error al hacer la solicitud
      print('Error en AuthService.authenticate: $error, $stackTrace');
      return false;
    }
  }
}



/*
  Future<bool> authenticate(String email, String password) async {

    
  final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };
    
    final url = Uri.parse('$_baseUrl/$email/$password');

    final resp = await http.get(url);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp['success'] == true) {
      // Autenticación exitosa
      return true;
    } else {
      // Autenticación fallida
      return false;
    }*/