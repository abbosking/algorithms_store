import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Password Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Implement login functionality here
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Login'),
            ),

            // Create an Account
            TextButton(
              onPressed: () {
                // Navigate to create account page
              },
              child: Text('Create an account'),
            ),

            // Forgot Username or Password
            TextButton(
              onPressed: () {
                // Navigate to forgot username/password page
              },
              child: Text('Forgot username or password'),
            ),

            // Login with Google Button
            ElevatedButton(
              onPressed: () {
                // Implement login with Google functionality
              },
              child: Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
