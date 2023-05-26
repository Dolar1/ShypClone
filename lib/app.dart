import 'utils/color_tokens.dart';
import 'package:flutter/material.dart';
import 'package:shypclone/utils/screen_list.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  _AppEntryState createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomNavigationBar() {
      return BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: bottomNav,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: screens
            .map(
              (screen) => BottomNavigationBarItem(
                label: screen['title'],
                icon: screen["icon"],
              ),
            )
            .toList(),
        unselectedItemColor: fadedBottomNavColor,
        iconSize: 24,
        selectedItemColor: activeRed,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            screens[_selectedIndex]['widget'],
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
