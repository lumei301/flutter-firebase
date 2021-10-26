import 'package:firebase/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance; 
 
  // auth change user stream  
  Stream<UserModel> get onAuthStateChanged => _auth.authStateChanges().map(_userModelFromFirebase);
  
  //create an userModel object based on Firebase User object
  UserModel _userModelFromFirebase(User user){
    return user != null? UserModel(uid: user.uid): null; 
  }

   //sing out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in anonymously, it's an asynchronous task, it's going to return a future
  Future signInAnonymously() async{
    try{       
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;  
      return _userModelFromFirebase(user);  
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sing in with email & password
  Future signIn(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  
}