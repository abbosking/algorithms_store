import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'login_page.dart';
import 'account_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onBottomNavTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithms Store'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to the Account Page
              _onBottomNavTapped(3);
            },
          ),
        ],
        backgroundColor: Color(0xFF47FA41), // Set the background color
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          // Your Home Page content
          buildPage("Home Page Content"),
          // Categories Page
          CategoriesPage(),
          // Placeholder for Chat Page (replace with your implementation)
          buildPage("Chat Page Content"),
          // Account Page
          AccountPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF47FA41), // Set the background color
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.green),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category,color: Colors.green),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat,color: Colors.green),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,color: Colors.green),
              label: '',
            ),
          ],
          selectedItemColor: Colors.white, // Set the color of the selected icon
          unselectedItemColor: Colors.grey, // Set the color of unselected icons
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          currentIndex: _currentIndex,
          onTap: _onBottomNavTapped,
        ),
      ),
    );
  }

  Widget buildPage(String content) {
    return Center(
      child: Text(content),
    );
  }
}
