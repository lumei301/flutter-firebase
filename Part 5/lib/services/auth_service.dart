import 'package:firebase/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance; 
  // auth change user stream
  Stream<UserModel?> get onAuthStateChanged{
    return _auth.authStateChanges()
    //.map((User? user) => _userModelFromFirebase(user));
    .map(_userModelFromFirebase);
  }
 
  //create an userModel object based on Firebase User object
  UserModel? _userModelFromFirebase(User? user){     
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    } 
  }

    //sign in anonymously, it's an asynchronous task, it's going to return a future
  Future signInAnonymously() async{
    try{
       
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userModelFromFirebase(user);     
    }catch(e){      
      return null;
    }
  }
 
}