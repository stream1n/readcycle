import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class UserMatchingEvent extends Equatable {
  const UserMatchingEvent();

  @override
  List<Object> get props => [];
}

class accept extends UserMatchingEvent {
  final String userMatchID;

  const accept({@required this.userMatchID}) : assert(userMatchID != null);

  @override
  List<Object> get props => [userMatchID];
}

class reject extends UserMatchingEvent {
  final String userMatchID;

  const reject({@required this.userMatchID}) : assert(userMatchID != null);

  @override
  List<Object> get props => [userMatchID];
}

class cancel extends UserMatchingEvent {
  final String userMatchID;

  const cancel({@required this.userMatchID}) : assert(userMatchID != null);

  @override
  List<Object> get props => [userMatchID];
}