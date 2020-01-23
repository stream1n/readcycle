import 'package:custom_navigator/custom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readcycle/screens/screens.dart';

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
            type : BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home), title: new Text("")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.search),
                  title: new Text("")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.local_library),
                  title: new Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: new Text(""))
            ],
          ),
        ),
        children: <Widget>[
          HomeScreen(),
          BookSearchScreen(user: widget.user),
          LibraryScreen(user: widget.user),
          ProfileScreen(user: widget.user),
        ],
        onItemTap: (index) {});
  }
}
