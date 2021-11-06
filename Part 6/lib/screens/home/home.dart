import 'package:flutter/material.dart';
import 'package:firebase/constants/constants.dart';
import 'package:firebase/services/auth_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        title: const Text('Lumei Digital'),
        backgroundColor: primary,
        elevation: 0.0,
        actions: <Widget>[
            TextButton.icon(              
              icon: Icon(Icons.person),
              style: TextButton.styleFrom(
                primary: secondary,
              ),
              label: Text('Sign out'),
              onPressed: ()async {
                await _authService.signOut();
              },
            )
          ], 
      ),
       
    );
  }
}