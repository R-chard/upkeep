import "package:flutter/material.dart";

class ProjectScreen extends StatefulWidget {
  var listing;
  ProjectScreen({
    this.listing
  });
  @override
  ProjectScreenState createState() {
    return ProjectScreenState();
  }
}

class ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Text(widget.listing.toString());
    )
  }
}
