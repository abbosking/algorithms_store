import 'package:flutter/material.dart';

class AlgorithmDescriptionPage extends StatelessWidget {
  final String algorithmName;
  final String algorithmCategory;
  final String algorithmDescription;
  final String pythonCode;
  final String javaCode;
  final String imageUrl; // Add imageUrl variable

  AlgorithmDescriptionPage({
    required this.algorithmName,
    required this.algorithmCategory,
    required this.algorithmDescription,
    required this.pythonCode,
    required this.javaCode,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(algorithmName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category: $algorithmCategory',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description: $algorithmDescription',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Display the image if available
            imageUrl.isNotEmpty
                ? Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Container(),
            SizedBox(height: 20),
            Text(
              'Python Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              pythonCode,
              style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
            ),
            SizedBox(height: 20),
            Text(
              'Java Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              javaCode,
              style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
            ),
          ],
        ),
      ),
    );
  }
}
