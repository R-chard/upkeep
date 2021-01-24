import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../screens/homescreen.dart';

class ProjectScreen extends StatefulWidget {
  var listing;
  ProjectScreen({this.listing});
  @override
  ProjectScreenState createState() {
    return ProjectScreenState();
  }
}

class ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    int percentageFunded =
        (widget.listing.currentFund / widget.listing.fundRequired * 100)
            .round();

    return new Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff2BAFD6), Color(0xff72EFB3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.only(left: 20, top: 30),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PROJECTS',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Image.network(widget.listing.imageUrl),
              SizedBox(height: 15),
              Text(
                widget.listing.title,
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 14),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.listing.profilePic),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(children: <Widget>[
                      Text(
                        "Fundraiser by",
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Text(
                        widget.listing.owner,
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.location_pin,
                            ),
                            Text(
                              widget.listing.location,
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                          ]),
                    ])
                  ]),
              SizedBox(height: 14),
              Text(widget.listing.description,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  )),
              SizedBox(height: 14),
              const Divider(
                color: Colors.green,
                height: 20,
                thickness: 5,
              ),
              SizedBox(height: 14),
              Text("A message from the owner:",
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  )),
              SizedBox(height: 14),
              Text(
                '"' + widget.listing.message + '"',
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 14),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "This Project is currently "),
                    TextSpan(
                      text: percentageFunded.toString() + "% ",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    TextSpan(text: 'funded'),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  valueIndicatorColor:
                      Colors.blue, // This is what you are asking for
                  inactiveTrackColor: Colors.grey, // Custom Gray Color
                  activeTrackColor: Colors.green,
                  thumbColor: Colors.black, // Custom Thumb overlay Color
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                ),
                child: Slider(
                  value: 180.toDouble(),
                  onChanged: (double newValue) {},
                  divisions: 220,
                  label: "40",
                  min: 90.0,
                  max: 305.0,
                ),
              ),
              SizedBox(height: 14),
              Container(
                width: 150,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
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
                        child: Text(
                          'Donate',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
