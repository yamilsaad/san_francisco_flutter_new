import 'package:flutter/material.dart';

import '../models/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(children: [
            Text(
              'San Francisco Hogar',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              Icons.monetization_on_outlined,
              size: 50,
            )
          ]),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Container(
            width: 400,
            height: 500,
            margin: EdgeInsets.symmetric(horizontal: 10),
            //Acá va el menu option creado!
            child: MenuOption(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
