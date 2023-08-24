import 'package:comelec/menu/menu_page.dart';
import 'package:flutter/material.dart';

import 'package:comelec/cash_drawer/cash_drawer_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;
  final _pageList = [
    const CashDrawerPage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 12,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale_rounded),
            label: "Cash Drawer",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: "Menu",
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
    );
  }
}
