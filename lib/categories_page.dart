import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    'Sorting Algorithms',
    'Searching Algorithms',
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              // Navigate to the selected category's page
              // You can create separate pages for each category or handle them accordingly
              // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(category: categories[index])));
            },
          );
        },
      ),
    );
  }
}
