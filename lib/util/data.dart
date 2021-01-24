import "package:firebase_database/firebase_database.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upkeep/schemas/listing.dart';

import '../schemas/users.dart';

class Data {
  static Future<List<Listing>> getListings() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.reference().child("Listing").once();
    List<Listing> data = [];
    for (var key in snapshot.value.keys) {
      Listing listing = Listing(
          snapshot.value[key]["title"],
          snapshot.value[key]["description"],
          snapshot.value[key]["message"],
          snapshot.value[key]["location"],
          snapshot.value[key]["fundRequired"],
          snapshot.value[key]["imageUrl"],
          snapshot.value[key]["owner"],
          snapshot.value[key]["currentFund"],
          snapshot.value[key]["profilePic"],
          snapshot.value[key]["likes"],
          snapshot.value[key]["comments"],
          snapshot.value[key]["shares"]);
      data.add(listing);
    }
    ;

    return data;
  }

  static addListing(Listing listing) {
    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child("Listing").push();

    ref.set({
      "title": listing.title,
      "description": listing.description,
      "message": listing.message,
      "fundRequired": listing.fundRequired,
      "imageUrl": listing.imageUrl,
      "location": listing.location,
      "currentFund": listing.currentFund,
      "likes": listing.likes,
      "owner": listing.owner,
      "profilePic": listing.profilePic,
      "comments": listing.comments,
      "shares": listing.shares,
    });
  }

  static Future<Users> getUserProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String username = "bill";
    Users user;
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.reference().child("Users").once();
    for (var key in snapshot.value.keys) {
      if (snapshot.value[key]["username"] == username) {
        user = Users(
            snapshot.value[key]["username"],
            snapshot.value[key]["email"],
            snapshot.value[key]["password"],
            snapshot.value[key]["imageUrl"]);

        return user;
      }
    }
  }
}
