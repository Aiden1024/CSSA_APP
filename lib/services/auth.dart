import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /*
  * 1. Register with Email and Password, and go to NavPage
  * 2. Sign out, and Sign in with no user in database
  * 3. Create User model and database
  * 4. Sign in with User in data base
  * */

  // initial User Model
  // create user obj base on FirebaseUser
  AppUser? _userFromFirebaseUser(User? firebaseUser) {
    // if firebase != null, then return AppUser with uid, else return null
    return firebaseUser != null ? AppUser(uid: firebaseUser.uid) : null;
  }

  // auth change user stream
  Stream<AppUser?> get user{
    // if
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  // 1. Register
  Future regWithEmailPassword(String email, String password, String username) async {
    try {
      // Build in Firebase user
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = result.user;

      await DatabaseService(firebaseUser!.uid).updateUserData(email, username);
      // Create New User in Database, later
    } catch(e) {
      print(e.toString());
    }
  }

  // 2. Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  // 2.5 Sign in With no User in Database
  Future SignInWithEmailPassword(String email, String password) async {
    try {
      // Build in firebase user
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = result.user;
      await DatabaseService(firebaseUser!.uid).getUserData();
      return _userFromFirebaseUser(firebaseUser);
    } catch(e) {
      print(e.toString());
      return;
    }
  }

}