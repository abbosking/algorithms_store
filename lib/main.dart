import 'package:flutter/material.dart';
import 'package:algorithmstore/login_page.dart';
import 'package:algorithmstore/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithm Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => BottomNavBar(),
        // Add routes for other pages if needed, like '/favorite', '/categories', etc.
      },
    );
  }
}
