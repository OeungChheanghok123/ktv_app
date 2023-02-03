import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/screens/account/account_screen.dart';
import 'package:ktv_app/screens/home/home_screen.dart';
import 'package:ktv_app/utility/text_style.dart';

class MainScreenViewModel extends GetxController {
  static var tabIndex = 0.obs;

  static List<Widget> pageWidgets = [
    HomeScreen(),
    Center(
      child: Text(
        'Index 1: Search',
        style: AppTextStyle.headline2,
      ),
    ),
    Center(
      child: Text(
        'Index 2: Booking',
        style: AppTextStyle.headline2,
      ),
    ),
    Center(
      child: Text(
        'Index 3: Job',
        style: AppTextStyle.headline2,
      ),
    ),
    AccountScreen(),
  ];

  static List<BottomNavigationBarItem> bottomBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.manage_search_outlined),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.schedule_outlined),
      label: 'Booking',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work_outline_outlined),
      label: 'Job',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Account',
    ),
  ];
}
