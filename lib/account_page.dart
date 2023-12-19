import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, // Set the shape to rectangle
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/profile.png'), // Replace with the actual image path
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name: John Doe', // Replace with user's actual name
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Email: john.doe@example.com', // Replace with user's actual email
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Bio: Software Developer', // Replace with user's actual bio
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Status: Active', // Replace with user's actual status
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
