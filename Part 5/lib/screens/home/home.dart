import 'package:flutter/material.dart';


class Home extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
          title: Text('Lumei Digital'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0           
        ),
    );
  }
}