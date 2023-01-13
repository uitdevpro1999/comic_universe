import 'package:comic_universe/views/pages/category_screen.dart';
import 'package:comic_universe/views/pages/follows_screen.dart';
import 'package:comic_universe/views/pages/home_screen.dart';
import 'package:comic_universe/views/pages/profile_screen.dart';
import 'package:comic_universe/views/pages/ranking/ranking_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
     FollowSreen(),
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
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Theo dõi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor:Colors.grey,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
        unselectedLabelStyle: GoogleFonts.dosis(),
        selectedLabelStyle: GoogleFonts.dosis(),
      ),
    );
  }
}
