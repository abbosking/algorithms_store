import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'login_page.dart';
import 'account_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithms Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Algorithms',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Replace the following container with your algorithm cards or list
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text('Algorithm Card 1'),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text('Algorithm Card 2'),
              ),
            ),
            // Add more algorithm cards as needed
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Categories Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()),
                );
              },
              child: Text('View Categories'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login (No authentication)'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation when a bottom navigation icon is tapped
          switch (index) {
            case 0:
            // Navigate to the Home Page
              break;
            case 1:
            // Navigate to the Categories Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
              break;
            case 2:
            // Navigate to the Chat Page (not implemented in this example)
              break;
            case 3:
            // Navigate to the Account Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
