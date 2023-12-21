class Algorithm {
  final int id;
  final String category;
  final String name;
  final String description;
  final List<String> languageNames; // Add this line

  Algorithm({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.languageNames,
  });

  // Factory method to create Algorithm from JSON
  factory Algorithm.fromJson(Map<String, dynamic> json) {
    return Algorithm(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      languageNames: List<String>.from(json['languages'].keys), // Extract language names
    );
  }
}
