import 'package:equatable/equatable.dart';

abstract class UserMatchingState extends Equatable {
  const UserMatchingState();

  @override
  List<Object> get props => [];
}

class UserMatchingEmpty extends UserMatchingState {}

class UserMatchingLoading extends UserMatchingState {}

class UserMatchingLoaded extends UserMatchingState {}

class UserMatchingError extends UserMatchingState {}