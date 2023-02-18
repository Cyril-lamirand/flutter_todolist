// Default
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'home.dart';

class Confirm extends StatefulWidget {
  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  void onEnd() {
    print('onEnd');
  }

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
              Positioned.fill(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 250.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                            color: Colors.tealAccent,
                            width: 4,
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Image(
                              image: AssetImage('assets/sign_check.png'),
                              width: 100.0,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            const Text(
                              "Compte validé !",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CircularCountDownTimer(
                              duration: 5,
                              initialDuration: 0,
                              controller: CountDownController(),
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.height / 6,
                              ringColor: Colors.grey[300]!,
                              ringGradient: null,
                              fillColor: Colors.deepPurple,
                              fillGradient: null,
                              backgroundColor: Colors.deepPurpleAccent,
                              backgroundGradient: null,
                              strokeWidth: 20.0,
                              strokeCap: StrokeCap.round,
                              textStyle: TextStyle(
                              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                              textFormat: CountdownTextFormat.S,
                              isReverse: false,
                              isReverseAnimation: false,
                              isTimerTextShown: true,
                              autoStart: true,
                              onComplete: () {
                                Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Home()
                                    )
                                );
                              },
                              timeFormatterFunction: (defaultFormatterFunction, duration) {
                                if (duration.inSeconds == 0) {
                                  return "Start";
                                } else {
                                  return Function.apply(defaultFormatterFunction, [duration]);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Redirection...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
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