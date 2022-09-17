import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/screens/home/mutual/post_card.dart';
import 'package:utmcssa_app/screens/home/test_obj.dart';

import '../../../models/post.dart';

class PostCardList extends StatefulWidget {
  const PostCardList({Key? key}) : super(key: key);

  @override
  State<PostCardList> createState() => _PostCardListState();
}

class _PostCardListState extends State<PostCardList> {
  @override
  Widget build(BuildContext context) {


    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:  [
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),
        PostCard(post: TestObj.testPost,),


      ],
    );
  }
}
