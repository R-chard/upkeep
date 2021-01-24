import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

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
        body: Center(
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
                  "Created by",
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
        Text(
          "This project is currently ${percentageFunded.toString()}% funded",
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Slider(
          activeColor: Color(0xff407E3F),
          inactiveColor: Colors.grey,
          value: widget.listing.currentFund.toDouble(),
          max: widget.listing.fundRequired.toDouble(),
        ),
        SizedBox(height: 14),
        Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
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
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    minHeight: 120.0),
                alignment: Alignment.center,
                child: Text(
                  'Donate',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 14),
      ],
    )));
  }
}
