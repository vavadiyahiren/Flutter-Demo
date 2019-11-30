import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:demo/Screens/Chat.dart';
import 'package:demo/Screens/Dashboard.dart';
import 'package:demo/Screens/Users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Characters.dart';
import 'Setting.dart';

class Home extends StatefulWidget {
  String username;

  Home(String username) {
    this.username = username;
  }

  @override
  _homeState createState() => _homeState(username);
}

class _homeState extends State<Home> {
  String username;
  PageController _pageController;

  int _selectedIndex = 0;

  _homeState(username) {
    this.username = username;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: _appbar(),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: <Widget>[
            Center(
              child: Characters(),
            ),
            Center(
              child: Users(),
            ),
            Center(
              child: Chat(),
            ),
            Center(
              child: Setting(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue),
        ],
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
        ),
        child: Icon(
          Icons.account_circle,
          color: Colors.blue,
          size: 30,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.settings,
            color: Colors.blue,
            size: 30,
          ),
        )
      ],
    );
  }
}
