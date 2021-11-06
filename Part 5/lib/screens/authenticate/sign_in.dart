import 'package:flutter/material.dart';
import 'package:firebase/constants/constants.dart';
import 'package:firebase/services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();   
  // text field state
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0.0,
        title: const Text('Sign in to Lumei Digital'),        
      ),
      body:Container(
         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
         child: ElevatedButton(                                
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                 dynamic result = await _authService.signInAnonymously();
                }),
      )
    );
  }
}