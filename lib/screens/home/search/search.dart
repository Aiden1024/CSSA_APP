import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController( length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: TextField(
              decoration: InputDecoration(hintText: '搜索',
                  border: InputBorder.none,

              ),
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
    );
  }
}
