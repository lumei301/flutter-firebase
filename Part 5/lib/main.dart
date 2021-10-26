import 'package:firebase/models/userModel.dart';
import 'package:firebase/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase/services/authService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      initialData: null,
      value: AuthService().onAuthStateChanged,
      builder: (context, snapshot) {
        return MaterialApp(
         home: Wrapper(),
        );
      }
    );
  }
}
 