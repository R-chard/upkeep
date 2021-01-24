import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../schemas/listing.dart';
import '../util/data.dart';
import 'bottomnavigation.dart';

class NewListing extends StatefulWidget {
  @override
  NewListingState createState() => NewListingState();
}

class NewListingState extends State<NewListing> {
  String imageUrl;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController fundRequiredController = TextEditingController();

  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          title: Center(
            child: Text(
              'My Fundraisers',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                (imageUrl != null)
                    ? Container(
                        child: Image.network(imageUrl),
                        constraints:
                            BoxConstraints.tightFor(width: 200, height: 200))
                    : Placeholder(
                        fallbackHeight: 200.0, fallbackWidth: double.infinity),
                RaisedButton(
                    child: Text("Upload Image"),
                    onPressed: () => uploadImage()),
                SizedBox(
                  height: 20,
                ),
                new TextFormField(
                  controller: titleController,
                  decoration: new InputDecoration(
                    labelText: "Enter a title",
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Title cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                new TextFormField(
                  controller: descriptionController,
                  decoration: new InputDecoration(
                    labelText: "Enter a description about your business!",
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Description cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                new TextFormField(
                  controller: messageController,
                  decoration: new InputDecoration(
                    labelText: "Enter a message to your supporters!",
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Message cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                new TextFormField(
                  controller: locationController,
                  decoration: new InputDecoration(
                    labelText: "City/Country",
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "City cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                new TextFormField(
                  controller: fundRequiredController,
                  decoration: new InputDecoration(
                    labelText: "Enter an amount you require",
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "fund required cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      SharedPreferences.getInstance().then((pref) {
                        String owner = pref.getString("username");
                        Listing listing = Listing(
                            titleController.text,
                            descriptionController.text,
                            messageController.text,
                            locationController.text,
                            int.parse(fundRequiredController.text),
                            owner,
                            imageUrl);
                        Data.addListing(listing);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigation()));
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff2BAFD6), Color(0xff72EFB3)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 60.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Create Fundraiser',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  uploadImage() async {
    await Firebase.initializeApp();
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    // check permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      // Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      var folderName = "-MRkRmiKjyksyyqKY4Am";
      // Todo: Change to proper values once user auth is set up
      var imageName = file.path.substring(50);

      if (image != null) {
        var snapshot = await _storage
            .ref()
            .child(folderName + "/" + imageName)
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        // This is what happens if user does not pick an image
        print("No path received");
      }
    } else {
      // This is what happens if user does not allow the app to access gallery
      print("Grant Permissions and try again");
    }
  }
}
