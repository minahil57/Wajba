import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajba_new/main_splash_drawer/splash_screen.dart';
import 'package:wajba_new/user_authentication/sign_in.dart';
import 'package:mysql1/mysql1.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Splash Screen",
      home:  const MyHomePage(),
  theme: ThemeData(
        colorScheme: defaultColorScheme,
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        // textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
      ),
    );
  }

}

class AuthenticationWrapper extends StatelessWidget{

   AuthenticationWrapper({
    Key? key,
  }) : super(key: key);
  var settings =  ConnectionSettings(
      host: '192.168.21.82',
      port: 3306,
      user: 'minahilakhtar',
      password: 'Minahil@123',
      db: 'Wajba'
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return login_page();
  }

}

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color(0xfff08100),
  secondary: Color(0xffffffff),
  surface: Color(0xff030000),
  background: Color(0xffffffff),
  error: Color(0xffe70a0a),
  onPrimary: Color(0xfff7ece6),
  onSecondary: Color(0xfff3a87c),
  onSurface: Color(0xffffffff),
  onError: Color(0xffe70a0a),
  onBackground: Color(0xa1f3a87c),

  brightness: Brightness.light,
);
