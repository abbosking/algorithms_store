// Import necessary packages and icons
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'code_page.dart';

class AlgorithmDetailPage extends StatelessWidget {
  final String name;
  final String description;
  final Map<String, String> languages;

  AlgorithmDetailPage({
    required this.name,
    required this.description,
    required this.languages,
  });

  // Map language names to corresponding FontAwesome icons
  final Map<String, IconData> languageIcons = {
    'python': FontAwesomeIcons.python,
    'java': FontAwesomeIcons.java,
    'cpp': FontAwesomeIcons.code,
    'javascript': FontAwesomeIcons.js,
    // Add more language icons as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Programming Languages:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: languages.keys.map((language) {
                return GestureDetector(
                  onTap: () {
                    // Handle the tap event, e.g., navigate to CodePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CodePage(
                          algorithmName: name,
                          language: language,
                          code: languages[language] ?? '',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      languageIcons[language],
                      size: 40.0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
