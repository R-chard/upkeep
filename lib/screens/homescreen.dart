import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
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
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/cafe.png"),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Coffee Cup Cafe',
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
                        'Essex, UK',
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
                      'Coffee Cup cafe is a small neighbourhood cafe in London, UK that has been around since their founders Mark and Peter first ventured into the F&B business in 2005. Today, Coffee Cup cafe expanded to 3 branches in London with over 30 staff members. However, as they celebrate their 15th anniversary, Coffee Cup cafe is at more risk than ever before of shutting down permanently due to the lack of business during the COVID-19 pandemic. Message from the owners: Mark and I are extremely fortunate to by so well supported by the community during this pandemic. We would like to offer our thanks by offering donors who have pledged at least 20£ with a 5£ food voucher applicable for use at the cafe after we return to normal times.',
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
                        'last donation: 4m ago\n£ 8,350 of £20,000',
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
                        value: 20,
                        max: 60,
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
                            Text('5.0k')
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
                            Text('10')
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
                            Text('2.7k')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
