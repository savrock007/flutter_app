import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpWithEmailAndPassword(fullName, emailAddress, password) async {
    try {
      print(emailAddress);
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      if (userCredential.user != null) {
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users');

        String uid = userCredential.user!.uid;

        await userRef.child(uid).set({
          "fullName": fullName,
          "email": emailAddress,
          "uid": uid,
        });
      }
    } on FirebaseAuthException catch (e) {
      print("alalal$e");
    }
  }

  Future signInWithEmailAndPassword(emailAddress, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
