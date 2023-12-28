import 'package:finalmp/account/auth_screen.dart';
import 'package:finalmp/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB2L9AXrTfAdprmGEOhNq4DmMTuk-_JcCk',
      appId: '1:915784461572:android:b033fc05117f7de8e4f451',
      messagingSenderId: '915784461572',
      projectId: 'algorithmauth',
        storageBucket: "gs://algorithmauth.appspot.com"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const SignupScreen();
          }
        },
      ),
    );
  }
}