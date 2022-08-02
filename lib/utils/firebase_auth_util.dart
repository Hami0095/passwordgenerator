import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthServices(
    this._firebaseAuth,
  );

  Future<String> signIn(String email, String pwd) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signUp(String email, String pwd) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return "Signed Up!";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
