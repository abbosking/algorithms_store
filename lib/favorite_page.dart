import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favoriteAlgorithms = [
    'Binary search',
    'Quick sort',
    // Add favorite algorithms here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: favoriteAlgorithms.isEmpty
          ? Center(
              child: Text('No favorite algorithms yet!'),
            )
          : ListView.builder(
              itemCount: favoriteAlgorithms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteAlgorithms[index]),
                  // Add onTap action if needed
                );
              },
            ),
    );
  }
}
