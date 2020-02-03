import 'package:flutter/material.dart';
import 'package:user_matches_repository/user_matches_repository.dart';

class UserMatchAcceptOrReject extends StatefulWidget {

  final UserMatch _userMatch;
  final String _displayName;

  UserMatchAcceptOrReject({Key key, @required userMatch, @required displayName})
      : assert(userMatch != null && displayName != null),
        _userMatch = userMatch,
        _displayName = displayName,
        super(key: key);

  @override
  State<UserMatchAcceptOrReject> createState() => _UserMatchAcceptOrRejectState();
}

class _UserMatchAcceptOrRejectState extends State<UserMatchAcceptOrReject> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accept Or Reject'),
      ),
      body: Form(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            IconButton(
              icon: Icon(Icons.check_circle),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        ),
      ),
    );
  }
}