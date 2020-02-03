import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:readcycle/widgets/widgets.dart';

class MatchesScreen extends StatelessWidget {

  final FirebaseUser user;

  MatchesScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Matches'),
        actions: [
          FilterMatchesButton()
        ],
      ),
      body: FilteredMatches(user: user),
    );
  }
}
