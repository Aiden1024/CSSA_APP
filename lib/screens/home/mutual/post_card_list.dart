import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/screens/home/mutual/post_card.dart';
import 'package:utmcssa_app/screens/home/test_obj.dart';
import 'package:provider/provider.dart';

import '../../../models/post.dart';
import '../../../utils/app_styles.dart';

class PostCardList extends StatefulWidget {
  const PostCardList({Key? key, required this.postList}) : super(key: key);
  final List<Post> postList;

  @override
  State<PostCardList> createState() => _PostCardListState();
}

class _PostCardListState extends State<PostCardList> {



  @override
  Widget build(BuildContext context) {

    return widget.postList.isEmpty
        ? Container(
            padding: EdgeInsets.all(30),
            child:
                Center(child: Text("还没有任何公告哦", style: Styles.headLineStyle3)),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PostCard(post: widget.postList[index]);
            },
            itemCount: widget.postList.length,
          );
  }
}
