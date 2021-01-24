import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/auth.dart';
import '../bottomnavigation.dart';

class LogIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Log in',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          color: Color(0xff324982),
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new TextFormField(
                    controller: emailController,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      labelText: "Enter your Email",
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
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new TextFormField(
                    controller: passwordController,
                    decoration: new InputDecoration(
                      labelText: "Enter your Password",
                      fillColor: Colors.white,
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Password cannot be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        Auth auth = Auth();
                        auth
                            .logIn(
                                emailController.text, passwordController.text)
                            .then((hasLoggedIn) {
                          if (hasLoggedIn) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigation()));
                          } else
                            (print("Either email or password does not exist"));
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
                            'LOG IN',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
