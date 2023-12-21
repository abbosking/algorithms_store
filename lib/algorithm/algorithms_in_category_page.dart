import 'package:flutter/material.dart';

class AlgorithmsInCategoryPage extends StatelessWidget {
  final String category;

  AlgorithmsInCategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Algorithms'),
      ),
      body: Container(
        child: Text('List of $category algorithms goes here'),
      ),
    );
  }
}
