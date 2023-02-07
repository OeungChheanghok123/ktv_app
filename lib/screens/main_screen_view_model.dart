import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/screens/account/account_screen.dart';
import 'package:ktv_app/screens/home/home_screen.dart';
import 'package:ktv_app/screens/job/job_screen.dart';
import 'package:ktv_app/screens/search/search_screen.dart';
import 'package:ktv_app/utility/text_style.dart';

class MainScreenViewModel extends GetxController {
  static var tabIndex = 0.obs;

  static List<Widget> pageWidgets = [
    HomeScreen(),
    const SearchScreen(),
    Center(
      child: Text(
        'Index 2: Booking',
        style: AppTextStyle.headline2,
      ),
    ),
    JobScreen(),
    AccountScreen(),
  ];

  static List<BottomNavigationBarItem> bottomBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.manage_search_rounded),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.schedule_rounded),
      label: 'Booking',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work_rounded),
      label: 'Job',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: 'Account',
    ),
  ];
}
