import 'package:flutter/material.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/screens/home/search/user_tile.dart';
import 'package:provider/provider.dart';
class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final uPs = Provider.of<List<UserProfile>>(context) ?? [];
    print("DEBUGG in USER LIST");
    for (var item in uPs) {
      print(item.username);
    }



    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: uPs.length,
      itemBuilder: (context, index){
        return UserTile(uP: uPs[index]);
      },

      // physics: const NeverScrollableScrollPhysics(),

    );
  }
}
