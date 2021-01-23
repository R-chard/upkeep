import 'package:firebase_database/firebase_database.dart';

import '../schemas/users.dart';

class Auth{
  signUp(Users user){
    DatabaseReference ref = FirebaseDatabase.instance.reference().child("Users").push();
    ref.set({"username":user.username,"email":user.email,"password":user.password});
  }

  Future<bool> logIn(String email, String password) async{
    DataSnapshot snapshot = await FirebaseDatabase.instance.reference().child("Users").once();
    var mem = snapshot.value;
    for (var key in snapshot.value.keys){
      if (mem[key]["email"] == email && mem[key]["password"] == password){
        return true;
      }
    }
    return false;
  }
}