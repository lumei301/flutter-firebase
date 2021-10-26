import 'package:firebase/services/authService.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _authService = AuthService();
   
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Lumei Digital'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
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