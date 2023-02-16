// Default
import 'package:flutter/material.dart';

BoxDecoration boxDecorationContainer =
const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.4, 0.6, 0.9],
      colors: [
        Colors.deepPurple,
        Colors.deepPurpleAccent,
        Colors.teal,
        Colors.tealAccent,
      ],
    )
);