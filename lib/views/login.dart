// Default
import 'package:flutter/material.dart';
// Dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Widget(s)
import '../widgets/app_bar_w.dart';
import '../widgets/rounded_button_w.dart';
// Fragment(s)
import '../fragments/box_decoration_f.dart';
import '../fragments/input_decoration_f.dart';
// Screen(s)
import 'home.dart';

var kTextFieldDecoration = appInputDecoration;
var appContainerDecoration = boxDecorationContainer;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final _auth = FirebaseAuth.instance;

class _LoginState extends State<Login> {
  late String email;
  late String password;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: "Connexion", hideActionProfile: true, actionReturnButton: true),
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
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Saisir une adresse email valide !';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: "Adresse email...",
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Saisir votre mot de passe !';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Mot de passe...',
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              RoundedButton(
                                colour: Colors.deepPurpleAccent.shade200,
                                title: "S\'authentifier",
                                onPressed: () async {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  if(_formKey.currentState!.validate()) {
                                    try {
                                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                      if (user != null) {
                                        Navigator.pushReplacement<void, void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) => Home()
                                          )
                                        );
                                      }
                                    } catch (e) {
                                      Fluttertoast.showToast(
                                        msg: "Erreur: $e",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.SNACKBAR,
                                        backgroundColor: Colors.black54,
                                        textColor: Colors.white,
                                        fontSize: 14.0
                                      );
                                    }
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              )
                            ],
                          )
                      )
                  )
              )
            ]
        )
    );
  }
}