import 'package:firebase_database/firebase_database.dart';

import '../schemas/users.dart';

class Auth{
  signUp(Users user){
    DatabaseReference ref = FirebaseDatabase.instance.reference().child("Users").push();
    ref.set({"username":user.username,"email":user.email,"password":user.password});
  }
}