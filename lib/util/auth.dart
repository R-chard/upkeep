import 'package:firebase_database/firebase_database.dart';
import "package:shared_preferences/shared_preferences.dart";

import '../schemas/users.dart';

class Auth {
  Future<bool> signUp(Users user) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child("Users").push();
    ref.set({
      "username": user.username,
      "email": user.email,
      "password": user.password
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", user.username);
    return true;
  }

  Future<bool> logIn(String email, String password) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.reference().child("Users").once();
    var mem = snapshot.value;
    for (var key in snapshot.value.keys) {
      if (mem[key]["email"] == email && mem[key]["password"] == password) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("username", mem[key]["username"]);
        return true;
      }
    }
    return false;
  }
}
