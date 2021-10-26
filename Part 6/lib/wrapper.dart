import 'package:firebase/models/userModel.dart';
import 'package:firebase/screens/authenticate/authenticate.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {

    final userModel = Provider.of<UserModel>(context);

    // return either home or authentiacate widge
    if (userModel == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}