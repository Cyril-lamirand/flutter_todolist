// Default
import 'package:flutter/material.dart';
// Fragment(s)
import '../fragments/box_decoration_f.dart';
// Widget(s)
import '../widgets/rounded_button_w.dart';

// Fragment(s) var(s)
var appContainerDecoration = boxDecorationContainer;

class Welcome extends StatefulWidget {
  // Constructor
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: appContainerDecoration,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.network("https://cdn-icons-png.flaticon.com/128/2490/2490402.png"),
                    RoundedButton(
                      colour: Colors.deepPurpleAccent.shade400,
                      title: 'Connexion',
                      onPressed: () => {
                        Navigator.pushNamed(context, 'login_screen')
                      },
                    ),
                    RoundedButton(
                        colour: Colors.deepPurpleAccent.shade200,
                        title: 'S\'enregistrer',
                        onPressed: () => {
                          Navigator.pushNamed(context, 'registration_screen')
                          //Navigator.of(context).popUntil(ModalRoute.withName("registration_screen"));
                        }
                    ),
                  ]
              ),
            )
        )
    );
  }
}