import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Kgfs08FirebaseUser {
  Kgfs08FirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

Kgfs08FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Kgfs08FirebaseUser> kgfs08FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Kgfs08FirebaseUser>((user) => currentUser = Kgfs08FirebaseUser(user));
