import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Account {
  final int id;
  final String username;
  final String email;
  final String bio;
  final String status;
  final String profileImage;

  Account({
    required this.id,
    required this.username,
    required this.email,
    required this.bio,
    required this.status,
    required this.profileImage,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      bio: json['bio'],
      status: json['status'],
      profileImage: json['profileImage'],
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late Future<Account> account;

  @override
  void initState() {
    super.initState();
    account = loadAccount();
  }

  Future<Account> loadAccount() async {
    final response = await http.get(
      Uri.parse('https://abbosking.github.io/jsons/account.json'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> accountMap = json.decode(response.body);
      return Account.fromJson(accountMap['account']);
    } else {
      throw Exception('Failed to load account data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: FutureBuilder<Account>(
        future: account,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading account data.'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No account data available.'));
          } else {
            Account userAccount = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(userAccount.profileImage),
                  ),
                  SizedBox(height: 16.0),
                  Text('Username: ${userAccount.username}',
                      style: TextStyle(fontSize: 18.0)),
                  Text('Email: ${userAccount.email}',
                      style: TextStyle(fontSize: 18.0)),
                  Text('Bio: ${userAccount.bio}',
                      style: TextStyle(fontSize: 18.0)),
                  Text('Status: ${userAccount.status}',
                      style: TextStyle(fontSize: 18.0)),
                  ElevatedButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text('Sign Out'))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
