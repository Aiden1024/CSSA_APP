import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            InkWell(

              onTap: () {},
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.pink,
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined), style: IconButton.styleFrom(highlightColor: Colors.transparent), splashColor: Colors.transparent,),
                ],
              ),
            ),

          ],
        ),

      ),
      );
  }
}
