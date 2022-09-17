import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:utmcssa_app/screens/home/mutual/other_profile.dart';
import 'package:utmcssa_app/screens/home/mutual/post_page.dart';

import '../../../models/post.dart';
import '../../../utils/app_styles.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  Icon likeIcon = const Icon(Icons.favorite_border_outlined);
  Icon likedIcon = const Icon(Icons.favorite, color: Colors.pink,);
  int numLikes = 0;

  @override
  Widget build(BuildContext context) {
    numLikes = widget.post.likes;
    return Container(
      child: Card(
        child: Column(
          children: [
            InkWell(

              onTap: () {
                Get.to(() => PostPage(post: widget.post));
              },
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),//or 15.0
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    color: const Color(0xffFF0E58),
                  ),
                ),
                title: Text(widget.post.title),
                subtitle: Text(widget.post.subtitle),
              ),
            ),
            const Divider(
              color: Colors.black12,
              height: 1,
              thickness: 1,

            ),
            SizedBox(
              height: 40,
              child: ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextButton(onPressed: () {
                    Get.to(() => OtherProfile(uP: widget.post.userProfile));
                    },
                    style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)), child: Text('  发布人:${widget.post.userProfile.formalName}  ', style: Styles.headLineStyle4,),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      }, icon: isLiked ? likedIcon : likeIcon, style: IconButton.styleFrom(highlightColor: Colors.transparent), splashColor: Colors.transparent,),
                      SizedBox(
                        width: 35,
                          child: Text("${isLiked? numLikes + 1: numLikes}"))
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),

      ),
      );
  }
}
