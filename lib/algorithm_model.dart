class Algorithm {
  final String name;
  final String description;
  final List<String> languages;

  Algorithm({
    required this.name,
    required this.description,
    required this.languages,
  });

  factory Algorithm.fromJson(Map<String, dynamic> json) {
    return Algorithm(
      name: json['name'],
      description: json['description'],
      languages: List<String>.from(json['languages']),
    );
  }
}
