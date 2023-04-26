import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        _menuItem(context, 'Nuevo Cliente', Icons.add, Colors.grey, '/opcion1',
            size: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        _menuItem2(
            context, 'Configuración', Icons.settings, Colors.grey, '/opcion2',
            size: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        _menuItem3(context, 'Ventas', Icons.stacked_line_chart, Colors.grey,
            '/opcion3',
            size: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        _menuItem4(context, 'Map', Icons.location_on, Colors.grey, '/opcion4',
            size: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        _menuItem5(context, 'Buscar', Icons.search, Colors.grey, '/opcion5',
            size: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        SizedBox(height: 50),
      ],
    );
  }
}

Widget _menuItem(BuildContext context, String title, IconData icon, Color color,
    String route,
    {double size = 100, EdgeInsets padding = EdgeInsets.zero}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('new_client');
    },
    child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    ),
  );
}

Widget _menuItem2(BuildContext context, String title, IconData icon,
    Color color, String route,
    {double size = 100, EdgeInsets padding = EdgeInsets.zero}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('config_item');
    },
    child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange.shade700,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    ),
  );
}

Widget _menuItem3(BuildContext context, String title, IconData icon,
    Color color, String route,
    {double size = 100, EdgeInsets padding = EdgeInsets.zero}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('ventas_item');
    },
    child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    ),
  );
}

Widget _menuItem4(BuildContext context, String title, IconData icon,
    Color color, String route,
    {double size = 100, EdgeInsets padding = EdgeInsets.zero}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('map_item');
    },
    child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red.shade500,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    ),
  );
}

Widget _menuItem5(BuildContext context, String title, IconData icon,
    Color color, String route,
    {double size = 100, EdgeInsets padding = EdgeInsets.zero}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('search_item');
    },
    child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.indigo.shade700,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    ),
  );
}
