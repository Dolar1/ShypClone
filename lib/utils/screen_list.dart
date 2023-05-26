// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shypclone/screens/home/home_page.dart';
import 'package:shypclone/screens/loads/loads_page.dart';
import 'package:shypclone/screens/profile/profile_page.dart';

List screens = [
  {
    'title': 'HOME',
    'icon': const Icon(Icons.home),
    'widget': HomePage(),
  },
  {
    'title': 'My Loads',
    'icon': const ImageIcon(
      AssetImage(
        "assets/icons/truck.png",
      ),
    ),
    'widget': LoadsPage(),
  },
  {
    'title': 'Profile',
    'icon': const Icon(Icons.person),
    'widget': ProfilePage(),
  },
];
