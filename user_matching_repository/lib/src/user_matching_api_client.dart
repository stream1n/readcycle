import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserMatchingApiClient {
  static const baseUrl = 'https://user-matching-service-gqdj5a23xq-ew.a.run.app/match';
  final http.Client httpClient;

  UserMatchingApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<void> accept(String userMatchID) async {
    final url = '$baseUrl/accepted?match=$userMatchID';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Could not accept');
    }

  }

  Future<void> reject(String userMatchID) async {
    final url = '$baseUrl/rejected?match=$userMatchID';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Could not reject');
    }

  }

  Future<void> cancel(String userMatchID) async {
    final url = '$baseUrl/cancelled?match=$userMatchID';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Could not cancel');
    }

  }
}
