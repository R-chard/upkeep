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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff2BAFD6), Color(0xff72EFB3)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.only(left: 20, top: 30),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
    int percentage = (snapshot.data[index].currentFund /
            snapshot.data[index].fundRequired *
            100)
        .round();
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
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorColor:
                        Colors.blue, // This is what you are asking for
                    inactiveTrackColor: Color(0xff72EFB3), // Custom Gray Color
                    activeTrackColor: Color(0xff2BAFD6),
                    thumbColor: Colors.black, // Custom Thumb overlay Color
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    value: percentage.toDouble(),
                    onChanged: (double newValue) {},
                    divisions: 220,
                    label: percentage.toString(),
                    min: 0.0,
                    max: 100.0,
                  ),
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
