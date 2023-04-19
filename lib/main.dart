import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfh_flutter/screens/ventas_screen.dart';

import 'screens/screen.dart';
import 'services/auth_service.dart';
import 'themes/theme.dart';
import 'roles/user_roles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'San Francisco Hogar',
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          'home': (context) => HomePage(),
          "new_client": (context) => NewClienScreen(),
          "config_item": (context) => ConfigScreen(),
          "ventas_item": (context) => VentasScreen(),
          "map_item": (context) => MapScreen(),
          "search_item": (context) => SearchScreen(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
