import 'package:flutter/cupertino.dart';
import 'package:utmcssa_app/screens/home/post_card_list.dart';
import 'package:utmcssa_app/utils/app_styles.dart';

class SearchPosts extends StatelessWidget {
  const SearchPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.symmetric(horizontal: Styles.standardHorizontalMargin),
        child: PostCardList());
  }
}
