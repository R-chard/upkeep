import "package:flutter/material.dart";

class Notifications extends StatefulWidget {
  @override
  createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Icon(Icons.notifications_none_outlined, size: 190),
          SizedBox(height: 30),
          Text("You have no new notifications for now")
        ]));
  }
}
