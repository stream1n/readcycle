import 'dart:async';

import 'package:meta/meta.dart';
import './user_matching_api_client.dart';
import 'user_matching_repository.dart';

class UserMatchingRepositoryHttp implements UserMatchingRepository{
  final UserMatchingApiClient userMatchingApiClient;

  UserMatchingRepositoryHttp({@required this.userMatchingApiClient})
      : assert(userMatchingApiClient != null);

  Future<void> accept(String userMatchID) async {
    return await userMatchingApiClient.accept(userMatchID);
  }

  Future<void> reject(String userMatchID) async {
    return await userMatchingApiClient.reject(userMatchID);
  }

  Future<void> cancel(String userMatchID) async {
    return await userMatchingApiClient.cancel(userMatchID);
  }

}
