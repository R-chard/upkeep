import 'package:flutter/material.dart';
import 'package:upkeep/schemas/users.dart';

import '../util/data.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Users user;

  Future<void> _refreshLastEntries() async {
    return Data.getUserProfile().then((data) {
      setState(() {
        user = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Data.getUserProfile(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) =>
                      _renderProfile(context, index, snapshot));
            }));
  }

  Widget _renderProfile(
      BuildContext context, int index, AsyncSnapshot snapshot) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 120),
        Center(
          child: Container(
            height: size.height * 0.2,
            width: 140,
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xff2BAFD6),
                    child: Container(
                        child: Image.network(snapshot.data.imageUrl),
                        height: 100,
                        width: 100),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: size.height * 0.1,
                    width: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xff72EFB3),
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      child: Icon(
                        Icons.edit,
                        color: Color(0xff2BAFD6),
                        size: 25,
                      ),
                      onTap: () {
                        // getImage();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            snapshot.data.username,
            style: TextStyle(
                fontSize: 25,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Color(0xff2BAFD6)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 30,
            child: Material(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              elevation: 2.0,
              child: MaterialButton(
                // onPressed: (){
                //
                // },
                minWidth: 2.0,
                height: 5.0,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 250,
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.email),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        snapshot.data.email,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 250,
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.security),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '*' * snapshot.data.password.length,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 250,
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Birmingham, UK',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
