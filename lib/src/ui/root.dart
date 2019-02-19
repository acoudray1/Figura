import 'package:figura/src/ui/exercise/exercise.dart';
import 'package:figura/src/ui/home/home.dart';
import 'package:figura/src/ui/workout/workout.dart';
import 'package:figura/utils/custom_bar.dart';
import 'package:figura/theme/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {

  @override
  RootState createState() => RootState();
}

class RootState extends State<Root> {

  static int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  dynamic onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }

  // gestion de l'indexation des pages
  Widget getPage(int index) {
    if (index == 0) {
      return HomePage();
    }
    if (index == 1) {
      return ExercisePage();
    }
    if (index == 2) {
      return WorkoutPage();
    }
    return HomePage();
  }

  // items 
  final List<BottomNavigationBarItem> _navigationBarItems = <BottomNavigationBarItem> [
    const BottomNavigationBarItem(
      icon: Icon(CustomIcons.home, color: Colors.black26),
      activeIcon: Icon(CustomIcons.home_1, color: Colors.black87),
      title: Text('Home'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CustomIcons.plus, color: Colors.black26),
      activeIcon: Icon(CustomIcons.plus_squared, color: Colors.black87),
      title: Text('Workout'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.rowing, color: Colors.black26),
      activeIcon: Icon(Icons.rowing, color: Colors.black87),
      title: Text('Exercise'),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_currentIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        type: CustomBottomNavigationBarType.spotifyLike,
        bottomBarColor: Colors.white,
        iconSize: 24.0,
        fixedColor: Colors.black87,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: _navigationBarItems,
      ),
    );
  }
}