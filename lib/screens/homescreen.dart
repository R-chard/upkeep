import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upkeep/screens/projectScreen.dart';

import '../util/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 30),
          alignment: Alignment.topLeft,
          child: Text(
            'Popular Now',
            style: GoogleFonts.comfortaa(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future: Data.getListings(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // What is displayed until data is loaded
              if (!snapshot.hasData) {
                return Container(child: Center(child: Text("Loading...")));
              } else {
                return Expanded(
                    child: SizedBox(
                        height: 200.0,
                        child: new ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) =>
                                _renderListBody(context, index, snapshot))));
              }
            }),
      ])),
    );
  }

  Widget _renderListBody(
      BuildContext context, int index, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.all(13),
      child: Card(
          child: GestureDetector(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProjectScreen(listing: snapshot.data[index])))
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(snapshot.data[index].imageUrl),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  snapshot.data[index].title,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  snapshot.data[index].location,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                snapshot.data[index].description,
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'last donation: 4m ago\n£${snapshot.data[index].currentFund} of £${snapshot.data[index].fundRequired}',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Color(0xff324982),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                width: 800,
                child: Slider(
                  activeColor: Color(0xff407E3F),
                  inactiveColor: Colors.grey,
                  value: snapshot.data[index].currentFund.toDouble(),
                  max: snapshot.data[index].fundRequired.toDouble(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(snapshot.data[index].likes.toString())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.comment,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(snapshot.data[index].comments.toString())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.share_outlined,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(snapshot.data[index].shares.toString())
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ) //
          ),
    );
  }
}
