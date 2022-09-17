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
    UserProfile testUp = UserProfile(username: "username", formalName: "formalName", bio: "bio", post: [], departments: [], pic: Future<String>.value(""));

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    Post testPost = Post(title: "测试标题", mainText: TestObj.mainText, userProfile:testUp, likes: 20, date: formattedDate, pic: "", subtitle: "subtitle-subtitle");

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:  [
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),
        PostCard(post: testPost,),

      ],
    );
  }
}
