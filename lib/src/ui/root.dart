import 'package:figura/src/blocs/bottom_navigation_bar_bloc.dart';
import 'package:figura/src/ui/exercise/exercise.dart';
import 'package:figura/src/ui/home/home.dart';
import 'package:figura/src/ui/workout/workout.dart';
import 'package:figura/utils/custom_bar.dart';
import 'package:figura/theme/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {

  final BottomNavigationBarBloc _bottomNavBarBloc = BottomNavigationBarBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.HOME:
              return HomePage();
              break;
            case NavBarItem.WORKOUT: 
              return WorkoutPage();
              break;
            case NavBarItem.EXERCISE:
              return ExercisePage();
              break;
          }
        },
      ),
      bottomNavigationBar: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return CustomedBottomNavigationBar(snapshot: snapshot, bottomNavBarBloc: _bottomNavBarBloc);
        },
      ),
    );
  }
}

class CustomedBottomNavigationBar extends StatelessWidget {
  CustomedBottomNavigationBar({this.snapshot, this.bottomNavBarBloc});

  final AsyncSnapshot<NavBarItem> snapshot;
  final BottomNavigationBarBloc bottomNavBarBloc;
  
  final List<BottomNavigationBarItem> _navigationBarItems = <BottomNavigationBarItem> [
    const BottomNavigationBarItem(
      icon: Icon(CustomIcons.home_outline, color: Colors.black26),
      activeIcon: Icon(CustomIcons.home, color: Colors.black87),
      title: Text('Home'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CustomIcons.plus_squared_alt, color: Colors.black26),
      activeIcon: Icon(CustomIcons.plus_squared, color: Colors.black87),
      title: Text('Workout'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(CustomIcons.th_list_outline, color: Colors.black26),
      activeIcon: Icon(CustomIcons.th_list, color: Colors.black87),
      title: Text('Exercise'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigationBar(
      type: CustomBottomNavigationBarType.spotifyLike,
      bottomBarColor: Colors.white,
      iconSize: 24.0,
      fixedColor: Colors.black87,
      currentIndex: snapshot.data.index,
      onTap: bottomNavBarBloc.changeIndex,
      items: _navigationBarItems,
    );
  }
}