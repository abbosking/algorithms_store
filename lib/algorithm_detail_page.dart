import 'package:flutter/material.dart';
import 'package:algorithmstore/algorithm_implementation_page.dart'; // Import AlgorithmImplementationPage

class AlgorithmDetailPage extends StatelessWidget {
  final String algorithmName;

  AlgorithmDetailPage({required this.algorithmName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(algorithmName),
      ),
      body: ListView(
        children: [
          LanguageTile(
            name: 'Python',
            logo:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png',
            onTap: () {
              _navigateToCodePage(context, 'Python');
            },
          ),
          LanguageTile(
            name: 'Java',
            logo:
                'https://1000logos.net/wp-content/uploads/2020/09/Java-Emblem.jpg',
            onTap: () {
              _navigateToCodePage(context, 'Java');
            },
          ),
          LanguageTile(
            name: 'C++',
            logo:
                'https://w7.pngwing.com/pngs/46/626/png-transparent-c-logo-the-c-programming-language-computer-icons-computer-programming-source-code-programming-miscellaneous-template-blue.png',
            onTap: () {
              _navigateToCodePage(context, 'C++');
            },
          ),
          // Add more languages as needed
        ],
      ),
    );
  }

  void _navigateToCodePage(BuildContext context, String languageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlgorithmImplementationPage(
          algorithmName: algorithmName,
          languageName: languageName,
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String name;
  final String logo;
  final VoidCallback onTap;

  LanguageTile({
    required this.name,
    required this.logo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        '$logo', // Replace 'assets/$logo' with your actual asset path
        height: 40,
        width: 40,
      ),
      title: Text(name),
      onTap: onTap,
    );
  }
}
