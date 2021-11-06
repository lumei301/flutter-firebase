import 'package:flutter/material.dart';
import 'package:firebase/services/auth_service.dart';
import 'package:firebase/constants/constants.dart';

class SignUp extends StatefulWidget {
   
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0.0,
        title: Text('Sign up to Lumei Digital'),
          
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
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
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    setState(()=> loading = true);
                    dynamic result = await _authService.signUp(email, password);
                    if(result == null){                    
                      setState(()  {
                        error = 'Please provide n valid email';
                        loading = false;
                      });
                    }
                  }
                }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style:  TextStyle(color: Colors.red, fontSize: 14.0),
                )
            ],
          ),
        ),
      ),
    );
  }
}