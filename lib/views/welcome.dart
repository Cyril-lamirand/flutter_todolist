// Default
import 'package:flutter/material.dart';
// Dependencies
import 'package:floating_bubbles/floating_bubbles.dart';
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
    return Scaffold(
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
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child:
                  Text(
                    "Cyril LAMIRAND - 1.0.0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                    ),

                  )
                ),
              ),
            )
        ],
      )
    );
  }
}