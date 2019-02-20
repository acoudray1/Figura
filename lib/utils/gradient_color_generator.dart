import 'package:flutter/material.dart';

/// Method that returns a linear gradient, just give the good index
/// 
/// index 0 to 4 : difficulty from 1 to 5 scale
/// index 5 to 12 : colors for the categories 
/// 
LinearGradient gradientGenerator(int index){

  final List<Color> leftColors = 
  <Color> [  
                              const Color.fromRGBO(0, 176, 155, 1),               // (0) difficulty 1 
                              const Color.fromRGBO(86, 204, 247, 1),              // (1) difficulty 2
                              const Color.fromRGBO(247, 151, 30, 1),              // (2) difficulty 3
                              const Color.fromRGBO(238, 9, 121, 1),               // (3) difficulty 4
                              const Color.fromRGBO(100, 43, 115, 1),              // (4) difficulty 5
                              const Color.fromRGBO(157, 80, 187, 1),             // (5) category CHEST
                              const Color.fromRGBO(157, 80, 187, 1),              // (6) category LEG
                              const Color.fromRGBO(52, 143, 80, 1),               // (7) category BICEPS
                              const Color.fromRGBO(247, 151, 30, 1),              // (8) category TRICEPS
                              const Color.fromRGBO(17, 153, 142, 1),              // (9) category SHOULDERS
                              const Color.fromRGBO(0, 210, 255, 1),               // (10) category BACK
                              const Color.fromRGBO(203, 45, 62, 1),               // (11) category ALL
];

  final List<Color> rightColors = 
  <Color> [ 
                              const Color.fromRGBO(150, 201, 61, 1),              // difficulty 1
                              const Color.fromRGBO(47, 128, 237, 1),              // difficulty 2
                              const Color.fromRGBO(255, 210, 0, 1),               // difficulty 3
                              const Color.fromRGBO(255, 106, 0, 1),               // difficulty 4
                              const Color.fromRGBO(198, 66, 110, 1),              // difficulty 5  
                              const Color.fromRGBO(110, 72, 240, 1),               // category CHEST
                              const Color.fromRGBO(86, 180, 211, 1),              // category LEG
                              const Color.fromRGBO(86, 180, 211, 1),              // category BICEPS
                              const Color.fromRGBO(255, 210, 0, 1),               // category TRICEPS
                              const Color.fromRGBO(56, 239, 125, 1),              // category SHOULDERS
                              const Color.fromRGBO(58, 123, 213, 1),              // category BACK
                              const Color.fromRGBO(239, 121, 78, 1),               // category ALL
];

  return LinearGradient(
    colors: <Color> [
      leftColors[index],
      rightColors[index],
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 1.0),
    stops: const <double> [0.0, 1.0],
    tileMode: TileMode.mirror
  );
}