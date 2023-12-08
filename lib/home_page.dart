import 'package:flutter/material.dart';
import 'package:algorithmstore/algorithm_detail_page.dart'; // Import AlgorithmDetailPage

class HomePage extends StatelessWidget {
  final List<String> algorithms = [
    'Binary search',
    'Quick sort',
    'Fibonacci Numbers',
    // Add more algorithms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implement search functionality here
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: algorithms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(algorithms[index]),
                  onTap: () {
                    // Navigate to AlgorithmDetailPage when an algorithm is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlgorithmDetailPage(
                          algorithmName: algorithms[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
