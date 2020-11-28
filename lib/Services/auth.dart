import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settle_group_expenses/ModalClasses/modal_user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  SgeUser _userFromFirebaseUser(User user){
     return user != null ? SgeUser(user.uid) : null;
  }

  // auth change user stream
  Stream<SgeUser> get user{
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }
  //sign in with email and password

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      Fluttertoast.showToast(msg: e);
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      Fluttertoast.showToast(msg: e);
    }
  }

}