// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/1door/selectdoor1.dart';
import 'package:project01/2door/selectdoor2.dart';
import 'package:project01/30door/selectdoor30.dart';
import 'package:project01/history/history.dart';
import 'package:project01/home.dart';
import 'package:project01/mappage.dart';
import 'package:project01/con_tact.dart';

class Launcher extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    HomePage(),
    MapPage(),
    HistoryPage(),
    Contect(),
  ];
  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset('assets/route.png'),
      label: 'เส้นทาง',
      backgroundColor: Colors.black87,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/map.png'),
      label: 'แผนที่',
      backgroundColor: Colors.black87,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/book.png'),
      label: 'ประวัติ',
      backgroundColor: Colors.black87,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/call.png'),
      label: "ติดต่อ",
      backgroundColor: Colors.black87,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
