import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/screens/home/mutual/post_card.dart';
import 'package:utmcssa_app/screens/home/test_obj.dart';
import 'package:provider/provider.dart';

import '../../../models/post.dart';
import '../../../utils/app_styles.dart';

class PostListStreamBuilder extends StatefulWidget {
  const PostListStreamBuilder({Key? key}) : super(key: key);

  @override
  State<PostListStreamBuilder> createState() => _PostListStreamBuilderState();
}

class _PostListStreamBuilderState extends State<PostListStreamBuilder> {



  @override
  Widget build(BuildContext context) {

    final posts = Provider.of<List<Post>>(context);


    return posts.length == 0
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
              return PostCard(post: posts[index]);
            },
            itemCount: posts.length,
          );
  }
}
