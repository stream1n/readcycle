import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/filtered_user_matches_bloc/filtered_user_matches.dart';
import 'package:readcycle/models/models.dart';

class FilterMatchesButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);
    return BlocBuilder<FilteredUserMatchesBloc, FilteredUserMatchesState>(
        builder: (context, state) {
      final button = _Button(
        onSelected: (filter) {
          BlocProvider.of<FilteredUserMatchesBloc>(context).add(UpdateUserMatchesFilter(filter));
        },
        activeFilter: state is FilteredUserMatchesLoaded
            ? state.activeFilter
            : VisibilityFilter.all,
        activeStyle: activeStyle,
        defaultStyle: defaultStyle,
      );
      return AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 150),
        child: button,
      );
    });
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VisibilityFilter>(
      tooltip: 'Filter Matches',
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuItem<VisibilityFilter>>[
        PopupMenuItem<VisibilityFilter>(
          value: VisibilityFilter.all,
          child: Text(
            'Show All',
            style: activeFilter == VisibilityFilter.all
                ? activeStyle
                : defaultStyle,
          ),
        ),
        PopupMenuItem<VisibilityFilter>(
          value: VisibilityFilter.wanted,
          child: Text(
            'I want',
            style: activeFilter == VisibilityFilter.wanted
                ? activeStyle
                : defaultStyle,
          ),
        ),
        PopupMenuItem<VisibilityFilter>(
          value: VisibilityFilter.mine,
          child: Text(
            'I have',
            style: activeFilter == VisibilityFilter.mine
                ? activeStyle
                : defaultStyle,
          ),
        ),
      ],
      icon: Icon(Icons.filter_list),
    );
  }
}
