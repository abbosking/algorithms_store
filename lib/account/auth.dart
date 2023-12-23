import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getCurrentUserUid() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      // Handle the case when the user is not logged in
      // You might want to throw an exception or return a default value
      throw Exception('User not logged in');
    }
  }

  // SignUp User

  Future<String> signupUser({
    required String email,
    required String password,
    required String address,
    required String name,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          address.isNotEmpty ||
          name.isNotEmpty) {
        // register user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // add user to your  firestore database
        print(cred.user!.uid);
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
          'address': address,
        });

        res = "success";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logIn user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // for sighout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

// StreamBuilder(
//   stream: FirebaseAuth.instance.authStateChanges(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return const HomePage();
//     } else {
//       return const AuthSplashScreen();
//     }
//   },
// ),