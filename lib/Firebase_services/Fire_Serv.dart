
import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireServe {
  final FirebaseAuth user= FirebaseAuth.instance;
  static String signedInUserIEmail;
  static String uid;
//sign in anonymous
//  Future signInAnon() async{
//    try{
//      AuthResult result=await user.signInAnonymously();
//      print('user Id is ${result.user.uid}');
//      signedInUserIEmail=result.user.uid;
//      return result.user;
//    }catch(ex){
//      print('Errore signing in $ex');
//    }
//  }
  //sign out
Future signOutUser()async{
    user.signOut();
}

//signing with a phone number
  Future signInWithEmailAndPassword(String email,String password)async{
    try{
      AuthResult result=await user.signInWithEmailAndPassword(email: email, password: password);
      FireServe.signedInUserIEmail=email;
      FireServe.uid=result.user.uid;
      print('siogned in user email is ${FireServe.signedInUserIEmail} and email is $email');
      return result.user;
    }catch(ex){
      print('errore happens $ex');
    }
  }
  Future addUserWithEmailAndPassword(String email,String password)async{
    try{
      AuthResult result=await user.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    }catch(ex){
      print('errore happens ${ex.hashCode} $ex');
      return null;
    }
  }

Stream<FirebaseUser> get userStatus {
    return  user.onAuthStateChanged;
}
}