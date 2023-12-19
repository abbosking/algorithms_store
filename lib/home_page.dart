import 'package:flutter/material.dart';
import 'algorithm_list_page.dart';
import 'categories_page.dart';
import 'favorites_page.dart';
import 'account_page.dart';
import 'category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithm Store'),
      ),
      body: _getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Example Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: exampleCategories
                    .map(
                      (category) => CategoryCard(
                    category: category,
                    onPressed: () {
                      navigateToAlgorithmList(context, category.name);
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        );
      case 1:
        return CategoriesPage();
      case 2:
        return FavoritesPage();
      case 3:
        return AccountPage();
      default:
        return Container(); // Placeholder, you can customize this behavior
    }
  }

  void navigateToAlgorithmList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlgorithmListPage(category: category),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onPressed;

  const CategoryCard({
    required this.category,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
