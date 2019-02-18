import 'dart:async';
import 'package:figura/src/blocs/bloc_provider.dart';

enum NavBarItem {HOME, WORKOUT, EXERCISE}

class BottomNavigationBarBloc implements BlocBase {
  
  final StreamController<NavBarItem> _navBarController = StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void changeIndex(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.WORKOUT);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.EXERCISE);
        break;
      default:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
    }
  }

  @override
  void dispose() {
    _navBarController?.close();
  }
}