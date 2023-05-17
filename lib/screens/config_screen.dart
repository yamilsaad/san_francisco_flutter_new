import 'package:flutter/material.dart';
import 'package:sfh_flutter/providers/themes_provider.dart';
import 'package:provider/provider.dart';

import '../share_preferences/preferences.dart';

class ConfigScreen extends StatefulWidget {
  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  //bool isDarkmode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Configuracion'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Temas de pantalla',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkmode,
                    title: Text(
                      'Tema Oscuro',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onChanged: (value) {
                      Preferences.isDarkmode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkmode()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
              ],
            ),
          ),
        ));
  }
}
