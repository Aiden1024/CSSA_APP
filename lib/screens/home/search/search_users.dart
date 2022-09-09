import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/screens/home/search/user_list.dart';

import '../../../models/user_profile.dart';
import '../../../services/database.dart';

class SearchUsers extends StatelessWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserProfile>>.value(
        initialData: [],
        value: DatabaseService('').userProfiles,
        child: const UserList()
    );
  }
}
