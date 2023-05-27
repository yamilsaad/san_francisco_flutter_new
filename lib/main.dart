import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfh_flutter/screens/ventas_screen.dart';
import 'package:sfh_flutter/share_preferences/preferences.dart';

import 'providers/themes_provider.dart';
import 'screens/screen.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
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
          "map_item": (context) => MapScreen(
                key: ValueKey('map_screen'),
                title: 'map',
              ),
          "search_item": (context) => SearchScreen(),
        },
        theme: Provider.of<ThemeProvider>(context).currentTheme,
      ),
    );
  }
}
