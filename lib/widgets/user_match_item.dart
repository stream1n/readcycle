import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_matches_repository/user_matches_repository.dart';
import 'package:readcycle/widgets/widgets.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    if(canIAccept) {
      return ListTile(
          leading: Image.network(userMatch.pictureURL),
          title: Text(userMatch.name),
          subtitle: Text(
              displayName + " " + userMatch.distance.toString() + "km"),
          onTap: () async {
            final accepted = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserMatchAcceptOrReject(userMatch: userMatch, displayName: displayName),
              ),
            );
            if (accepted != null) {
              if( accepted ) {
                BlocProvider.of<UserMatchingBloc>(context)
                    .add(accept(userMatchID: userMatch.id));
              } else {
                BlocProvider.of<UserMatchingBloc>(context)
                    .add(reject(userMatchID: userMatch.id));
              }
            }
          }
      );
    } else {
      return ListTile(
          leading: Image.network(userMatch.pictureURL),
          title: Text(userMatch.name),
          subtitle: Text(
              displayName + " " + userMatch.distance.toString() + "km"),
          onTap: () async {
            final cancelled = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserMatchCancel(userMatch: userMatch, displayName: displayName),
              ),
            );
            if (cancelled != null) {
              if( cancelled ) {
                BlocProvider.of<UserMatchingBloc>(context)
                    .add(cancel(userMatchID: userMatch.id));
              }
            }
          }
      );
    }
  }
}
