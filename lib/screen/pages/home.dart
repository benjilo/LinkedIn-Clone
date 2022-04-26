import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterapp/screen/pages/home_page/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.black,
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.home), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.userFriends),
                      title: Text('My network')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.plusCircle),
                      title: Text('Post')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.solidBell),
                      title: Text('Notifications')),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.briefcase),
                      title: Text('Jobs')),
                ]),
            body: _children[_currentIndex],
          ),
        );
      },
    );
  }
}
