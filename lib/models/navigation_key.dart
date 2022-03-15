import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

class NavigationKey {
  NavigationKey._();

  static final GlobalKey<CurvedNavigationBarState> _key = GlobalKey();

  static GlobalKey<CurvedNavigationBarState> getKey() => _key;
}
