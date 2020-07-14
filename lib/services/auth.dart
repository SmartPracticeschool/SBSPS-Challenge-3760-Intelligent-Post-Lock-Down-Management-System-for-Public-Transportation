import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_gen_rd/services/database.dart';
import 'package:qr_gen_rd/Models/user.dart';

// Contains Class for performing Authentication Services


class AuthService {

  // Used to start an instance to connect to FirebaseAuth-services
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Creates a User Object to extract the meaningful & required user data from FirebaseUser Object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Stream for continuous lookout of User Object, Returns User data when signed-in & null when signed-out
  Stream<User> get user {
    return _auth.onAuthStateChanged // This is the Stream that returns FirebaseUser Object
    // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); // Mapping FirebaseUser Object to User Object
  }

  // Sign-in Anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth
          .signInAnonymously();
      FirebaseUser user = result.user;
      User _user = _userFromFirebaseUser(user);
      return _user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign-in using email and password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, UserPersonelData data) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password); // Using built-in method
      FirebaseUser user = result.user;
      await UserDatabaseService(uid: user.uid).updateUserData(data); // Create a new document for the user with the uid
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign-out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

} // AuthService
