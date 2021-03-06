import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settle_group_expenses/ModalClasses/modal_user.dart';
import 'package:settle_group_expenses/Services/database.dart';

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    }
    on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.code);
    }
    catch(e){
      print(e);
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String name, String email, String password, String phone) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      
      await DatabaseService(user.uid).updateUserData(name, email, password, phone);
      
      return _userFromFirebaseUser(user);
    }
    on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.code);
    }
    catch(e){
      print(e);
      return null;
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
      return null;
    }
  }

}