// Default
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
// Dependencies
import 'package:firebase_auth/firebase_auth.dart';
// Screen(s)
import 'package:a5_todolist/views/welcome.dart';
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
    Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const Welcome()
        )
    );
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
    return Scaffold(
      appBar: const AppBarWidget(title: "Profil" , hideActionProfile: true, actionReturnButton: true),
      body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                color: Colors.deepPurple,
              ),
            ),
            Positioned.fill(
              child: FloatingBubbles.alwaysRepeating(
                noOfBubbles: 50,
                colorsOfBubbles: const [
                  Colors.deepPurpleAccent,
                  Colors.red,
                ],
                sizeFactor: 0.2,
                opacity: 70,
                speed: BubbleSpeed.slow,
                paintingStyle: PaintingStyle.fill,
                shape: BubbleShape.circle, //This is the default
              ),
            ),
            Positioned(
                child: ListView(
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
                                backgroundImage: AssetImage("assets/user_account.png"),
                              )
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
                          loggedinUser.displayName,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          loggedinUser.email,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          loggedinUser.uid,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          child: Table(
                            border: TableBorder.all(color: Colors.tealAccent),
                            children: <TableRow>[
                              TableRow(
                                  children: <Widget>[
                                     const TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "uid",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0
                                              ),
                                            )
                                        )
                                    ),
                                    TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                              loggedinUser.uid,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )
                                          ),
                                        )

                                    )
                                  ]
                              ),
                              TableRow(
                                  children: <Widget>[
                                    const TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "email",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0
                                              ),
                                            )
                                        )
                                    ),
                                    TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                              loggedinUser.email,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )
                                          ),
                                        )

                                    )
                                  ]
                              ),
                              TableRow(
                                  children: <Widget>[
                                    const TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "displayName",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0
                                              ),
                                            )
                                        )
                                    ),
                                    TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                              loggedinUser.displayName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )
                                          ),
                                        )

                                    )
                                  ]
                              ),
                              const TableRow(
                                  children: <Widget>[
                                    TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "phoneNumber",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0
                                              ),
                                            )
                                        )
                                    ),
                                    TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                              "null",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )
                                          ),
                                        )

                                    )
                                  ]
                              ),
                              TableRow(
                                  children: <Widget>[
                                    const TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "emailVerified",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0
                                              ),
                                            )
                                        )
                                    ),
                                    TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                              loggedinUser.emailVerified ? "true" : "false",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )
                                          ),
                                        )

                                    )
                                  ]
                              ),
                              TableRow(
                                  children: <Widget>[
                                    const TableCell(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "isAnonymous",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0
                                              ),
                                            )
                                        )
                                    ),
                                    TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                              loggedinUser.isAnonymous ? "true" : "false",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              )
                                          ),
                                        )

                                    )
                                  ]
                              ),

                            ],
                          )
                        )

                      ],
                    ),
                  ],
                ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60.0),
                  child: FloatingActionButton(
                      tooltip: "Déconnexion",
                      onPressed: () => {
                        signOut()
                      },
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.logout)
                  )
                )
              )
            )
          ]
      )
    );
  }
}