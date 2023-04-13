import 'package:flutter/material.dart';
import 'package:sfh_flutter/screens/ventas_screen.dart';

import 'screens/screen.dart';
import 'themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'San Francisco Hogar',
      initialRoute: '/home',
      routes: {
        //'/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        "new_client": (context) => NewClienScreen(),
        "config_item": (context) => ConfigScreen(),
        "ventas_item": (context) => VentasScreen(),
        "map_item": (context) => MapScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
