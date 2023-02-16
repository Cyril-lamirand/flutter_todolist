// Default
import 'package:flutter/material.dart';
// Dependencies
import 'package:firebase_auth/firebase_auth.dart';
// Widget(s)
import '../widgets/app_bar_w.dart';
// Fragment(s)
import '../fragments/box_decoration_f.dart';

var loggedinUser;
var appContainerDecoration = boxDecorationContainer;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void signOut() async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, "welcome_screen");
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: appContainerDecoration,
      child: Scaffold(
          appBar: const AppBarWidget(title: "Profil" , hideActionProfile: true, actionReturnButton: true),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent.shade200,
                        minRadius: 35.0,
                        child: const Icon(
                          Icons.call,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent.shade100,
                        minRadius: 60.0,
                        child: const CircleAvatar(
                          radius: 55.0,
                          backgroundImage:
                          NetworkImage('https://avatars.githubusercontent.com/u/59066441?v=4'),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent.shade200,
                        minRadius: 35.0,
                        child: const Icon(
                          Icons.message,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    loggedinUser.email,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Développeur',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Date d'enregistrement"),
                        Text("Test")
                      ],
                    ),

                    Text(
                      "Date d'enregistrement",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(loggedinUser.isAnonymous.toString())
                  ]
              ),
              Text(loggedinUser.toString(), style: const TextStyle(fontSize: 12)),
              FloatingActionButton(
                onPressed: () => {
                  signOut()
                },
                child: Icon(Icons.logout),
                backgroundColor: Colors.red,
              )
            ],
          )
      ),
    );
  }
}