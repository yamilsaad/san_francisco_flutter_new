import 'package:flutter/material.dart';

import '../models/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 200,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Text(
              'San Francisco Hogar',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.monetization_on_outlined,
              size: 30,
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 400,
              height: 500,
              margin: EdgeInsets.symmetric(horizontal: 10),
              //Acá va el menu option creado!
              child: MenuOption(),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
