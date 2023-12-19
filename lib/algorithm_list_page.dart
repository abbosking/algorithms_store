import 'package:flutter/material.dart';

class AlgorithmListPage extends StatelessWidget {
  final String category;

  AlgorithmListPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorit - $category'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Algorithm 1 - $category'),
            // Add onTap handler for selecting and viewing details
            onTap: () {
              // Navigate to the details page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlgorithmDetailsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Algorithm 2 - $category'),
            onTap: () {
              // Navigate to the details page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlgorithmDetailsPage()),
              );
            },
          ),
          // Add more algorithm list items as needed
        ],
      ),
    );
  }
}

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
