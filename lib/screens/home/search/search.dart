import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20),
            ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Center(child: TextField(
            decoration: new InputDecoration.collapsed(
                hintText: '搜索'
            ),
          ),
          ),

          ),
        ),
    );

  }
}
