import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_matches_repository/user_matches_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserMatchItem extends StatelessWidget {
  final UserMatch userMatch;
  final FirebaseUser user;

  UserMatchItem({
    Key key,
    @required this.userMatch,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String displayName = user.displayName==userMatch.userThatWillStayName ? userMatch.userThatWillTravelName : userMatch.userThatWillStayName;

    return ListTile(
        leading: Image.network(userMatch.pictureURL),
        title: Text(userMatch.name),
        subtitle: Text(displayName + " " + userMatch.distance.toString() + "km"));
  }
}
