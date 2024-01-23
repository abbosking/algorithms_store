import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommentsPage extends StatefulWidget {
  final String algorithmId;

  CommentsPage({
    required this.algorithmId,
  });

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  CollectionReference commentsCollection =
  FirebaseFirestore.instance.collection('comments');

  TextEditingController commentController = TextEditingController();
  QuerySnapshot? commentsSnapshot;
  User? currentUser; // Firebase User

  @override
  void initState() {
    super.initState();
    _loadComments();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      currentUser = user;
    });
  }

  void _loadComments() async {
    QuerySnapshot querySnapshot = await commentsCollection
        .where('algorithmId', isEqualTo: widget.algorithmId)
        .get();
    setState(() {
      commentsSnapshot = querySnapshot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for Algorithm'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCommentsList(),
          ),
          Divider(height: 1),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    if (commentsSnapshot == null) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: commentsSnapshot!.docs.length,
      itemBuilder: (context, index) {
        var commentData =
        commentsSnapshot!.docs[index].data() as Map<String, dynamic>;
        return ListTile(
          title: Text(commentData['comment']),
          subtitle: Text('Sent by: ${commentData['userName']} (${commentData['userEmail']})'),
        );
      },
    );
  }

  Widget _buildCommentInput() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _addComment();
            },
          ),
        ],
      ),
    );
  }

  void _addComment() async {
    String newComment = commentController.text;
    if (newComment.isNotEmpty && currentUser != null) {
      await commentsCollection.add({
        'algorithmId': widget.algorithmId,
        'comment': newComment,
        'userName': currentUser!.displayName ?? 'Anonymous',
        'userEmail': currentUser!.email ?? 'No Email',
      });
      _loadComments(); // Reload comments after adding a new one
      commentController.clear();
    }
  }
}
