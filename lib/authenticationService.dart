import 'package:firebase_auth/firebase_auth.dart';
import "./schemas/users.dart";

class AuthenticationService{
  final FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String> signIn(Users users) async{
    // email is temporary solution to use default auth method
      try{
        await firebaseAuth.signInWithEmailAndPassword(email: users.username + "@gmail.com", password: users.password);
        return "Signed In";
      } on FirebaseAuthException catch(e){
        return e.message;
      }
  }

  Future<String> SignUp(Users users) async{
      try{
        await firebaseAuth.createUserWithEmailAndPassword(email: users.username + "@gmail.com", password: users.password);
        return "Signed Up";
      } on FirebaseAuthException catch(e){
        return e.message;
      }
  }
}