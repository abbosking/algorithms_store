import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalmp/algorithm/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'image_store_method.dart';

class CategoriesPage1 extends StatefulWidget {
  const CategoriesPage1({Key? key}) : super(key: key);

  @override
  State<CategoriesPage1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CategoriesPage1> {
  final Uuid _uuid = Uuid();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pythonCodeController = TextEditingController();
  final TextEditingController _javaCodeController = TextEditingController();

  Uint8List? _file;

  final CollectionReference _algorithms =
  FirebaseFirestore.instance.collection('algorithms');
  String _selectedType = "";
  String _filterCategory = "";
  String imageUrl = '';
  Future<void> _imagecreaet() async {
    Uint8List? imageFile = await pickImage(ImageSource.gallery);
    if (imageFile != null) {
      String url = await ImageStoreMethods().imageToStorage(imageFile);

      setState(() {
        _file = imageFile;
        imageUrl = url;
      });
    }
  }


  Future<void> _create() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
                child: Padding(
                padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  const Center(
                    child: Text(
                      "Create your algorithm",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue!;
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
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'e.g., Bubble Sort',
                    ),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'A simple sorting algorithm...',
                    ),
                  ),
                  TextField(
                    controller: _pythonCodeController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Python Code',
                      hintText: 'e.g., def bubble_sort(arr): ...',
                    ),
                  ),
                  TextField(
                    controller: _javaCodeController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Java Code',
                      hintText: 'e.g., void bubbleSort(int arr[]) { ... }',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed:_imagecreaet
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        final String category = _selectedType;
                        final String name = _nameController.text;
                        final String description =
                            _descriptionController.text;
                        final String pythonCode =
                            _pythonCodeController.text;
                        final String javaCode = _javaCodeController.text;
                        final String algorithmId = _uuid.v4();

                        await _algorithms.add({
                          "algorithmId": algorithmId,
                          "category": category,
                          "name": name,
                          "description": description,
                          "languages": {
                            "python": pythonCode,
                            "java": javaCode,
                          },
                          "imageUrl": imageUrl,
                        });
                        showSnackBar('Algorithm created successfully', context);

                        _nameController.text = '';
                        _descriptionController.text = '';
                        _pythonCodeController.text = '';
                        _javaCodeController.text = '';

                        Navigator.of(context).pop();
                      },
                      child: const Text("Create"),
                    ),
                  ),
                ],
              ),
                ),
            );
          },
        );
      },
    );
  }

  // Update operation
  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    // Set the initial values based on the documentSnapshot
    String initialCategory = documentSnapshot['category'];
    String initialName = documentSnapshot['name'];
    String initialDescription = documentSnapshot['description'];
    String initialPythonCode = documentSnapshot['languages']['python'];
    String initialJavaCode = documentSnapshot['languages']['java'];

    // Set the initial values to the controllers
    _categoryController.text = initialCategory;
    _nameController.text = initialName;
    _descriptionController.text = initialDescription;
    _pythonCodeController.text = initialPythonCode;
    _javaCodeController.text = initialJavaCode;

    // Create a copy of the initial category to manage changes
    String updatedCategory = initialCategory;

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
                child: Container(
                constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Padding(
            padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Center(
            child: Text(
            "Update your algorithm",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ),
            DropdownButton<String>(
            value: updatedCategory,
            onChanged: (String? newValue) {
            setState(() {
            updatedCategory = newValue!;
            });
            },
            items: const [
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
            TextField(
            controller: _nameController,
            decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'e.g., Bubble Sort',
            ),
            ),
            TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
            labelText: 'Description',
            hintText: 'A simple sorting algorithm...',
            ),
            ),
            TextField(
            controller: _pythonCodeController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
            labelText: 'Python Code',
            hintText: 'e.g., def bubble_sort(arr): ...',
            ),
            ),
            TextField(
            controller: _javaCodeController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
            labelText: 'Java Code',
            hintText: 'e.g., void bubbleSort(int arr[]) { ... }',
            ),
            ),
            IconButton(
            icon: const Icon(Icons.image),
            onPressed: _imagecreaet,
            ),
            const SizedBox(
            height: 20,
            ),
            ElevatedButton(
            onPressed: () async {
                      final String category = updatedCategory;
                      final String name = _nameController.text;
                      final String description = _descriptionController.text;
                      final String pythonCode = _pythonCodeController.text;
                      final String javaCode = _javaCodeController.text;

                      await _algorithms
                          .doc(documentSnapshot.id)
                          .update({
                        "category": category,
                        "name": name,
                        "description": description,
                        "languages": {
                          "python": pythonCode,
                          "java": javaCode,
                        },
                        "imageUrl": imageUrl,
                      })
                          .then((value) => print("Algorithm updated"))
                          .catchError((error) =>
                          print("Failed to update algorithm: $error"));

                      // Clear controllers after updating
                      _nameController.text = '';
                      _descriptionController.text = '';
                      _pythonCodeController.text = '';
                      _javaCodeController.text = '';

                      Navigator.of(context).pop();
                    },
                    child: const Text("Update"),
                  ),
                ],
            ),),),
            );
          },
        );
      },
    );
  }



  // Delete operation
  Future<void> _delete(DocumentSnapshot documentSnapshot) async {
    await _algorithms
        .doc(documentSnapshot.id)
        .delete()
        .then((value) => print("Algorithm deleted"))
        .catchError(
            (error) => print("Failed to delete algorithm: $error"));

    // Show a snackbar for confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Algorithm deleted successfully")),
    );
  }

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
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['category']),
                    onTap: () => _update(documentSnapshot),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _delete(documentSnapshot),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _update(documentSnapshot),
                        ),
                      ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: _create,
        child: const Icon(Icons.add),
      ),
    );
  }
}