import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'algorithm_detail_page.dart';

class CategoriesPage2 extends StatefulWidget {
  const CategoriesPage2({Key? key}) : super(key: key);

  @override
  State<CategoriesPage2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CategoriesPage2> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pythonCodeController = TextEditingController();
  final TextEditingController _javaCodeController = TextEditingController();

  final CollectionReference _algorithms =
  FirebaseFirestore.instance.collection('algorithms');
  String _selectedType = "";
  String _filterCategory = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algorithms'),
        centerTitle: true,
        actions: [
          DropdownButton<String>(
            value: _selectedType,
            onChanged: (String? newValue) {
              setState(() {
                _selectedType = newValue!;
                _filterCategory = _selectedType;
              });
            },
            items: const [
              DropdownMenuItem<String>(
                value: "",
                child: Text('All'),
              ),
              DropdownMenuItem<String>(
                value: 'Sorting',
                child: Text('Sorting'),
              ),
              DropdownMenuItem<String>(
                value: 'Search',
                child: Text('Search'),
              ),
              // Add more categories as needed
            ],
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _filterCategory.isEmpty
            ? _algorithms.snapshots()
            : _algorithms
            .where('category', isEqualTo: _filterCategory)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> algorithms =
            streamSnapshot.data!.docs.toList();

            return ListView.builder(
              itemCount: algorithms.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = algorithms[index];
                final Map<String, dynamic> languages = documentSnapshot['languages'];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: // Inside CategoriesPage2's StreamBuilder, in the ListView.builder
                  GestureDetector(
                    onTap: () {
                      // Navigate to the algorithm description page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlgorithmDescriptionPage(
                            algorithmsId: documentSnapshot['algorithmId'],
                            algorithmName: documentSnapshot['name'],
                            algorithmCategory: documentSnapshot['category'],
                            algorithmDescription: documentSnapshot['description'],
                            pythonCode: languages['python'],
                            javaCode: languages['java'],
                            imageUrl: documentSnapshot['imageUrl'] ?? '', // Pass the image URL
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['category']),
                    ),
                  ),

                );
              },
            );

          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}