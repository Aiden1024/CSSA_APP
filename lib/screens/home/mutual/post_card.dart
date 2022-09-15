import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../../../utils/app_styles.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            InkWell(

              onTap: () {},
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),//or 15.0
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    color: Color(0xffFF0E58),
                  ),
                ),
                title: Text("标题"),
                subtitle: Text('简介简介简介简介'),
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

                  TextButton(onPressed: () {}, child: Text('  发布人:<用户>  ', style: Styles.headLineStyle4,)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), style: IconButton.styleFrom(highlightColor: Colors.transparent), splashColor: Colors.transparent,),
                      SizedBox(
                        width: 35,
                          child: Text("50"))
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
