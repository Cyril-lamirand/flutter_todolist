// Default
import 'package:flutter/material.dart';
// Dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
// Widget(s)
import '../widgets/app_bar_w.dart';
import '../widgets/rounded_button_w.dart';
// Fragment(s)
import '../fragments/box_decoration_f.dart';
import '../fragments/input_decoration_f.dart';
// Screen(s)
import 'confirm.dart';

var kTextFieldDecoration = appInputDecoration;
var appContainerDecoration = boxDecorationContainer;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String displayName;
  late String phoneNumber;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: const AppBarWidget(title: "Inscription", hideActionProfile: true, actionReturnButton: true),
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
                          hintText: 'Adresse e-mail...',
                          filled: true,
                          fillColor: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Saisir un nom d\'utilisateur valide !';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          displayName = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Nom d\'utilisateur...',
                          filled: true,
                          fillColor: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                          // Do something with the password input
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Saisir un mot de passe (6 charactères minimum).';
                          }
                          return null;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Mot de passe...',
                          filled: true,
                          fillColor: Colors.white,
                        )
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      RoundedButton(
                        colour: Colors.deepPurple.shade400,
                        title: "S\'enregistrer",
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if(_formKey.currentState!.validate()) {
                            try {
                              UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                              User? user = result.user;
                              user?.updateDisplayName(displayName);
                              if (user != null) {
                                Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Confirm()
                                    )
                                );
                              }
                            } catch(e) {
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
                    ]
                    )
                  )
                )
            )
          ]
        )
    );
  }
}

class Integer {
}