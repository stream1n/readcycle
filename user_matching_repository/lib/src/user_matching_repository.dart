abstract class UserMatchingRepository {

  Future<void> accept(String userMatchID);
  Future<void> reject(String userMatchID);
  Future<void> cancel(String userMatchID);

}
