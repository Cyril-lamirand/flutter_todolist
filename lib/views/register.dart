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
// Screen(s)
import 'package:a5_todolist/views/login.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: appContainerDecoration,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const AppBarWidget(title: "Inscription", hideActionProfile: true, actionReturnButton: true),
            body: ModalProgressHUD(
                inAsyncCall: showSpinner,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                            // Do something with the email input
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Adresse e-mail...'
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            displayName = value;
                            // Do something with the email input
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Nom d\'utilisateur...'
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
                              // Do something with the password input
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Mot de passe...'
                            )
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            phoneNumber = value;
                            // Do something with the email input
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Téléphone...'
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        RoundedButton(
                            colour: Colors.deepPurple.shade400,
                            title: "S\'enregistrer",
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                if (newUser != null) {
                                  Navigator.pushReplacement<void, void>(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) => Login()
                                      )
                                  );
                                }
                              } catch(e) {
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