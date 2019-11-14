import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  _homeState(username) {
    this.username = username;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var _selectedIndex;

    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Center(
        child: Text('Welcome ' + username),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex = 0,
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
}
