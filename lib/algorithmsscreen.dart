import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'algorithm_detail_page.dart';

class Algorithm {
  final int id;
  final String category;
  final String name;
  final String description;
  final Map<String, String> languages;

  Algorithm({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.languages,
  });
}

class AlgorithmsScreen extends StatefulWidget {
  final String category;

  AlgorithmsScreen({required this.category});

  @override
  _AlgorithmsScreenState createState() => _AlgorithmsScreenState();
}

class _AlgorithmsScreenState extends State<AlgorithmsScreen> {
  late List<Algorithm> algorithms = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://abbosking.github.io/jsons/algorithms.json'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        algorithms = jsonData
            .where((data) => data['category'] == widget.category)
            .map((data) => Algorithm(
          id: data['id'],
          category: data['category'],
          name: data['name'],
          description: data['description'],
          languages: Map<String, String>.from(data['languages']),
        ))
            .toList();
      });
    } else {
      throw Exception('Failed to load JSON data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithms List - ${widget.category}'),
      ),
      body: Center(
        child: algorithms.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: algorithms.length,
          itemBuilder: (context, index) {
            Algorithm algorithm = algorithms[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(algorithm.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category: ${algorithm.category}'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlgorithmDetailPage(
                        name: algorithm.name,
                        description: algorithm.description,
                        languages: algorithm.languages,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
