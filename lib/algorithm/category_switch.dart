import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalmp/algorithm/categories_page.dart';
import 'package:finalmp/algorithm/categories_page2.dart';
import 'package:flutter/material.dart';

import '../account/auth.dart';



class CategorySwitch extends StatefulWidget {
  const CategorySwitch({super.key});

  @override
  State<CategorySwitch> createState() => _CategorySwitchState();
}

class _CategorySwitchState extends State<CategorySwitch> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = getUserData();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    String uid = AuthMethod().getCurrentUserUid();
    return await FirebaseFirestore.instance.collection("users").doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userFuture,
        builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            var userData = snapshot.data!.data();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var userType = userData?['userType'];
                      if (userType == 'admin') {
                        // Navigate to Category1Page for admin
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>  const CategoriesPage1(),
                        ));
                      } else {
                        // Navigate to Category2Page for non-admin users
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>  const CategoriesPage2(),
                        ));
                      }
                    },
                    child: const Text("Go to Category Page"),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
