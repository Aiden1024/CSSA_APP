import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:utmcssa_app/screens/home/posts/posts.dart';
import 'package:utmcssa_app/screens/home/profile/profile.dart';
import 'package:utmcssa_app/screens/home/search/search.dart';

import '../../utils/app_styles.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);


  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex=0;

  static final List<Widget> _widgetOption = <Widget>[
    Posts(),
    Search(),
    const Text("CSSA"),
    const Text("feedback"),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Styles.primaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black38,
        items: const [
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "主页"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "搜索"),
          BottomNavigationBarItem(icon: ImageIcon(
            AssetImage("assets/images/logo_icon.png"),
          ),
              activeIcon: ImageIcon(
                AssetImage("assets/images/logo_icon.png"),
                color: Color(0xFFb53029),
              ),
              label: "社团"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_note_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_note_filled),
              label: "反馈"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "个人"),


        ],
      ),
    );
  }
}
