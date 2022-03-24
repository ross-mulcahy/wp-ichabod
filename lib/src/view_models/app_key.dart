
import 'package:flutter/material.dart' show ChangeNotifier, GlobalKey, ScaffoldState;

class Keys with ChangeNotifier {
  final GlobalKey<ScaffoldState> appScaffoldKey = GlobalKey<ScaffoldState>();
  // int _count = 0;
  // int get count => _count;

  // void increment() {
  //   _count++;
  //   notifyListeners();
  // }
}