import 'package:flutter/material.dart';
import 'package:utmcssa_app/screens/home/search/user_tile.dart';
class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: const [
        UserTile(),
        UserTile(),
        UserTile(),
        UserTile(),

      ],
    );
  }
}
