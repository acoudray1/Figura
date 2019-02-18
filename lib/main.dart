import 'package:figura/src/blocs/application_bloc.dart';
import 'package:figura/src/blocs/bloc_provider.dart';
import 'package:figura/src/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: Figura(),
    ));
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
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
        iconTheme: const IconThemeData(color: Colors.blue),
        accentColor: Colors.blueAccent,
        brightness: Brightness.light,
      ),
    );
  }
}