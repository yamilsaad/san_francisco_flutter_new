import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfh_flutter/screens/ventas_screen.dart';
import 'package:sfh_flutter/share_preferences/preferences.dart';

import 'providers/themes_provider.dart';
import 'screens/screen.dart';
import 'services/auth_service.dart';
//import 'roles/user_roles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: const MyApp(),
  ));
}

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
        theme: Provider.of<ThemeProvider>(context).currentTheme,
      ),
    );
  }
}
