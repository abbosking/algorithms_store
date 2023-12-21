// auth_screen.dart

import 'package:finalmp/login_page.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class AuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLogin = false;

  handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      if (_isLogin) {
        await Auth().signInWithEmailAndPassword(email, password);
      } else {
        await Auth().registerWithEmailAndPassword(email, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: handleSubmit,
                child: Text(_isLogin ? 'Login' : 'Register'),
              ),
              if (!_isLogin)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Switch to Login'),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
