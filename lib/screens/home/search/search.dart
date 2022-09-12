import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/screens/home/search/search_posts.dart';
import 'package:utmcssa_app/screens/home/search/search_users.dart';
import 'package:utmcssa_app/screens/home/search/user_list.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/services/database.dart';
import '../../../utils/app_styles.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(child: Text("用户", style: TextStyle(color: Colors.black),),),
    Tab(child: Text("公告", style: TextStyle(color: Colors.black),),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Styles.primaryColor,
        primarySwatch: Colors.red
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0.3,
            backgroundColor: Styles.bgColor,
            title: Container(
              margin: EdgeInsets.only(top: 12),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(hintText: '搜索',
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.red,
              tabs: myTabs,
            ),
          ),
          body: const TabBarView(
            children: [
              SearchUsers(),
              SearchPosts()
            ],
          ),
        ),
      ),

    );
  }
}
