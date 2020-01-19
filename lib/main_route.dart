import 'package:readcycle/screens/home_screen.dart';
import 'package:readcycle/screens/library_screen.dart';
import 'package:readcycle/screens/profile_screen.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainRoute extends StatefulWidget {
  final FirebaseUser user;

  MainRoute({Key key, @required this.user}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainRoute> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        scaffold: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home), title: new Text("Home")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.library_books),
                  title: new Text("Library")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: new Text("Profile"))
            ],
          ),
        ),
        children: <Widget>[
          HomeScreen(),
          LibraryScreen(user: widget.user),
          ProfileScreen(user: widget.user),
        ],
        onItemTap: (index) {});
  }
}
