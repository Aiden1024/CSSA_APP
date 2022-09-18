import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/screens/home/posts/post_list_stream_builder.dart';
import 'package:utmcssa_app/screens/home/profile/post_card_list.dart';

import '../../../models/post.dart';
import '../../../services/database.dart';
import '../../../utils/app_styles.dart';

class PostCardListStream extends StatefulWidget {
  const PostCardListStream({Key? key,}) : super(key: key);

  @override
  State<PostCardListStream> createState() => _PostCardListStreamState();
}

class _PostCardListStreamState extends State<PostCardListStream> {
  @override
  Widget build(BuildContext context) {

    // final uPs = Provider.of<List<Post>>(context);

    return StreamProvider<List<Post>>.value(
        value: DatabaseService('').posts,
        initialData: [],
        child: PostListStreamBuilder(),
    );
  }
}
