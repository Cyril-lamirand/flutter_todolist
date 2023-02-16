// Default
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// Screens
import 'views/welcome.dart';
import 'views/register.dart';
import 'views/login.dart';
import 'views/home.dart';
import 'views/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A5 Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        'welcome_screen': (context) => Welcome(),
        'registration_screen': (context) => Register(),
        'login_screen': (context) => Login(),
        'profile_screen': (context) => Profile(),
        'home_screen': (context) => Home()
      },
      initialRoute: 'welcome_screen',
    );
  }
}