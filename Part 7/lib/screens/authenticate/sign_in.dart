import 'package:flutter/material.dart';
import 'package:firebase/services/auth_service.dart';
import 'package:firebase/constants/constants.dart';
class SignIn extends StatefulWidget {
  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0.0,
        title: Text('Sign in to Lumei Digital'),        
      ),
      body:Container(
         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
         child:Form(
           child: Column(
             children: <Widget>[
               SizedBox(height: 20.0),
               TextFormField(               
                validator: (value) => value!.isEmpty? 'Enter an email': null,
                onChanged: (value){
                  setState(() => email = value);
                },
              ),
               SizedBox(height: 20.0),
               TextFormField(               
                validator: (value) => value!.length < 6 ? 'Enter a password 6+ charts long': null,
                obscureText: true,
                onChanged: (value){
                  setState(() => password = value);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                 if(_formKey.currentState!.validate()){                    
                    dynamic result = await _authService.signIn(email, password);
                    if(result == null){                      
                      setState(()  {
                        error = 'Could not sign in with the credentials';                        
                      });
                    }
                  }
                }),
             ],
           ))
         
      )
    );
  }
}