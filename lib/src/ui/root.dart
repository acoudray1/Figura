import 'package:figura/src/ui/exercise/exercise.dart';
import 'package:figura/src/ui/home/home.dart';
import 'package:figura/src/ui/workout/workout.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  final int _currentIndex = 0;

  Widget getPage(int index) {
    if (index == 0) {
      return Home();
    }
    if (index == 1) {
      return Workout();
    }
    if (index == 2) {
      return Exercise();
    }
    return Home();
  }

  final List<BottomNavigationBarItem> _navigationBarItems = <BottomNavigationBarItem> [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black54),
      title: Text('Home'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add, color: Colors.black54),
      title: Text('Workout'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.rowing, color: Colors.black54),
      title: Text('Exercise'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _navigationBarItems,
      ),
    );
  }
}