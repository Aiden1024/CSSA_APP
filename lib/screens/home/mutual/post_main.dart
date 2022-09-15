import 'package:flutter/material.dart';
import 'package:utmcssa_app/models/post.dart';
import 'package:utmcssa_app/utils/app_styles.dart';

class PostMain extends StatefulWidget {
  const PostMain({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<PostMain> createState() => _PostMainState();
}

class _PostMainState extends State<PostMain> {


  @override
  Widget build(BuildContext context) {

    Post post_info = widget.post;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        title: Text(post_info.title),
      ),
    );
  }
}
