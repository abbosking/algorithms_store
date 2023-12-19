import 'package:flutter/material.dart';

class AlgorithmDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithm Details'),
      ),
      body: Center(
        child: Text('Details of the selected algorithm'),
      ),
    );
  }
}
