// code_screen.dart

import 'package:flutter/material.dart';

class CodeScreen extends StatelessWidget {
  final String language;
  final String code;

  CodeScreen({required this.language, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$language Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            code,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
