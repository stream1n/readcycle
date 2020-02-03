import 'package:flutter/material.dart';
import 'package:user_matches_repository/user_matches_repository.dart';

class UserMatchCancel extends StatefulWidget {

  final UserMatch _userMatch;
  final String _displayName;

  UserMatchCancel({Key key, @required userMatch, @required displayName})
      : assert(userMatch != null && displayName != null),
        _userMatch = userMatch,
        _displayName = displayName,
        super(key: key);

  @override
  State<UserMatchCancel> createState() => _UserMatchCancelState();
}

class _UserMatchCancelState extends State<UserMatchCancel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancel'),
      ),
      body: Form(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, false);
              },
            )
          ],
        ),
      ),
    );
  }
}