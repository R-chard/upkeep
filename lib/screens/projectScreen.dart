import "package:flutter/material.dart";

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
    return new Container(
        child: Column(
      children: <Widget>[
        new Text(widget.listing.owner.toString()),
        Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () {},
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
                    maxWidth: MediaQuery.of(context).size.width / 2,
                    minHeight: 60.0),
                alignment: Alignment.center,
                child: Text(
                  'Donate',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
