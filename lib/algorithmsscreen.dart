import 'package:flutter/material.dart';

class AlgorithmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithms'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/profile.png'), // Replace with your image path
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Description of algorithms
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore a variety of algorithms used in computer science. Learn and implement algorithms to solve computational problems efficiently.',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
            // Icons representing programming languages
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.code, size: 40.0, color: Colors.blue),
                Icon(Icons.code, size: 40.0, color: Colors.green),
                Icon(Icons.code, size: 40.0, color: Colors.red),
                // Add more icons as needed
              ],
            ),
            SizedBox(height: 16.0),
            // List of algorithms (example: using ListTile)
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text('Bubble Sort'),
              // Add onTap handler to navigate to details of the algorithm
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text('Quick Sort'),
              // Add onTap handler to navigate to details of the algorithm
            ),
            // Add more ListTiles for other algorithms
          ],
        ),
      ),
    );
  }
}
