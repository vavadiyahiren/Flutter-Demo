import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:demo/Screens/Chat.dart';
import 'package:demo/Screens/Dashboard.dart';
import 'package:demo/Screens/Users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Setting.dart';

class Home extends StatefulWidget {
  String username;

  Home(String username) {
    this.username = username;
  }

  @override
  _homeState createState() => _homeState(username);
}

class _homeState extends State<Home> with SingleTickerProviderStateMixin {
  String username;
  PageController _pageController;
  double screenHeight, screenWidth;
  final Duration duration = new Duration(milliseconds: 300);
  var isCollapsed = false;

  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation<double> _menuAnimation;
  Animation<Offset> _slideTransition;

  int _selectedIndex = 0;

  _homeState(username) {
    this.username = username;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _animationController = AnimationController(vsync: this, duration: duration);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.6).animate(_animationController);
    _slideTransition = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_animationController);
    _menuAnimation =
        Tween<double>(begin: 1, end: 0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _menu(),
          _buildPages(),
        ],
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPages() {
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0.1 * screenHeight,
      bottom: isCollapsed ? 0 : 0.1 * screenHeight,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      duration: duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 8,
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.menu,
                        color: Colors.purple,
                      ),
                      onTap: () {
                        setState(() {
                          if (isCollapsed) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    Text(
                      "Xr Studio",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.purple,
                    )
                  ],
                ),
                Container(
                  height: screenHeight - 74,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      pageChanged(index);
                    },
                    children: <Widget>[
                      Center(
                        child: Dashboard(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menu() {
    return SlideTransition(
      position: _slideTransition,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Home",
                style: TextStyle(fontSize: 20, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  BottomNavyBar _buildBottomNavigation() {
    return BottomNavyBar(
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
    );
  }
}

AppBar _appBar() {
  return AppBar(
    backgroundColor: Colors.red,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Icon(
        Icons.menu,
        size: 30,
      ),
    ),
    title: Text(
      "Xr Studio",
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.settings,
          size: 30,
        ),
      )
    ],
  );
}
