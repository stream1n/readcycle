import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {

  Future<FirebaseUser> signInWithGoogle();

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<FirebaseUser> getUser();
}
