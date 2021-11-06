import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance; 
 
    //sign in anonymously, it's an asynchronous task, it's going to return a future
  Future signInAnonymously() async{
    try{
       
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      
      return user;      
    }catch(e){      
      return null;
    }
  }
 
}