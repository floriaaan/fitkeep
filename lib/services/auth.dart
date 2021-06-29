import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitkeep_flutter/models/user.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser? _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison
    return user != null
        ? CustomUser(
            uid: user.uid,
            provider: user.providerData[0].providerId,
            email: user.email,
            photoUrl: user.providerData[0].photoURL,
            displayName: user.displayName)
        : null;
  }

  Stream<CustomUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }

  /// Sign-in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Sign-in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<CustomUser?> signInWithGoogle() async {
    // try {
    //   // Trigger the authentication flow
    //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //   // Obtain the auth details from the request
    //   GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //   // Create a new credential
    //   final credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );

    //   UserCredential result =
    //       await FirebaseAuth.instance.signInWithCredential(credential);
    //   User? user = result.user;
    //   return _userFromFirebaseUser(user!);
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }
}
