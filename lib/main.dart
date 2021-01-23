import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authenticationService.dart';
import 'package:provider/provider.dart';
import 'data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: MaterialApp(
          home: Splash(),
        )
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("hi")),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key key,
}) : super(key:key);

  @override
  Widget build(BuildContext context){
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null){
      return Text("Signed in");
    }
    return Text("Not Signed In");
  }
}
