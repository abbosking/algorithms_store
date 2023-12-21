import 'dart:convert';
import 'package:http/http.dart' as http;

class Algorithm {
  final int id;
  final String category;
  final String name;
  final Map<String, String> languages;

  Algorithm({
    required this.id,
    required this.category,
    required this.name,
    required this.languages,
  });

  factory Algorithm.fromJson(Map<String, dynamic> json) {
    return Algorithm(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      languages: Map<String, String>.from(json['languages']),
    );
  }
}

class AlgorithmService {
  Future<List<Algorithm>> getAlgorithms() async {
    final response = await http.get(Uri.parse('https://abbosking.github.io/jsons/algorithms.json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Algorithm.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load algorithms');
    }
  }

  Future<List<String>> getCategories() async {
    final algorithms = await getAlgorithms();
    final uniqueCategories = algorithms.map((algorithm) => algorithm.category).toSet().toList();
    return uniqueCategories;
  }
}
