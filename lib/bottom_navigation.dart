import 'package:comic_universe/screen/category_screen.dart';
import 'package:comic_universe/screen/follow_screen.dart';
import 'package:comic_universe/screen/home_screen.dart';
import 'package:comic_universe/screen/profile_screen.dart';
import 'package:comic_universe/screen/ranking_screen.dart';
import 'package:flutter/material.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
   final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    RankingScreen(),
    CategloryScreen(),
    FollowScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer_outlined),
            label: 'Xếp hạng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Thể loại',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor:Colors.grey,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
