import 'package:flutter/material.dart';
import 'algorithms_in_category_page.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = ['Sorting', 'Searching', 'Graph Algorithms'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithm Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              // Navigate to a page displaying algorithms for the selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlgorithmsInCategoryPage(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
