import 'package:flutter/material.dart';
import 'package:firebase/constants/constants.dart';

class Home extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
          title: const Text('Lumei Digital'),
          backgroundColor: primaryColor,
          elevation: 0.0,
           
        ),
    );
  }
}