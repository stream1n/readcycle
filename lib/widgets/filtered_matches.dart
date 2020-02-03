import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:readcycle/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FilteredMatches extends StatelessWidget {

  final FirebaseUser user;

  FilteredMatches({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<FilteredUserMatchesBloc, FilteredUserMatchesState>(
      builder: (context, state) {
        if (state is FilteredUserMatchesLoading) {
          return LoadingIndicator();
        } else if (state is FilteredUserMatchesLoaded) {
          final userMatches = state.filteredUserMatches;
          return ListView.builder(
            itemCount: userMatches.length,
            itemBuilder: (context, index) {
              final userMatch = userMatches[index];
              final String displayName = user.uid==userMatch.userThatWillStay ? userMatch.userThatWillTravelName : userMatch.userThatWillStayName;
              final bool canIAccept = user.uid==userMatch.userThatWillStay;

              return UserMatchItem(
                  userMatch: userMatch,
                  displayName: displayName,
                  canIAccept: canIAccept
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
