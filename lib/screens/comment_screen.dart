import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:gvl_comments/gvl_comments.dart';
import 'package:sudan_tourist_guide/constant/my_strings.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, this.place});
  static const pageRoute = 'comment_screen';
  final dynamic place;
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

final currentUSer = FirebaseAuth.instance.currentUser;

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.place.title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: myFonts,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: CommentsList(
        threadKey: 'place:${widget.place.id}_XXXX0909difikfkl',
        user: UserProfile(
          id: currentUSer!.uid,
          name: currentUSer!.displayName ?? currentUSer!.email ?? 'user',
        ),
      ),
    );
  }
}
