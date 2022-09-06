import 'package:flutter/cupertino.dart';
import 'package:utmcssa_app/screens/home/post_card.dart';

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
      children: const [
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
        PostCard(),
      ],
    );
  }
}
