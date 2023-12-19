import 'package:flutter/material.dart';
import 'algorithmsscreen.dart'; // Import your Algorithms Screen file

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top (replace with your image)
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/categories_image.jpg'), // Replace with your image path
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // List of categories with onTap navigation
            ListTile(
              leading: Icon(Icons.category, size: 40.0, color: Colors.blue),
              title: Text('Sorting Algorithms'),
              onTap: () {
                // Navigate to Algorithms Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlgorithmsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.category, size: 40.0, color: Colors.green),
              title: Text('Search Algorithms'),
              onTap: () {
                // Navigate to Algorithms Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlgorithmsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.category, size: 40.0, color: Colors.red),
              title: Text('Graph Algorithms'),
              onTap: () {
                // Navigate to Algorithms Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlgorithmsScreen()),
                );
              },
            ),
            // Add more ListTiles for other categories
          ],
        ),
      ),
    );
  }
}
