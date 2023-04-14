import 'package:flutter/material.dart';

class InfoDniWidget extends StatelessWidget {
  final String data;

  InfoDniWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 250,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade700,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Text(data, style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
        ),
      ),
    );
  }
}
