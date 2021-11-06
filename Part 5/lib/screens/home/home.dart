import 'package:flutter/material.dart';
import 'package:firebase/constants/constants.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
          title: const Text('Lumei Digital'),
          backgroundColor: primary,
          elevation: 0.0           
        ),
    );
  }
}