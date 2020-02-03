import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_matches_repository/user_matches_repository.dart';

class UserMatchItem extends StatelessWidget {
  final UserMatch userMatch;
  final String displayName;
  final bool canIAccept;

  UserMatchItem({
    Key key,
    @required this.userMatch,
    @required this.displayName,
    @required this.canIAccept
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(
        leading: Image.network(userMatch.pictureURL),
        title: Text(userMatch.name),
        subtitle: Text(displayName + " " + userMatch.distance.toString() + "km")
    );
  }
}
