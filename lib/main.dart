import 'package:figura/src/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Figura());
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
} 

class Figura extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figura',
      home: Root(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        accentColor: Colors.blueAccent,
        brightness: Brightness.light,
      ),
    );
  }
}