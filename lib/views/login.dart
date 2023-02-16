// Default
import 'package:flutter/material.dart';
// Dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// Widget(s)
import '../widgets/app_bar_w.dart';
import '../widgets/rounded_button_w.dart';
// Fragment(s)
import '../fragments/box_decoration_f.dart';
import '../fragments/input_decoration_f.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: appContainerDecoration,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const AppBarWidget(title: "Connexion", hideActionProfile: true, actionReturnButton: true),
            body: ModalProgressHUD(
                inAsyncCall: showSpinner,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: "Adresse email..."
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Mot de passe...'
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
                              try {
                                final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                if (user != null) {
                                  Navigator.pushReplacementNamed(context, "home_screen");
                                }
                              } catch (e) {
                                print(e);
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
    );
  }
}