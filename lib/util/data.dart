import "package:firebase_database/firebase_database.dart";
import '../schemas/listing.dart';

class Data{
  static Future<List<Listing>> getListing() async {
    DataSnapshot snapshot = await FirebaseDatabase.instance.reference().child("Listing").once();
    List<Listing> data = [];
    var keys = snapshot.value;
    return data;
  }

  //static Future<>
}